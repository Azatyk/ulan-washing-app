export interface Token {
  _id?: string;
  phoneNumber: string; //TODO RED: Добавить роль!!
  role: 'specialist' | 'client';
}
