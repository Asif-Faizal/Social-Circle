"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.scope = void 0;
/** Gets the package scope for a type name
 *
 * @example scope('grpc.reflection.v1.Type') == 'grpc.reflection.v1'
 */
const scope = (path, separator = '.') => {
    if (!path.includes(separator) || path === separator) {
        return '';
    }
    return path.split(separator).slice(0, -1).join(separator) || separator;
};
exports.scope = scope;
//# sourceMappingURL=utils.js.map