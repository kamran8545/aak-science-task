import 'package:aak_signup/data/remote_data_source/remote_data_source_imp.dart';
import 'package:aak_signup/utils/api_urls.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import '../../utils/constants.dart';

void main() {
  final Dio dio = Dio();
  late DioAdapter dioAdapter;
  late RemoteDataSourceImp remoteDataSourceImp;

  setUp(() {
    dioAdapter = DioAdapter(dio: dio, matcher: const FullHttpRequestMatcher());
    dio.httpClientAdapter = dioAdapter;

    remoteDataSourceImp = RemoteDataSourceImp(dio: dio);
  });
k
  test('Should return Success if SignUp is successful', () async {
    dioAdapter.onPost(
      ApiURLs.signupURL,
      data: TestConstants.testSignupEntity.toJson(),
      (mockServer) => mockServer.reply(200, TestConstants.testSignupEntity.toJson()),
    );

    var result = await remoteDataSourceImp.signup(TestConstants.testSignupEntity);
    expect(result.requestStatus, TestConstants.successStatus);
  });

  test('Should return Something Went Wrong if failed to SignUp', () async {
    dioAdapter.onPost(
      ApiURLs.signupURL,
      data: TestConstants.testSignupEntity.toJson(),
      (mockServer) => mockServer.reply(201, TestConstants.somethingWentWrong),
    );

    var result = await remoteDataSourceImp.signup(TestConstants.testSignupEntity);
    expect(result.requestMessage, TestConstants.somethingWentWrong);
  });
}
