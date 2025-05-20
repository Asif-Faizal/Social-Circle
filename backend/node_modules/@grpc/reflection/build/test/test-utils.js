"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const assert = require("assert");
const utils_1 = require("../src/implementations/common/utils");
describe('scope', () => {
    it('traverses upwards in the package scope', () => {
        assert.strictEqual((0, utils_1.scope)('grpc.health.v1.HealthCheckResponse.ServiceStatus'), 'grpc.health.v1.HealthCheckResponse');
        assert.strictEqual((0, utils_1.scope)((0, utils_1.scope)((0, utils_1.scope)((0, utils_1.scope)('grpc.health.v1.HealthCheckResponse.ServiceStatus')))), 'grpc');
    });
    it('returns an empty package when at the top', () => {
        assert.strictEqual((0, utils_1.scope)('Message'), '');
        assert.strictEqual((0, utils_1.scope)(''), '');
    });
    it('handles globally scoped references', () => {
        assert.strictEqual((0, utils_1.scope)('.Message'), '.');
        assert.strictEqual((0, utils_1.scope)((0, utils_1.scope)('.Message')), '');
    });
});
//# sourceMappingURL=test-utils.js.map