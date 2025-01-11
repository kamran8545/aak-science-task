import 'package:aak_signup/domain/entities/custom_failure.dart';
import 'package:aak_signup/domain/entities/result.dart';
import 'package:aak_signup/domain/entities/signup_entity.dart';
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
    provideDummy<Result<CustomFailure, SignUpEntity>>(Success(successRes: TestConstants.testSignupEntity));
    provideDummy<Result<CustomFailure, SignUpEntity>>(Success(successRes: TestConstants.failedSignupEntity));
  });

  test('Should return Success if user has signup successfully', () async {
    when(mockUserRepository.signup(TestConstants.testSignupEntity)).thenAnswer(
      (_) async => Success(successRes: TestConstants.testSignupEntity),
    );

    var result = await signupUseCase.call(TestConstants.testSignupEntity);

    expect(((result as Success).successRes as SignUpEntity).requestStatus, TestConstants.successStatus);
  });

  test('Should return Something went wrong if user is failed to SignUp', () async {
    when(mockUserRepository.signup(TestConstants.failedSignupEntity)).thenAnswer(
      (_) async => Success(successRes: TestConstants.failedSignupEntity),
    );

    var result = await signupUseCase.call(TestConstants.failedSignupEntity);

    expect(((result as Success).successRes as SignUpEntity).requestStatus, TestConstants.failedStatus);
  });

  test('Should return CustomFailure if something went wrong while SignUp', () async {
    when(mockUserRepository.signup(TestConstants.testSignupEntity)).thenAnswer(
      (_) async => Failure(failureRes: ServerFailure(message: TestConstants.somethingWentWrong)),
    );

    var result = await signupUseCase.call(TestConstants.testSignupEntity);

    expect(((result as Failure).failureRes as ServerFailure).message, TestConstants.somethingWentWrong);
  });
}
