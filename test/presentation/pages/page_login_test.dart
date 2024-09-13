import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:klontong_app/application/auths/login_cubit/login_cubit.dart';
import 'package:klontong_app/presentation/login/page_login.dart';
import 'package:mockito/mockito.dart';

class MockLoginCubit extends MockCubit<LoginState> implements LoginCubit {}

void main() {
  late MockLoginCubit mockLoginCubit;

  setUp(() {
    mockLoginCubit = MockLoginCubit();
  });

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider<LoginCubit>(
        create: (_) => mockLoginCubit,
        child: PageLogin(),
      ),
    );
  }

  group('PageLogin Widget', () {
    testWidgets('should call loginWithEmailAndPassword on button press',
        (WidgetTester tester) async {
      // Arrange: Mock the initial state of the cubit
      when(mockLoginCubit.state)
          .thenReturn(LoginState.initial()); // Mock initial state

      await tester.pumpWidget(createWidgetUnderTest());

      // Find input fields and button
      final emailField = find.byType(TextFormField).first;
      final passwordField = find.byType(TextFormField).last;
      final loginButton = find.text('Masuk');

      // Act: Simulate user entering data
      await tester.enterText(emailField, 'test@example.com');
      await tester.enterText(passwordField, 'password123');
      await tester.tap(loginButton);

      // Wait for any UI updates
      await tester.pumpAndSettle();

      // Assert: Verify that loginWithEmailAndPassword was called with the right parameters
      verify(mockLoginCubit.loginWithEmailAndPassword(
              'test@example.com', 'password123'))
          .called(1);
    });
  });
}
