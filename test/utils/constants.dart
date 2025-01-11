

import 'package:aak_signup/domain/entities/signup_entity.dart';

class TestConstants {
  static String successStatus = "Success";
  static String failedStatus = "Failed";
  static String somethingWentWrong = "Something Went Wrong";

  static SignUpEntity testSignupEntity = SignUpEntity(
    userId: 1,
    firstName: 'Kamran',
    lastName: 'Khan',
    username: 'Kamran8545',
    userType: 'researcher',
    email: 'test@gmail.com',
    country: 'Pakistan',
    password: 'Password',
    requestStatus: successStatus,
    requestMessage: 'Successfully registered your account',
    userActiveStatus: 'Not Active'
  );

  static SignUpEntity failedSignupEntity = SignUpEntity(
    userId: 1,
    firstName: 'Kamran',
    lastName: 'Khan',
    username: 'Kamran8545',
    userType: 'researcher',
    email: 'test@gmail.com',
    country: 'Pakistan',
    password: 'Password',
    requestStatus: failedStatus,
    requestMessage: somethingWentWrong,
    userActiveStatus: 'Not Active'
  );
}