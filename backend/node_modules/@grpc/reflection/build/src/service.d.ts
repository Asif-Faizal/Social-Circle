import * as grpc from '@grpc/grpc-js';
import * as protoLoader from '@grpc/proto-loader';
import { ReflectionServerOptions } from './implementations/common/interfaces';
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
export declare class ReflectionService {
    private readonly v1;
    private readonly v1Alpha;
    constructor(pkg: protoLoader.PackageDefinition, options?: ReflectionServerOptions);
    addToServer(server: Pick<grpc.Server, 'addService'>): void;
}
