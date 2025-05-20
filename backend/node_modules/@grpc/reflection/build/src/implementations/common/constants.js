"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.PROTO_LOADER_OPTS = void 0;
/** Options to use when loading protobuf files in this repo
*
* @remarks *must* match the proto-loader-gen-types usage in the package.json
* otherwise the generated types may not match the data coming into this service
*/
exports.PROTO_LOADER_OPTS = {
    longs: String,
    enums: String,
    bytes: Array,
    defaults: true,
    oneofs: true
};
//# sourceMappingURL=constants.js.map