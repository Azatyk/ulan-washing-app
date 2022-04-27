import { HttpModule, HttpService } from '@nestjs/axios';
import { Injectable, Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { lastValueFrom } from 'rxjs';

@Injectable()
export class SMSservice {
  constructor(
    private configService: ConfigService,
    private httpService: HttpService,
  ) {}

  sendVerificationSMS(args: { code: string; phoneNumber: string }) /*void*/ {
    const { code, phoneNumber } = args;
    const auth = {
      login: this.configService.get('SMSLOGIN'),
      password: this.configService.get('SMSPASSWORD'),
    };
    const send = this.httpService.get(
      `https://smsc.kz/sys/send.php?login=${auth.login}&psw=${auth.password}&phones=${phoneNumber}&mes=Vash%20kod%20podtverjdenie%20TimeApp:%20${code}`,
    );
    return lastValueFrom(send);
  }
}

@Module({
  imports: [ConfigModule, HttpModule],
  providers: [SMSservice],
  exports: [SMSservice],
})
export class SMSModule {}
