

import 'package:aak_signup/domain/entities/user_entity.dart';

class TestConstants {
  static String somethingWentWrong = "Something Went Wrong";

  static UserEntity testUserEntity = UserEntity(
    firstName: 'Kamran',
    lastName: 'Khan',
    username: 'Kamran8545',
    userType: 'researcher',
    email: 'test@gmail.com',
    country: 'Pakistan',
    password: 'Password'
  );
}