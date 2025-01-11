import '../../domain/entities/signup_entity.dart';

abstract class RemoteDataSource {

  /// This method will SinUp user
  /// Input : [SignUpEntity] contains users data
  /// Output : if operation successful returns [SignUpEntity]
  /// if unsuccessful the respective exception is thrown
  Future<SignUpEntity> signup (SignUpEntity signupEntity);

}