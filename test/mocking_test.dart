// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:poc/api/api_service.dart';
import 'package:poc/api/models/Post.dart';
import 'package:poc/bootstrap.dart';
import 'package:poc/screens/second.dart';

import 'mocking_test.mocks.dart';
import 'setup/testable_widget.dart';

class ClassToMock {
  test() {
    return "test";
  }
}

@GenerateNiceMocks([MockSpec<ClassToMock>(), MockSpec<ApiService>()])
void main() {
  final apiServiceMock = MockApiService();

  setUp(() => {getIt.registerSingleton<ApiService>(apiServiceMock)});

  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final mock = MockClassToMock();

    when(mock.test()).thenReturn("test2");

    expect(mock.test(), "test2");
  });

  testWidgets("testing mocking", (widgetTester) async {
    final mock = MockApiService();
    final testPost = Post(id: 1, userId: 1, title: "test", body: "test");

    when(mock.getPosts()).thenAnswer((_) async => Future.value([testPost]));

    expect((await mock.getPosts()).first, testPost);
  });

  testWidgets("testing mocking injectino with getIT", (widgetTester) async {
    final testPost = Post(id: 1, userId: 1, title: "test", body: "test");

    when(apiServiceMock.getPosts())
        .thenAnswer((_) async => Future.value([testPost]));

    await widgetTester.pumpWidget(
        makeTestableWidget(child: const SecondScreen(title: "Test")));

    // check if apiService is called
    verify(apiServiceMock.getPosts()).called(1);
  });
}
