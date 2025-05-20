"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.visit = void 0;
/** Visit each node in a protobuf file and perform an operation on it
 *
 * This is useful because protocol buffers has nested objects so if we need to
 * traverse them multiple times then we don't want to duplicate that traversal
 * logic
 *
 * @see Visitor for the interface to interact with the nodes
 */
const visit = (file, visitor) => {
    var _a, _b, _c, _d;
    const processField = (prefix, file, field) => {
        const fqn = `${prefix}.${field.name}`;
        if (visitor.field) {
            visitor.field(fqn, file, field);
        }
    };
    const processExtension = (prefix, file, ext) => {
        const fqn = `${prefix}.${ext.name}`;
        if (visitor.extension) {
            visitor.extension(fqn, file, ext);
        }
    };
    const processOneOf = (prefix, file, decl) => {
        const fqn = `${prefix}.${decl.name}`;
        if (visitor.oneOf) {
            visitor.oneOf(fqn, file, decl);
        }
    };
    const processEnum = (prefix, file, decl) => {
        var _a;
        const fqn = `${prefix}.${decl.name}`;
        if (visitor.enum) {
            visitor.enum(fqn, file, decl);
        }
        (_a = decl.value) === null || _a === void 0 ? void 0 : _a.forEach((value) => {
            const valueFqn = `${fqn}.${value.name}`;
            if (visitor.enumValue) {
                visitor.enumValue(valueFqn, file, value);
            }
        });
    };
    const processMessage = (prefix, file, msg) => {
        var _a, _b, _c, _d, _e;
        const fqn = `${prefix}.${msg.name}`;
        if (visitor.message) {
            visitor.message(fqn, file, msg);
        }
        (_a = msg.nestedType) === null || _a === void 0 ? void 0 : _a.forEach((type) => processMessage(fqn, file, type));
        (_b = msg.enumType) === null || _b === void 0 ? void 0 : _b.forEach((type) => processEnum(fqn, file, type));
        (_c = msg.field) === null || _c === void 0 ? void 0 : _c.forEach((field) => processField(fqn, file, field));
        (_d = msg.oneofDecl) === null || _d === void 0 ? void 0 : _d.forEach((decl) => processOneOf(fqn, file, decl));
        (_e = msg.extension) === null || _e === void 0 ? void 0 : _e.forEach((ext) => processExtension(fqn, file, ext));
    };
    const processService = (prefix, file, service) => {
        var _a;
        const fqn = `${prefix}.${service.name}`;
        if (visitor.service) {
            visitor.service(fqn, file, service);
        }
        (_a = service.method) === null || _a === void 0 ? void 0 : _a.forEach((method) => {
            const methodFqn = `${fqn}.${method.name}`;
            if (visitor.method) {
                visitor.method(methodFqn, file, method);
            }
        });
    };
    const packageName = file.package || '';
    (_a = file.enumType) === null || _a === void 0 ? void 0 : _a.forEach((type) => processEnum(packageName, file, type));
    (_b = file.messageType) === null || _b === void 0 ? void 0 : _b.forEach((type) => processMessage(packageName, file, type));
    (_c = file.service) === null || _c === void 0 ? void 0 : _c.forEach((service) => processService(packageName, file, service));
    (_d = file.extension) === null || _d === void 0 ? void 0 : _d.forEach((ext) => processExtension(packageName, file, ext));
};
exports.visit = visit;
//# sourceMappingURL=protobuf-visitor.js.map