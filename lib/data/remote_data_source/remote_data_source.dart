import '../../domain/entities/user_entity.dart';

abstract class RemoteDataSource {

  /// This method will SinUp user
  /// Input : [UserEntity] contains users data
  /// Output : if operation successful returns [bool] true
  /// if unsuccessful the respective exception is thrown
  Future<bool> signup (UserEntity userEntity);

}