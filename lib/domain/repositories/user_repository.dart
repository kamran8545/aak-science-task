import '../entities/custom_failure.dart';
import '../entities/result.dart';
import '../entities/signup_entity.dart';

abstract class UserRepository {

  /// This method will SinUp user
  /// Input : [SignUpEntity] contains users data
  /// Output : if operation successful returns [SignUpEntity]
  /// if unsuccessful the response will be [CustomFailure]
  Future<Result<CustomFailure, SignUpEntity>> signup (SignUpEntity signupEntity);

}