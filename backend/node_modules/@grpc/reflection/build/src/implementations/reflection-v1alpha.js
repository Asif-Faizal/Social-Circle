"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ReflectionV1AlphaImplementation = void 0;
const path = require("path");
const grpc = require("@grpc/grpc-js");
const protoLoader = require("@grpc/proto-loader");
const constants_1 = require("./common/constants");
const reflection_v1_1 = require("./reflection-v1");
/** Analyzes a gRPC server and exposes methods to reflect on it
 *
 * NOTE: the files returned by this service may not match the handwritten ones 1:1.
 * This is because proto-loader reorients files based on their package definition,
 * combining any that have the same package.
 *
 * For example: if files 'a.proto' and 'b.proto' are both for the same package 'c' then
 * we will always return a reference to a combined 'c.proto' instead of the 2 files.
 *
 * @privateRemarks as the v1 and v1alpha specs are identical, this implementation extends
 * reflection-v1 and exposes it at the v1alpha package instead
 */
class ReflectionV1AlphaImplementation extends reflection_v1_1.ReflectionV1Implementation {
    addToServer(server) {
        const protoPath = path.join(__dirname, '../../proto/grpc/reflection/v1alpha/reflection.proto');
        const pkgDefinition = protoLoader.loadSync(protoPath, constants_1.PROTO_LOADER_OPTS);
        const pkg = grpc.loadPackageDefinition(pkgDefinition);
        server.addService(pkg.grpc.reflection.v1alpha.ServerReflection.service, {
            ServerReflectionInfo: (stream) => {
                stream.on('end', () => stream.end());
                stream.on('data', (message) => {
                    stream.write(this.handleServerReflectionRequest(message));
                });
            }
        });
    }
}
exports.ReflectionV1AlphaImplementation = ReflectionV1AlphaImplementation;
//# sourceMappingURL=reflection-v1alpha.js.map