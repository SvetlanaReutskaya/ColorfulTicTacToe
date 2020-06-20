import 'package:flutter_test/flutter_test.dart';
import 'package:colorchangeflutterapp/main.dart';

void main() {

  // Check that app interface runs correctly
  testWidgets('Home window test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    expect(
        find.text('Hey there \nTap 3 times to play TicTacToe'), findsOneWidget);
  });
}
