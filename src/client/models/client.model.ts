import { Field, GraphQLISODateTime, ObjectType } from '@nestjs/graphql';
import { ObjectId } from 'mongodb';
import { PhotoUrl, PhotoUrlGraph } from 'src/uploadPhoto/models/photo.model';
import { Modify } from 'src/utils/modifyType';
import { SecureContext } from 'tls';

export enum Role {
  Client = 'client',
  Specialist = 'specialist',
}

// export enum Sex {
//   Male = 'male',
//   Female = 'female',
//   Undefined = 'undefined',
// }

export interface Client {
  _id: ObjectId;
  fullName: string;
  phoneNumber: string;
  // sex: Sex;
  email?: string;
  dateOfBirth?: Date;
  photoURL?: PhotoUrl;
}

@ObjectType('Client')
export class ClientGraph
  implements
    Modify<
      Client,
      {
        _id: string;
      }
    >
{
  @Field()
  _id: string;

  @Field()
  fullName: string;

  @Field()
  phoneNumber: string;

  // @Field(() => Sex)
  // sex: Sex;

  @Field({ nullable: true })
  email?: string;

  @Field(() => GraphQLISODateTime, { nullable: true })
  dateOfBirth?: Date;

  @Field(() => PhotoUrlGraph, { nullable: true })
  photoURL?: PhotoUrlGraph;

  constructor(client: Partial<Client>) {
    if (client._id != null) this._id = client._id.toHexString();
    if (client.fullName != null) this.fullName = client.fullName;
    // if (client.sex != null) this.sex = client.sex;
    if (client.phoneNumber != null) this.phoneNumber = client.phoneNumber;
    if (client.email != null) this.email = client.email;
    if (client.photoURL != null) this.photoURL = client.photoURL;
  }
}

@ObjectType('CheckSMSClient')
export class CheckClientSMSGraph {
  @Field(() => ClientGraph, { nullable: true })
  client: ClientGraph;

  @Field()
  token: string;

  constructor(args: { client?: Client; token: string }) {
    if (args.client != null) this.client = new ClientGraph({ ...args.client });
    if (args.token != null) this.token = args.token;
  }
}
