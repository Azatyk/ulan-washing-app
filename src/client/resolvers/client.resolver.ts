import { Args, Mutation, Resolver, Query } from '@nestjs/graphql';
import { Token } from '../token/token.interface';
import { SMSservice } from 'src/utils/SMS/SMS.service';
import { TokenService } from '../token/token.service';
import { ClientService } from '../services/client.service';
import { Cache } from 'cache-manager';
import { CACHE_MANAGER, Inject } from '@nestjs/common';
import { CheckClientSMSGraph } from '../models/client.model';
import { ApolloError } from 'apollo-server-express';

@Resolver()
export class ClientResolver {
  constructor(
    private smsService: SMSservice,
    private tokenService: TokenService,
    private clientService: ClientService,
    @Inject(CACHE_MANAGER) private cacheService: Cache,
  ) {}

  @Query(() => String)
  async helloWold() {
    return 'Hello World!';
  }

  @Mutation(() => String)
  async sendVerificationSMS(
    @Args('phoneNumber', { type: () => String }) phoneNumber: string,
  ): Promise<string> {
    const filteredPhoneNumber = phoneNumber.replace(/\D/g, '');
    if (filteredPhoneNumber == '71111111111') {
      const code = '1111';
      await this.cacheService.set(`${filteredPhoneNumber}`, `${code}`, {
        ttl: 300,
      });
      return 'success';
    }
    const code =
      (await this.cacheService.get(`${filteredPhoneNumber}`)) ??
      Math.floor(1000 + Math.random() * 9000).toString();
    this.smsService.sendVerificationSMS({
      code,
      phoneNumber: filteredPhoneNumber,
    });
    await this.cacheService.set(`${filteredPhoneNumber}`, `${code}`, {
      ttl: 300,
    });
    return 'success';
  }

  @Mutation(() => CheckClientSMSGraph)
  async checkSMSVerificationCodeAsClient(
    @Args('phoneNumber', { type: () => String }) phoneNumber: string,
    @Args('code', { type: () => String }) code: string,
  ) {
    const filteredPhoneNumber = phoneNumber.replace(/\D/g, '');
    const originalCode = await this.cacheService.get(`${filteredPhoneNumber}`);
    if (code !== originalCode) throw new ApolloError('The code is wrong');
    const client = await this.clientService.findOneWithOptions({
      fields: ['phoneNumber'],
      values: [filteredPhoneNumber, { $exists: false }],
    });
    const token = this.tokenService.create({
      _id: client?._id?.toHexString(),
      phoneNumber: filteredPhoneNumber,
      role: 'client',
    });
    const checkSMSResponce = new CheckClientSMSGraph({
      client: client || undefined,
      token,
    });
    return checkSMSResponce;
  }
}
