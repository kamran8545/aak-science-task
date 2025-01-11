class SignUpEntity {
  final int userId;
  final String userType;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String country;
  final String password;

  final String requestStatus;
  final String requestMessage;
  final String userActiveStatus;

  SignUpEntity({
    this.userId = -1,
    required this.firstName,
    required this.lastName,
    required this.userType,
    required this.username,
    required this.email,
    required this.country,
    required this.password,
    this.requestStatus = '',
    this.requestMessage = '',
    this.userActiveStatus = '',
  });

  factory SignUpEntity.fromJson(Map<String, dynamic> json) {
    return SignUpEntity(
        userId: json['user_id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        userType: json['user_type'],
        username: json['username'],
        email: json['email'],
        country: json['country'],
        password: json['password'],
        requestStatus: json['status'],
        requestMessage: json['message'],
        userActiveStatus: json['user_active_status']);
  }

  factory SignUpEntity.withResponse({
    required String requestStatus,
    required String requestMessage,
    required SignUpEntity signupEntity,
  }) {
    return SignUpEntity(
      firstName: signupEntity.firstName,
      lastName: signupEntity.lastName,
      userType: signupEntity.userType,
      username: signupEntity.username,
      email: signupEntity.email,
      country: signupEntity.country,
      password: signupEntity.password,
      requestStatus: requestStatus,
      requestMessage: requestMessage,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'first_name': firstName,
      'last_name': lastName,
      'user_type': userType,
      'username': username,
      'email': email,
      'country': country,
      'password': password,
      'status' : requestStatus,
      'message' : requestMessage,
      'user_active_status' : userActiveStatus,
    };
  }
}
