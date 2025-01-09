import 'package:aak_signup/data/remote_data_source/remote_data_source.dart';
import 'package:aak_signup/domain/repositories/user_repository.dart';
import 'package:mockito/annotations.dart';

@GenerateMocks(
  [
    UserRepository,
    RemoteDataSource,
  ],
)
void main() {}
