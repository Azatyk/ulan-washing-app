import { Injectable } from '@nestjs/common';
import { Token } from './token.interface';
import * as jwt from 'jsonwebtoken';
import { PrivateKey, PublicKey } from 'src/utils/keys';
import { signOption } from './token.signOption';

@Injectable()
export class TokenService {
  create(args: Token) {
    const { phoneNumber, _id, role } = args;
    const payload: Token = {
      _id,
      phoneNumber,
      role: args.role,
    };
    const token = jwt.sign(payload, PrivateKey, signOption);
    return token;
  }

  verify(token: string): Token {
    const payload = jwt.verify(token, PublicKey) as Token;
    return payload;
  }
}
