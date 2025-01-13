part of 'signup_bloc.dart';

sealed class SignupEvent {}

class SignupFirstNameChanged extends SignupEvent {
  final String firstName;
  SignupFirstNameChanged(this.firstName);
}

class SignupLastNameChanged extends SignupEvent {
  final String lastName;
  SignupLastNameChanged(this.lastName);
}

class SignupUsernameChanged extends SignupEvent {
  final String username;
  SignupUsernameChanged(this.username);
}

class SignupPasswordChanged extends SignupEvent {
  final String password;
  SignupPasswordChanged(this.password);
}

class SignupConfirmPasswordChanged extends SignupEvent {
  final String confirmPassword;
  SignupConfirmPasswordChanged(this.confirmPassword);
}

class SignupEmailChanged extends SignupEvent {
  final String email;
  SignupEmailChanged(this.email);
}

class SignupCountryChanged extends SignupEvent {
  final String country;
  SignupCountryChanged(this.country);
}

class SignupUserTypeChanged extends SignupEvent {
  final String userType;
  SignupUserTypeChanged(this.userType);
}

class SignupSubmitted extends SignupEvent {}