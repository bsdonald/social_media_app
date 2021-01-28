import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:social_media_app/application/post_actor/post_actor_bloc.dart';
import 'package:social_media_app/infrastructure/posts/post_repository.dart';
import 'package:social_media_app/presentation/pages/new_post_page/new_post_page.dart';

void main() {
  final newPostPage = MediaQuery(
    data: MediaQueryData(),
    child: MaterialApp(
        home: BlocProvider<PostActorBloc>(
      create: (context) => PostActorBloc(
        postRepository: PostRepository(),
      ),
      child: NewPostPage(),
    )),
  );
  final titleKey = Key('titleKey');

  final bodyKey = Key('bodyKey');

  final snackBarText = "Please don't leave form blank";

  testWidgets('If either form is left blank, snackbar should be shown.', (WidgetTester tester) async {
    //build the page
    await tester.pumpWidget(newPostPage);

    //both forms left blank
    await tester.enterText(find.byKey(titleKey), '');
    await tester.enterText(find.byKey(bodyKey), '');
    await tester.tap(find.byType(ElevatedButton));
    await snackBarPumpAndSettle(tester, snackBarText); //snackbar should be built

    //body form left blank
    await tester.enterText(find.byKey(titleKey), 'Test');
    await tester.enterText(find.byKey(bodyKey), '');
    await tester.tap(find.byType(ElevatedButton));
    await snackBarPumpAndSettle(tester, snackBarText); //snackbar should be built

    //title form left blank
    await tester.enterText(find.byKey(titleKey), '');
    await tester.enterText(find.byKey(bodyKey), 'Test');
    await tester.tap(find.byType(ElevatedButton));
    await snackBarPumpAndSettle(tester, snackBarText); //snackbar should be built

    //niether form left blank
    await tester.enterText(find.byKey(titleKey), 'Test');
    await tester.enterText(find.byKey(bodyKey), 'Test');
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();
    expect(find.text(snackBarText), findsNothing); //snackbar should not be built
  });
}

/// make sure snackbar builds and is dismissed before moving to next test
Future snackBarPumpAndSettle(WidgetTester tester, String snackBarText) async {
  await tester.pumpAndSettle(); //start snackbar animation and wait for it to stop
  expect(find.text(snackBarText), findsOneWidget); // make sure snackbar is on screen
  await tester.pump(Duration(seconds: 1)); //wait for snackbar timer to complete
  await tester.pumpAndSettle(); //start snackbar dismiss animation and wait for it to complete
  expect(find.text(snackBarText), findsNothing); //make sure snackbar is gone
}
