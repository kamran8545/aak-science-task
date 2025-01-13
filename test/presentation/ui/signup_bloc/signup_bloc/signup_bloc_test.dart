import 'package:aak_signup/domain/usecases/signup_usecase.dart';
import 'package:aak_signup/presentation/ui/signup_screen/signup_bloc/signup_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils/helper.mocks.dart';

void main() {
  late MockUserRepository mockUserRepository;
  late SignupUseCase signupUseCase;
  late SignupBloc signupBloc;

  setUp(() {
    mockUserRepository = MockUserRepository();
    signupUseCase = SignupUseCase(userRepository: mockUserRepository);
    signupBloc = SignupBloc(signupUseCase: signupUseCase);
  });

  group('SignupBloc', () {


    test('initial state is correct', () {
      expect(signupBloc.state, isA<SignUpStateInitial>());
    });

    blocTest<SignupBloc, SignupState>(
      'emits updated state when first name changes',
      build: () => signupBloc,
      act: (bloc) => bloc.add(SignupFirstNameChanged('Kamran')),
      expect: () => [const SignupState(firstName: 'Kamran')],
    );

    blocTest<SignupBloc, SignupState>(
      'emits error when submitting incomplete form',
      build: () => signupBloc,
      act: (bloc) => bloc.add(SignupSubmitted()),
      expect: () => [const SignupState(errorMessage: 'Please fill all fields')],
    );

    tearDown(() {
      signupBloc.close();
    });
  });

}
