import 'package:aak_signup/core/usecase.dart';
import 'package:aak_signup/domain/entities/custom_failure.dart';
import 'package:aak_signup/domain/entities/result.dart';

import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

class SignupUseCase extends UseCase <bool, UserEntity> {

  final UserRepository _userRepository;

  SignupUseCase({required  UserRepository userRepository}) : _userRepository = userRepository ;

  @override
  Future<Result<CustomFailure, bool>> call(UserEntity params) {
    return _userRepository.signup(params);
  }

}