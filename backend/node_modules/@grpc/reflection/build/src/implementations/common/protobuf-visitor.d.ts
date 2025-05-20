import { IDescriptorProto, IEnumDescriptorProto, IEnumValueDescriptorProto, IFieldDescriptorProto, IFileDescriptorProto, IMethodDescriptorProto, IOneofDescriptorProto, IServiceDescriptorProto } from 'protobufjs/ext/descriptor';
/** A set of functions for operating on protobuf objects as we visit them in a traversal */
interface Visitor {
    field?: (fqn: string, file: IFileDescriptorProto, field: IFieldDescriptorProto) => void;
    extension?: (fqn: string, file: IFileDescriptorProto, extension: IFieldDescriptorProto) => void;
    oneOf?: (fqn: string, file: IFileDescriptorProto, decl: IOneofDescriptorProto) => void;
    message?: (fqn: string, file: IFileDescriptorProto, msg: IDescriptorProto) => void;
    enum?: (fqn: string, file: IFileDescriptorProto, msg: IEnumDescriptorProto) => void;
    enumValue?: (fqn: string, file: IFileDescriptorProto, msg: IEnumValueDescriptorProto) => void;
    service?: (fqn: string, file: IFileDescriptorProto, msg: IServiceDescriptorProto) => void;
    method?: (fqn: string, file: IFileDescriptorProto, method: IMethodDescriptorProto) => void;
}
/** Visit each node in a protobuf file and perform an operation on it
 *
 * This is useful because protocol buffers has nested objects so if we need to
 * traverse them multiple times then we don't want to duplicate that traversal
 * logic
 *
 * @see Visitor for the interface to interact with the nodes
 */
export declare const visit: (file: IFileDescriptorProto, visitor: Visitor) => void;
export {};
