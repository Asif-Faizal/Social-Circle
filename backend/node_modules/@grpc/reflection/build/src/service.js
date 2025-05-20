"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ReflectionService = void 0;
const reflection_v1_1 = require("./implementations/reflection-v1");
const reflection_v1alpha_1 = require("./implementations/reflection-v1alpha");
/** Analyzes a gRPC package and exposes endpoints providing information about
 *  it according to the gRPC Server Reflection API Specification
 *
 * @see https://github.com/grpc/grpc/blob/master/doc/server-reflection.md
 *
 * @remarks
 *
 * in order to keep backwards compatibility as the reflection schema evolves
 * this service contains implementations for each of the published versions
 *
 * @privateRemarks
 *
 * this class acts mostly as a facade to several underlying implementations. This
 * allows us to add or remove support for different versions of the reflection
 * schema without affecting the consumer
 *
 */
class ReflectionService {
    constructor(pkg, options) {
        this.v1 = new reflection_v1_1.ReflectionV1Implementation(pkg, options);
        this.v1Alpha = new reflection_v1alpha_1.ReflectionV1AlphaImplementation(pkg, options);
    }
    addToServer(server) {
        this.v1.addToServer(server);
        this.v1Alpha.addToServer(server);
    }
}
exports.ReflectionService = ReflectionService;
//# sourceMappingURL=service.js.map