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

  test('Should return true if SignUp is successful', () async {
    dioAdapter.onPost(
      ApiURLs.signupURL,
      data: TestConstants.testUserEntity.toJson(),
      (mockServer) => mockServer.reply(200, ''),
    );

    var result = await remoteDataSourceImp.signup(TestConstants.testUserEntity);
    expect(result, true);
  });

  test('Should return false if failed to SignUp', () async {
    dioAdapter.onPost(
      ApiURLs.signupURL,
      data: TestConstants.testUserEntity.toJson(),
      (mockServer) => mockServer.reply(201, ''),
    );

    var result = await remoteDataSourceImp.signup(TestConstants.testUserEntity);
    expect(result, false);
  });
}
