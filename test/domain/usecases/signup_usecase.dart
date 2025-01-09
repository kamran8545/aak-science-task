import 'package:aak_signup/domain/entities/custom_failure.dart';
import 'package:aak_signup/domain/entities/result.dart';
import 'package:aak_signup/domain/usecases/signup_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../utils/constants.dart';
import '../../utils/helper.mocks.dart';

void main() {
  late MockUserRepository mockUserRepository;
  late SignupUseCase signupUseCase;

  setUp(() {
    mockUserRepository = MockUserRepository();
    signupUseCase = SignupUseCase(userRepository: mockUserRepository);
    provideDummy<Result<CustomFailure, bool>>(const Success(successRes: true));
  });

  test('Should return true if user has signup successfully', () async {
    when(mockUserRepository.signup(TestConstants.testUserEntity)).thenAnswer(
      (_) async => const Success(successRes: true),
    );

    var result = await signupUseCase.call(TestConstants.testUserEntity);

    expect((result as Success).successRes, true);
  });

  test('Should return false if user is failed to SignUp', () async {
    when(mockUserRepository.signup(TestConstants.testUserEntity)).thenAnswer(
      (_) async => const Success(successRes: false),
    );

    var result = await signupUseCase.call(TestConstants.testUserEntity);

    expect((result as Success).successRes, false);
  });

  test('Should return CustomFailure if something went wrong while SignUp', () async {
    when(mockUserRepository.signup(TestConstants.testUserEntity)).thenAnswer(
      (_) async => Failure(failureRes: ServerFailure(message: TestConstants.somethingWentWrong)),
    );

    var result = await signupUseCase.call(TestConstants.testUserEntity);

    expect(((result as Failure).failureRes as ServerFailure).message, TestConstants.somethingWentWrong);
  });
}
