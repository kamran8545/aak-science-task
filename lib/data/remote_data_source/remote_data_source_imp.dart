import 'package:aak_signup/data/remote_data_source/remote_data_source.dart';
import 'package:aak_signup/domain/entities/signup_entity.dart';
import 'package:aak_signup/utils/api_urls.dart';
import 'package:dio/dio.dart';

import '../../domain/entities/custom_failure.dart';
import '../../utils/constants.dart';

class RemoteDataSourceImp extends RemoteDataSource {
  final Dio _dio;

  RemoteDataSourceImp({required Dio dio}) : _dio = dio;

  @override
  Future<SignUpEntity> signup(SignUpEntity signupEntity) async {
    try {
      _dio.options = BaseOptions(
        followRedirects: false,
        validateStatus: (status) {
          return status != null && status < 500;
        },
        headers: {'accept': 'application/json', 'Content-Type': 'application/json'},
      );
      final response = await _dio.post(
        ApiURLs.signupURL,
        data: signupEntity.toJson(),
      );
      if (response.statusCode == 200) {
        return SignUpEntity.fromJson(response.data);
      }

      return SignUpEntity.withResponse(
        requestStatus: AppConstants.failedStatus,
        requestMessage: response.data,
        signupEntity: signupEntity,
      );
    } on DioException catch (error) {
      throw ServerFailure(
        message: error.response == null ? AppConstants.somethingWentWrong : error.response!.data['message'].toString(),
      );
    } catch (e) {
      rethrow;
    }
  }
}
