import { FactoryProvider, Global, Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { Db, MongoClient } from 'mongodb';
import { join } from 'path';

export const mongodDbFactory: FactoryProvider<Promise<Db>> = {
  provide: 'DATABASE_CONNECTION',
  useFactory: async (configService: ConfigService): Promise<Db> => {
    try {
      const client = await MongoClient.connect(
        configService.get('MONGO_URL')!,
        {
          // sslCA: join(process.cwd(), 'ca-certificate.crt'),
          keepAlive: true,
          noDelay: true,
        },
      );
      const database = client.db(configService.get('MONGO_DB_NAME'));
      return database;
    } catch (e) {
      throw e;
    }
  },
  inject: [ConfigService],
};

@Global()
@Module({
  imports: [ConfigModule],
  providers: [mongodDbFactory],
  exports: [mongodDbFactory],
})
export class MongoDBModule {}
