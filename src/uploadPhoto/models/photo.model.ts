import { createUnionType, Field, InputType, ObjectType } from '@nestjs/graphql';
import { FileUpload, GraphQLUpload } from 'graphql-upload';

export interface PhotoUrl {
  thumbnail: string;
  XL: string;
  M: string;
}

@ObjectType('PhotoUrl')
export class PhotoUrlGraph implements PhotoUrl {
  @Field()
  XL: string;

  @Field()
  M: string;

  @Field()
  thumbnail: string;

  constructor(photoUrl: Partial<PhotoUrl>) {
    if (photoUrl.M) this.M = photoUrl.M;
    if (photoUrl.XL) this.XL = photoUrl.XL;
    if (photoUrl.thumbnail) this.thumbnail = photoUrl.thumbnail;
  }
}

@InputType('PhotoUrlInput')
export class PhotoUrlInput implements PhotoUrl {
  @Field()
  XL: string;

  @Field()
  M: string;

  @Field()
  thumbnail: string;
}

@InputType('AddPhoto')
export class AddPhoto {
  @Field(() => GraphQLUpload)
  photo: Promise<FileUpload>;
}

@InputType('RemovePhoto')
export class RemovePhoto {
  @Field(() => PhotoUrlInput)
  photoUrl: PhotoUrl;
}

@InputType('EditPhoto')
export class EditPhotos {
  @Field(() => [AddPhoto], { nullable: true })
  addPhoto?: AddPhoto[];

  @Field(() => [RemovePhoto], { nullable: true })
  removePhoto?: RemovePhoto[];
}
