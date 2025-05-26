import { Metadata, ServerUnaryCall, status } from '@grpc/grpc-js';
import { verifyToken } from '../utils/jwt';

export interface AuthenticatedRequest {
  userId: string;
  metadata: Metadata;
}

export const authenticate = <TRequest, TResponse>(
  call: ServerUnaryCall<TRequest, TResponse>
): AuthenticatedRequest => {
  const metadata = call.metadata;
  const authorization = metadata.get('authorization')[0] as string;

  if (!authorization) {
    throw {
      code: status.UNAUTHENTICATED,
      message: 'No authorization token provided',
    };
  }

  const token = authorization.replace('Bearer ', '');

  try {
    const decoded = verifyToken(token);

    if (decoded.type !== 'access') {
      throw {
        code: status.UNAUTHENTICATED,
        message: 'Invalid token type. Please use an access token.',
      };
    }

    return {
      userId: decoded.id,
      metadata,
    };
  } catch (error) {
    throw {
      code: status.UNAUTHENTICATED,
      message: 'Invalid or expired token',
    };
  }
}; 