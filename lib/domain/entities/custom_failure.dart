abstract class CustomFailure {
  final String message;

  const CustomFailure({required this.message});
}

class NetworkFailure extends CustomFailure {
  const NetworkFailure({required super.message});
}

class ServerFailure extends CustomFailure {
  const ServerFailure({required super.message});
}

class AuthTokenFailure extends CustomFailure {
  const AuthTokenFailure({required super.message});
}