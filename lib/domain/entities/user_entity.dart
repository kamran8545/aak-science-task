
class UserEntity {
  final String userType;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String country;
  final String password;

  UserEntity({
    required this.firstName,
    required this.lastName,
    required this.userType,
    required this.username,
    required this.email,
    required this.country,
    required this.password,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json){
    return UserEntity(
      firstName: json['first_name'],
      lastName: json['last_name'],
      userType: json['user_type'],
      username: json['username'],
      email: json['email'],
      country: json['country'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'first_name': firstName,
      'last_name': lastName,
      'user_type': userType,
      'username': username,
      'email': email,
      'country': country,
      'password': password,
    };
  }
}