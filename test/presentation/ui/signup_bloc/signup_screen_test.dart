import 'package:aak_signup/domain/usecases/signup_usecase.dart';
import 'package:aak_signup/presentation/ui/signup_screen/signup_bloc/signup_bloc.dart';
import 'package:aak_signup/presentation/ui/signup_screen/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../utils/helper.mocks.dart';

void main() {
  late MockUserRepository mockUserRepository;
  late SignupUseCase signupUseCase;

  setUp(() {
    mockUserRepository = MockUserRepository();
    signupUseCase = SignupUseCase(userRepository: mockUserRepository);
  });

  testWidgets('test form validation on SignUp screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            home: BlocProvider(
              create: (_) => SignupBloc(signupUseCase: signupUseCase),
              child: const Scaffold(
                body: SingleChildScrollView(
                  child: SingUpBodyWidget(),
                ),
              ),
            ),
          );
        },
      ),
    );

    await tester.dragUntilVisible(find.byType(ElevatedButton), find.byType(ElevatedButton),  const Offset(-250, 0));
    await tester.pump();

    var button = find.byType(ElevatedButton);
    expect(button, findsOne);

    await tester.tap(button);
    await tester.pump();

    expect(find.text('Please fill all fields'), findsOneWidget);
  });

}
