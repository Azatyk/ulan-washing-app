import { ArgsType, Field, GraphQLISODateTime } from '@nestjs/graphql';
import { FileUpload, GraphQLUpload } from 'graphql-upload';
// import { Sex } from './client.model';

@ArgsType()
export class CreateClient {
  @Field()
  fullName: string;

  // @Field(() => Sex)
  // sex: Sex;

  @Field(() => GraphQLISODateTime)
  dateOfBirth: Date;

  @Field(() => GraphQLUpload, {
    name: 'avatar',
    nullable: true,
  })
  avatar?: Promise<FileUpload>;
  @Field({ nullable: true })
  email?: string;
}
