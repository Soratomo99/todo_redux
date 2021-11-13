import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_management/main.dart';
import 'package:task_management/store/model.dart';
import 'package:task_management/store/reducer.dart';
import 'package:redux/redux.dart';

void main() async {
  testWidgets("Page show all tasks when open app", (tester) async {
    final store =
        Store<AppState>(appStateReducer, initialState: AppState.initialState());
    await tester.pumpWidget(MyApp(store: store));
    expect(find.text('All Tasks'), findsOneWidget);
  });
  testWidgets("Bottom Bar", (tester) async {
    final store =
        Store<AppState>(appStateReducer, initialState: AppState.initialState());
    await tester.pumpWidget(MyApp(store: store));
    expect(find.text('All Tasks'), findsOneWidget);
    expect(find.byIcon(Icons.check), findsOneWidget);
    await tester.tap(find.byIcon(Icons.check));
    await tester.pumpAndSettle();
    expect(find.text('Done Tasks'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.access_time));
    await tester.pumpAndSettle();
    expect(find.text('Doing Tasks'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.list));
    await tester.pumpAndSettle();
    expect(find.text('All Tasks'), findsOneWidget);
  });
  testWidgets("Button add task", (tester) async {
    final store =
        Store<AppState>(appStateReducer, initialState: AppState.initialState());
    await tester.pumpWidget(MyApp(store: store));
    expect(find.text('All Tasks'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(find.text('Create'), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
  });
}
