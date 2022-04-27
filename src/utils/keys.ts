import { join } from 'path';
import * as fs from 'fs';
const pathToPrivateKey = join(process.cwd(), 'privateKey.cer');
const pathToPublicKey = join(process.cwd(), 'publicKey.cer');
export const PrivateKey = fs.readFileSync(pathToPrivateKey, {
  encoding: 'utf-8',
});
export const PublicKey = fs.readFileSync(pathToPublicKey, {
  encoding: 'utf-8',
});
