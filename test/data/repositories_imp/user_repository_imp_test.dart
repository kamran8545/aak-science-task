import 'package:aak_signup/data/repositories_imp/user_repository_imp.dart';
import 'package:aak_signup/domain/entities/custom_failure.dart';
import 'package:aak_signup/domain/entities/result.dart';
import 'package:aak_signup/domain/entities/signup_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/constants.dart';
import '../../utils/helper.mocks.dart';

void main() {
  late MockRemoteDataSource mockRemoteDataSource;
  late UserRepositoryImp userRepositoryImp;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    userRepositoryImp = UserRepositoryImp(remoteDataSource: mockRemoteDataSource);
  });

  test('Should return Success if signup is successful', () async {
    when(mockRemoteDataSource.signup(TestConstants.testSignupEntity)).thenAnswer((_) async => TestConstants.testSignupEntity);

    var result = await userRepositoryImp.signup(TestConstants.testSignupEntity);

    expect(((result as Success).successRes as SignUpEntity).requestStatus, TestConstants.successStatus);
  });

  test('Should return exception if failed to signup', () async {
    when(mockRemoteDataSource.signup(TestConstants.testSignupEntity)).thenThrow(
      (_) => Exception(
        TestConstants.somethingWentWrong,
      ),
    );

    var result = await userRepositoryImp.signup(TestConstants.testSignupEntity);

    expect(((result as Failure).failureRes as ServerFailure).message, TestConstants.somethingWentWrong);
  });
}
