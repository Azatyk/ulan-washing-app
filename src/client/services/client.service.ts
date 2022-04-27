import { Inject, Injectable } from '@nestjs/common';
import { Db, ObjectId } from 'mongodb';
import { AWSPhotoUploadService } from 'src/uploadPhoto/awsSpace.service';
import { nullType } from 'src/utils/nullType';
import { Client } from '../models/client.model';
import { CreateClient } from '../models/createClient.args';

@Injectable()
export class ClientService {
  constructor(
    @Inject('DATABASE_CONNECTION')
    private db: Db, // public photoUpload: AWSPhotoUploadService,
  ) {
    this.db
      .collection('client')
      .createIndex({ phoneNumber: 1 }, { unique: true });
  }

  get getCollection() {
    return this.db.collection<Client>('client');
  }

  async findOne(args: { client: Partial<Client> }): Promise<Client | nullType> {
    const { client } = args;
    const clientResponce = await this.getCollection.findOne(client);
    return clientResponce;
  }

  async findOneWithOptions(args: { fields: (keyof Client)[]; values: any[] }) {
    const { fields, values } = args;
    const query: { [index: string]: any } = {};
    fields.map((val, ind) => (query[val] = values[ind]));
    const client = await this.getCollection.findOne(query);
    return client;
  }

  async create(args: CreateClient & { phoneNumber: string }) {
    const { avatar, phoneNumber } = args;
    // TODO
    // const avatarURL =
    //   avatar &&
    //   (await this.photoUpload.uploadImageAWS(
    //     (await avatar).createReadStream(),
    //   ));
    const client: Client = {
      ...args,
      _id: new ObjectId(),
      // photoURL: avatarURL,
      phoneNumber,
    };
    const insertClient = await this.insert({ client });
    return insertClient;
  }

  async insert(args: { client: Client }) {
    const clientResponce = await this.getCollection.insertOne(args.client);
    const client: Client = {
      ...args.client,
      _id: clientResponce.insertedId,
    };
    return client;
  }
}
