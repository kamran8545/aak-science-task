import 'package:aak_signup/data/remote_data_source/remote_data_source.dart';
import 'package:aak_signup/utils/constants.dart';

import '../../domain/entities/custom_failure.dart';
import '../../domain/entities/result.dart';
import '../../domain/repositories/user_repository.dart';

class UserRepositoryImp extends UserRepository {
  final RemoteDataSource _remoteDataSource;

  UserRepositoryImp({required RemoteDataSource remoteDataSource}) : _remoteDataSource = remoteDataSource;

  @override
  Future<Result<CustomFailure, bool>> signup(userEntity) async {
    try {
      return Success(successRes: await _remoteDataSource.signup(userEntity));
    } on CustomFailure catch (e) {
      return Failure(failureRes: e);
    } catch (e) {
      return const Failure(failureRes: ServerFailure(message: AppConstants.somethingWentWrong));
    }
  }
}
