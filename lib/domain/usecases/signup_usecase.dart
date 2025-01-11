import '../../core/usecase.dart';
import '../entities/custom_failure.dart';
import '../entities/result.dart';
import '../entities/signup_entity.dart';
import '../repositories/user_repository.dart';

class SignupUseCase extends UseCase <SignUpEntity, SignUpEntity> {

  final UserRepository _userRepository;

  SignupUseCase({required  UserRepository userRepository}) : _userRepository = userRepository ;

  @override
  Future<Result<CustomFailure, SignUpEntity>> call(SignUpEntity params) {
    return _userRepository.signup(params);
  }

}