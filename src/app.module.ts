import { ApolloDriver } from '@nestjs/apollo';
import { CacheModule, Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { GraphQLModule } from '@nestjs/graphql';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { MongoDBModule } from './utils/mongo/mongo.module';
import { ClientModule } from './client/client.module';
import { AWSPhotoUploadModule } from './uploadPhoto/awsSpace.module';
import { TokenModule } from './client/token/token.module';

@Module({
  imports: [
    MongoDBModule,
    {
      ...CacheModule.register(),
      global: true,
    },
    ConfigModule.forRoot(),
    GraphQLModule.forRoot({
      debug: true,
      playground: true,
      include: [],
      autoSchemaFile: true,
      sortSchema: true,
      driver: ApolloDriver,
      uploads: false,
      context: ({ req, connection }) =>
        connection ? { req: connection.context } : { req },
      installSubscriptionHandlers: true,
    }),
    // AWSPhotoUploadModule,
    ClientModule,
    TokenModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
