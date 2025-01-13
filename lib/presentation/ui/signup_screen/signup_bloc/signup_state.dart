part of 'signup_bloc.dart';

class SignupState extends Equatable {
  final String firstName;
  final String lastName;
  final String username;
  final String password;
  final String confirmPassword;
  final String email;
  final String country;
  final String userType;
  final bool showDialog;
  final bool isSubmitting;
  final String errorMessage;

  const SignupState({
    this.firstName = '',
    this.lastName = '',
    this.username = '',
    this.password = '',
    this.confirmPassword = '',
    this.email = '',
    this.country = '',
    this.userType = '',
    this.showDialog = false,
    this.isSubmitting = false,
    this.errorMessage = '',
  });

  SignupState copyWith({
    String? firstName,
    String? lastName,
    String? username,
    String? password,
    String? confirmPassword,
    String? email,
    String? country,
    String? userType,
    bool? isFormValid,
    bool? isSubmitting,
    String? errorMessage,
  }) {
    return SignupState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      username: username ?? this.username,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      email: email ?? this.email,
      country: country ?? this.country,
      userType: userType ?? this.userType,
      showDialog: isFormValid ?? showDialog,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    firstName,
    lastName,
    userType,
    username,
    email,
    country,
  ];
}


class SignUpStateInitial extends SignupState {}