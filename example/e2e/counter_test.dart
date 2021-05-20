import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:very_good_performance/very_good_performance.dart';

void main() {
  late FlutterDriver driver;

  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  tearDownAll(() {
    driver.close();
  });

  test('tapping on the Increment button updates the counter', () async {
    await driver.capturePerformanceReport(
      reportName: 'counter_performance',
      action: () async {
        await driver.tap(find.byType('FloatingActionButton'));
        expect(await driver.getText(find.text('1')), '1');
        await driver.tap(find.byType('FloatingActionButton'));
        expect(await driver.getText(find.text('2')), '2');
        await driver.tap(find.byType('FloatingActionButton'));
        expect(await driver.getText(find.text('3')), '3');
        await driver.tap(find.byType('FloatingActionButton'));
        expect(await driver.getText(find.text('4')), '4');
        await driver.tap(find.byType('FloatingActionButton'));
        expect(await driver.getText(find.text('5')), '5');
        await driver.tap(find.byType('FloatingActionButton'));
        expect(await driver.getText(find.text('6')), '6');
        await driver.tap(find.byType('FloatingActionButton'));
        expect(await driver.getText(find.text('7')), '7');
        await driver.tap(find.byType('FloatingActionButton'));
        expect(await driver.getText(find.text('8')), '8');
        await driver.tap(find.byType('FloatingActionButton'));
        expect(await driver.getText(find.text('9')), '9');
        await driver.tap(find.byType('FloatingActionButton'));
        expect(await driver.getText(find.text('10')), '10');
      },
    );
  });
}
