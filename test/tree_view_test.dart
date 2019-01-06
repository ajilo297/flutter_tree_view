import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tree_view/tree_view.dart';

/// Tree view tests
void main() {
  group('UI Tests', () {
    testWidgets(
      'Test with 2 parents and 3 and 4 children each',
      (tester) async {
        await _loadTester(
          tester,
          parentList: [
            Parent(
              parent: _getCardWrapper(child: Text('P1')),
              childList: ChildList(
                children: <Widget>[
                  _getCardWrapper(child: Text('C11')),
                  _getCardWrapper(child: Text('C12')),
                  _getCardWrapper(child: Text('C13')),
                ],
              ),
            ),
            Parent(
              parent: _getCardWrapper(child: Text('P2')),
              childList: ChildList(
                children: <Widget>[
                  _getCardWrapper(child: Text('C21')),
                  _getCardWrapper(child: Text('C22')),
                  _getCardWrapper(child: Text('C23')),
                  _getCardWrapper(child: Text('C24')),
                ],
              ),
            ),
          ],
        );

        expect(find.widgetWithText(Parent, 'P1'), findsOneWidget);
        expect(find.widgetWithText(Parent, 'P2'), findsOneWidget);

        await tester.tap(find.widgetWithText(Parent, 'P1'));
        await tester.pumpAndSettle(Duration(seconds: 5));

        expect(find.text('C11'), findsOneWidget);
        expect(find.text('C12'), findsOneWidget);
        expect(find.text('C13'), findsOneWidget);
      },
    );
  });
}

Widget _getCardWrapper({@required Widget child}) {
  return Card(
      child: Container(
    width: double.infinity,
    child: child,
    padding: EdgeInsets.all(16.0),
  ));
}

Future<void> _loadTester(
  WidgetTester tester, {
  List<Parent> parentList = const [],
  bool hasScrollbar = false,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: Container(
          child: TreeView(
            parentList: parentList,
            hasScrollBar: hasScrollbar,
          ),
        ),
      ),
    ),
  );
}
