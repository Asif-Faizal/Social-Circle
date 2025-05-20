import * as grpc from '@grpc/grpc-js';
import * as protoLoader from '@grpc/proto-loader';
import { ExtensionNumberResponse__Output } from '../generated/grpc/reflection/v1/ExtensionNumberResponse';
import { FileDescriptorResponse__Output } from '../generated/grpc/reflection/v1/FileDescriptorResponse';
import { ListServiceResponse__Output } from '../generated/grpc/reflection/v1/ListServiceResponse';
import { ServerReflectionRequest } from '../generated/grpc/reflection/v1/ServerReflectionRequest';
import { ServerReflectionResponse } from '../generated/grpc/reflection/v1/ServerReflectionResponse';
import { ReflectionServerOptions } from './common/interfaces';
export declare class ReflectionError extends Error {
    readonly statusCode: grpc.status;
    readonly message: string;
    constructor(statusCode: grpc.status, message: string);
}
/** Analyzes a gRPC package definition and exposes methods to reflect on it
 *
 * NOTE: the files returned by this service may not match the handwritten ones 1:1.
 * This is because proto-loader reorients files based on their package definition,
 * combining any that have the same package.
 *
 * For example: if files 'a.proto' and 'b.proto' are both for the same package 'c' then
 * we will always return a reference to a combined 'c.proto' instead of the 2 files.
 */
export declare class ReflectionV1Implementation {
    /** An index of proto files by file name (eg. 'sample.proto') */
    private readonly files;
    /** A graph of file dependencies */
    private readonly fileDependencies;
    /** Pre-computed encoded-versions of each file */
    private readonly fileEncodings;
    /** An index of proto files by type extension relationship
     *
     * extensionIndex[<pkg>.<msg>][<field#>] contains a reference to the file containing an
     * extension for the type "<pkg>.<msg>" and field number "<field#>"
     */
    private readonly extensions;
    /** An index of fully qualified symbol names (eg. 'sample.Message') to the files that contain them */
    private readonly symbols;
    /** An index of the services in the analyzed package(s) */
    private readonly services;
    constructor(root: protoLoader.PackageDefinition, options?: ReflectionServerOptions);
    addToServer(server: Pick<grpc.Server, 'addService'>): void;
    /** Assemble a response for a single server reflection request in the stream */
    handleServerReflectionRequest(message: ServerReflectionRequest): ServerReflectionResponse;
    /** List the full names of registered gRPC services
     *
     * note: the spec is unclear as to what the 'listServices' param can be; most
     * clients seem to only pass '*' but unsure if this should behave like a
     * filter. Until we know how this should behave with different inputs this
     * just always returns *all* services.
     *
     * @returns full-qualified service names (eg. 'sample.SampleService')
     */
    listServices(listServices: string): ListServiceResponse__Output;
    /** Find the proto file(s) that declares the given fully-qualified symbol name
     *
     * @param symbol fully-qualified name of the symbol to lookup
     * (e.g. package.service[.method] or package.type)
     *
     * @returns descriptors of the file which contains this symbol and its imports
     */
    fileContainingSymbol(symbol: string): FileDescriptorResponse__Output;
    /** Find a proto file by the file name
     *
     * @returns descriptors of the file which contains this symbol and its imports
     */
    fileByFilename(filename: string): FileDescriptorResponse__Output;
    /** Find a proto file containing an extension to a message type
     *
     * @returns descriptors of the file which contains this symbol and its imports
     */
    fileContainingExtension(symbol: string, field: number): FileDescriptorResponse__Output;
    allExtensionNumbersOfType(symbol: string): ExtensionNumberResponse__Output;
    private getFileDependencies;
}
