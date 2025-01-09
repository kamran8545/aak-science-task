import 'package:aak_signup/domain/entities/custom_failure.dart';
import 'package:aak_signup/domain/entities/user_entity.dart';

import '../entities/result.dart';

abstract class UserRepository {

  /// This method will SinUp user
  /// Input : [UserEntity] contains users data
  /// Output : if operation successful returns [bool] true
  /// if unsuccessful the response will be [CustomFailure]
  Future<Result<CustomFailure, bool>> signup (UserEntity userEntity);

}