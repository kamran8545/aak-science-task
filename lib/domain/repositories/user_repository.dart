import '../entities/custom_failure.dart';
import '../entities/result.dart';
import '../entities/user_entity.dart';

abstract class UserRepository {

  /// This method will SinUp user
  /// Input : [UserEntity] contains users data
  /// Output : if operation successful returns [bool] true
  /// if unsuccessful the response will be [CustomFailure]
  Future<Result<CustomFailure, bool>> signup (UserEntity userEntity);

}