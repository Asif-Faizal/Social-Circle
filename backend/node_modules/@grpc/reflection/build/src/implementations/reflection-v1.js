"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ReflectionV1Implementation = exports.ReflectionError = void 0;
const path = require("path");
const descriptor_1 = require("protobufjs/ext/descriptor");
const grpc = require("@grpc/grpc-js");
const protoLoader = require("@grpc/proto-loader");
const protobuf_visitor_1 = require("./common/protobuf-visitor");
const utils_1 = require("./common/utils");
const constants_1 = require("./common/constants");
class ReflectionError extends Error {
    constructor(statusCode, message) {
        super(message);
        this.statusCode = statusCode;
        this.message = message;
    }
}
exports.ReflectionError = ReflectionError;
/** Analyzes a gRPC package definition and exposes methods to reflect on it
 *
 * NOTE: the files returned by this service may not match the handwritten ones 1:1.
 * This is because proto-loader reorients files based on their package definition,
 * combining any that have the same package.
 *
 * For example: if files 'a.proto' and 'b.proto' are both for the same package 'c' then
 * we will always return a reference to a combined 'c.proto' instead of the 2 files.
 */
class ReflectionV1Implementation {
    constructor(root, options) {
        /** An index of proto files by file name (eg. 'sample.proto') */
        this.files = {};
        /** A graph of file dependencies */
        this.fileDependencies = new Map();
        /** Pre-computed encoded-versions of each file */
        this.fileEncodings = new Map();
        /** An index of proto files by type extension relationship
         *
         * extensionIndex[<pkg>.<msg>][<field#>] contains a reference to the file containing an
         * extension for the type "<pkg>.<msg>" and field number "<field#>"
         */
        this.extensions = {};
        /** An index of fully qualified symbol names (eg. 'sample.Message') to the files that contain them */
        this.symbols = {};
        /** An index of the services in the analyzed package(s) */
        this.services = {};
        Object.values(root).forEach(({ fileDescriptorProtos }) => {
            if (Array.isArray(fileDescriptorProtos)) { // we use an array check to narrow the type
                fileDescriptorProtos.forEach((bin) => {
                    const proto = descriptor_1.FileDescriptorProto.decode(bin);
                    if (proto.name && !this.files[proto.name]) {
                        this.files[proto.name] = proto;
                    }
                });
            }
        });
        // Pass 1: Index Values
        const serviceWhitelist = new Set(options === null || options === void 0 ? void 0 : options.services);
        const index = (fqn, file) => (this.symbols[fqn] = file);
        Object.values(this.files).forEach((file) => (0, protobuf_visitor_1.visit)(file, {
            field: index,
            oneOf: index,
            message: index,
            method: index,
            enum: index,
            enumValue: index,
            service: (fqn, file, service) => {
                index(fqn, file);
                if ((options === null || options === void 0 ? void 0 : options.services) === undefined || serviceWhitelist.has(fqn)) {
                    this.services[fqn] = service;
                }
            },
            extension: (fqn, file, ext) => {
                index(fqn, file);
                const extendeeName = ext.extendee || '';
                this.extensions[extendeeName] = Object.assign(Object.assign({}, (this.extensions[extendeeName] || {})), { [ext.number || -1]: file });
            },
        }));
        // Pass 2: Link References To Values
        // NOTE: this should be unnecessary after https://github.com/grpc/grpc-node/issues/2595 is resolved
        const addReference = (ref, sourceFile, pkgScope) => {
            var _a;
            if (!ref) {
                return; // nothing to do
            }
            let referencedFile = null;
            if (ref.startsWith('.')) {
                /* absolute reference -- In files with no package, symbols are
                 * populated in the symbols table with a leading period in the key.
                 * If there is a package, the symbol does not have a leading period in
                 * the key. For simplicity, we check without the period, then with it.
                 */
                referencedFile = (_a = this.symbols[ref.slice(1)]) !== null && _a !== void 0 ? _a : this.symbols[ref];
            }
            else {
                // relative reference -- need to seek upwards up the current package scope until we find it
                let pkg = pkgScope;
                while (pkg && !referencedFile) {
                    referencedFile = this.symbols[`${pkg.replace(/\.$/, '')}.${ref}`];
                    pkg = (0, utils_1.scope)(pkg);
                }
                // if we didn't find anything then try just a FQN lookup
                if (!referencedFile) {
                    referencedFile = this.symbols[ref];
                }
            }
            if (!referencedFile) {
                console.warn(`Could not find file associated with reference ${ref}`);
                return;
            }
            if (referencedFile !== sourceFile) {
                const existingDeps = this.fileDependencies.get(sourceFile) || [];
                this.fileDependencies.set(sourceFile, [referencedFile, ...existingDeps]);
            }
        };
        Object.values(this.files).forEach((file) => (0, protobuf_visitor_1.visit)(file, {
            field: (fqn, file, field) => addReference(field.typeName || '', file, (0, utils_1.scope)(fqn)),
            extension: (fqn, file, ext) => addReference(ext.typeName || '', file, (0, utils_1.scope)(fqn)),
            method: (fqn, file, method) => {
                addReference(method.inputType || '', file, (0, utils_1.scope)(fqn));
                addReference(method.outputType || '', file, (0, utils_1.scope)(fqn));
            },
        }));
        // Pass 3: pre-compute file encoding since that can be slow and is done frequently
        Object.values(this.files).forEach(file => {
            this.fileEncodings.set(file, descriptor_1.FileDescriptorProto.encode(file).finish());
        });
    }
    addToServer(server) {
        const protoPath = path.join(__dirname, '../../proto/grpc/reflection/v1/reflection.proto');
        const pkgDefinition = protoLoader.loadSync(protoPath, constants_1.PROTO_LOADER_OPTS);
        const pkg = grpc.loadPackageDefinition(pkgDefinition);
        server.addService(pkg.grpc.reflection.v1.ServerReflection.service, {
            ServerReflectionInfo: (stream) => {
                stream.on('end', () => stream.end());
                stream.on('data', (message) => {
                    stream.write(this.handleServerReflectionRequest(message));
                });
            }
        });
    }
    /** Assemble a response for a single server reflection request in the stream */
    handleServerReflectionRequest(message) {
        var _a, _b;
        const response = {
            validHost: message.host,
            originalRequest: message
        };
        try {
            switch (message.messageRequest) {
                case 'listServices':
                    response.listServicesResponse = this.listServices(message.listServices || '');
                    break;
                case 'fileContainingSymbol':
                    response.fileDescriptorResponse = this.fileContainingSymbol(message.fileContainingSymbol || '');
                    break;
                case 'fileByFilename':
                    response.fileDescriptorResponse = this.fileByFilename(message.fileByFilename || '');
                    break;
                case 'fileContainingExtension':
                    response.fileDescriptorResponse = this.fileContainingExtension(((_a = message.fileContainingExtension) === null || _a === void 0 ? void 0 : _a.containingType) || '', ((_b = message.fileContainingExtension) === null || _b === void 0 ? void 0 : _b.extensionNumber) || -1);
                    break;
                case 'allExtensionNumbersOfType':
                    response.allExtensionNumbersResponse = this.allExtensionNumbersOfType(message.allExtensionNumbersOfType || '');
                    break;
                default:
                    throw new ReflectionError(grpc.status.UNIMPLEMENTED, `Unimplemented method for request: ${message.messageRequest}`);
            }
        }
        catch (e) {
            if (e instanceof ReflectionError) {
                response.errorResponse = {
                    errorCode: e.statusCode,
                    errorMessage: e.message,
                };
            }
            else {
                response.errorResponse = {
                    errorCode: grpc.status.UNKNOWN,
                    errorMessage: 'Failed to process gRPC reflection request: unknown error',
                };
            }
        }
        return response;
    }
    /** List the full names of registered gRPC services
     *
     * note: the spec is unclear as to what the 'listServices' param can be; most
     * clients seem to only pass '*' but unsure if this should behave like a
     * filter. Until we know how this should behave with different inputs this
     * just always returns *all* services.
     *
     * @returns full-qualified service names (eg. 'sample.SampleService')
     */
    listServices(listServices) {
        return { service: Object.keys(this.services).map((service) => ({ name: service })) };
    }
    /** Find the proto file(s) that declares the given fully-qualified symbol name
     *
     * @param symbol fully-qualified name of the symbol to lookup
     * (e.g. package.service[.method] or package.type)
     *
     * @returns descriptors of the file which contains this symbol and its imports
     */
    fileContainingSymbol(symbol) {
        const file = this.symbols[symbol];
        if (!file) {
            throw new ReflectionError(grpc.status.NOT_FOUND, `Symbol not found: ${symbol}`);
        }
        const deps = this.getFileDependencies(file);
        return {
            fileDescriptorProto: [file, ...deps].map((file) => this.fileEncodings.get(file) || new Uint8Array())
        };
    }
    /** Find a proto file by the file name
     *
     * @returns descriptors of the file which contains this symbol and its imports
     */
    fileByFilename(filename) {
        const file = this.files[filename];
        if (!file) {
            throw new ReflectionError(grpc.status.NOT_FOUND, `Proto file not found: ${filename}`);
        }
        const deps = this.getFileDependencies(file);
        return {
            fileDescriptorProto: [file, ...deps].map((file) => this.fileEncodings.get(file) || new Uint8Array),
        };
    }
    /** Find a proto file containing an extension to a message type
     *
     * @returns descriptors of the file which contains this symbol and its imports
     */
    fileContainingExtension(symbol, field) {
        const extensionsByFieldNumber = this.extensions[symbol] || {};
        const file = extensionsByFieldNumber[field];
        if (!file) {
            throw new ReflectionError(grpc.status.NOT_FOUND, `Extension not found for symbol ${symbol} at field ${field}`);
        }
        const deps = this.getFileDependencies(file);
        return {
            fileDescriptorProto: [file, ...deps].map((file) => this.fileEncodings.get(file) || new Uint8Array()),
        };
    }
    allExtensionNumbersOfType(symbol) {
        if (!(symbol in this.extensions)) {
            throw new ReflectionError(grpc.status.NOT_FOUND, `Extensions not found for symbol ${symbol}`);
        }
        const fieldNumbers = Object.keys(this.extensions[symbol]).map((key) => Number(key));
        return {
            baseTypeName: symbol,
            extensionNumber: fieldNumbers,
        };
    }
    getFileDependencies(file) {
        var _a;
        const visited = new Set();
        const toVisit = [...(this.fileDependencies.get(file) || [])];
        while (toVisit.length > 0) {
            const current = toVisit.pop();
            if (!current || visited.has(current)) {
                continue;
            }
            visited.add(current);
            toVisit.push(...((_a = this.fileDependencies.get(current)) === null || _a === void 0 ? void 0 : _a.filter((dep) => !visited.has(dep))) || []);
        }
        return Array.from(visited);
    }
}
exports.ReflectionV1Implementation = ReflectionV1Implementation;
//# sourceMappingURL=reflection-v1.js.map