import 'package:aak_signup/data/remote_data_source/remote_data_source.dart';
import 'package:aak_signup/domain/entities/user_entity.dart';
import 'package:aak_signup/utils/api_urls.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/custom_failure.dart';
import '../../utils/constants.dart';

class RemoteDataSourceImp extends RemoteDataSource {
  final Dio _dio;

  RemoteDataSourceImp({required Dio dio}) : _dio = dio;

  @override
  Future<bool> signup(UserEntity userEntity) async {
    try {
      final response = await _dio.post(
        ApiURLs.signupURL,
        data: userEntity.toJson(),
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } on DioException catch (error) {
      throw ServerFailure(
        message: error.response == null ? AppConstants.somethingWentWrong : error.response!.data['message'].toString(),
      );
    } catch (e) {
      rethrow;
    }
  }
}
