import { Module } from '@nestjs/common';
import { SMSModule } from 'src/utils/SMS/SMS.service';

import { ClientResolver } from './resolvers/client.resolver';
import { ClientService } from './services/client.service';

@Module({
  imports: [SMSModule],
  providers: [ClientService, ClientResolver],
})
export class ClientModule {}
