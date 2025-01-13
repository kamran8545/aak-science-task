import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/result.dart';
import '../../../../domain/entities/signup_entity.dart';
import '../../../../domain/usecases/signup_usecase.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final SignupUseCase _signupUseCase;

  SignupBloc({required SignupUseCase signupUseCase})
      : _signupUseCase = signupUseCase,
        super(SignUpStateInitial()) {
    on<SignupFirstNameChanged>((event, emit) async {
      emit(state.copyWith(firstName: event.firstName, errorMessage: '',));
    });
    on<SignupLastNameChanged>((event, emit) async {
      emit(state.copyWith(lastName: event.lastName, errorMessage: ''));
    });
    on<SignupUsernameChanged>((event, emit) async {
      emit(state.copyWith(username: event.username, errorMessage: ''));
    });
    on<SignupPasswordChanged>((event, emit) async {
      emit(state.copyWith(password: event.password, errorMessage: ''));
    });
    on<SignupConfirmPasswordChanged>((event, emit) async {
      emit(state.copyWith(confirmPassword: event.confirmPassword, errorMessage: ''));
    });
    on<SignupEmailChanged>((event, emit) async {
      emit(state.copyWith(email: event.email, errorMessage: ''));
    });
    on<SignupCountryChanged>((event, emit) async {
      emit(state.copyWith(country: event.country, errorMessage: ''));
    });
    on<SignupUserTypeChanged>((event, emit) async {
      emit(state.copyWith(userType: event.userType, errorMessage: ''));
    });

    on<SignupSubmitted>((event, emit) async {
      if (state.firstName.isEmpty ||
          state.lastName.isEmpty ||
          state.username.isEmpty ||
          state.password.isEmpty ||
          state.confirmPassword.isEmpty ||
          state.email.isEmpty ||
          state.country.isEmpty ||
          state.userType.isEmpty) {
        emit(state.copyWith(errorMessage: 'Please fill all fields'));
      } else if (state.password != state.confirmPassword) {
        emit(state.copyWith(errorMessage: 'Passwords do not match'));
      } else {
        emit(state.copyWith(isSubmitting: true, errorMessage: ''));
        await onSignUp(state, emit);
        emit(state.copyWith(isSubmitting: false));
      }
    });
  }

  Future<void> onSignUp(SignupState state, Emitter<SignupState> emit) async {
    var result = await _signupUseCase.call(
          SignUpEntity(
            firstName: state.firstName,
            lastName: state.lastName,
            userType: state.userType,
            username: state.username,
            email: state.email,
            country: state.country,
            password: state.password,
            requestStatus: '',
          ),
        );
    switch (result) {
      case Success(successRes: final successReposne):
        emit(state.copyWith(errorMessage: successReposne.requestMessage));
        break;
      case Failure(failureRes: final failureResponse):
        emit(state.copyWith(errorMessage: failureResponse.message));
        break;
    }
  }
}
