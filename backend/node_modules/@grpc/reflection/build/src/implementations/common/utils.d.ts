/** Gets the package scope for a type name
 *
 * @example scope('grpc.reflection.v1.Type') == 'grpc.reflection.v1'
 */
export declare const scope: (path: string, separator?: string) => string;
