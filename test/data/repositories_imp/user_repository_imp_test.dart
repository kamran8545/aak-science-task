import 'package:aak_signup/data/repositories_imp/user_repository_imp.dart';
import 'package:aak_signup/domain/entities/custom_failure.dart';
import 'package:aak_signup/domain/entities/result.dart';
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

  test('Should return true if signup is successful', () async {
    when(mockRemoteDataSource.signup(TestConstants.testUserEntity)).thenAnswer((_) async => true);

    var result = await userRepositoryImp.signup(TestConstants.testUserEntity);

    expect((result as Success).successRes, true);
  });

  test('Should return exception if failed to signup', () async {
    when(mockRemoteDataSource.signup(TestConstants.testUserEntity)).thenThrow(
      (_) => Exception(
        TestConstants.somethingWentWrong,
      ),
    );

    var result = await userRepositoryImp.signup(TestConstants.testUserEntity);

    expect(((result as Failure).failureRes as ServerFailure).message, TestConstants.somethingWentWrong);
  });
}
