import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:very_good_performance/src/models/models.dart';
import 'package:very_good_performance/very_good_performance.dart';

import 'fixtures/fixtures.dart';

class MockFlutterDriver extends Mock implements FlutterDriver {}

void main() {
  late final FlutterDriver flutterDriver;
  final _tempReports = '${Directory.current.path}/test/fixtures/tmp_reports';
  final _tempFile = '${Directory.current.path}/very_good_performance.yaml';

  setUpAll(() async {
    await File('test/fixtures/very_good_performance.yaml').copy(_tempFile);
    flutterDriver = MockFlutterDriver();
  });

  tearDownAll(() {
    if (File(_tempFile).existsSync()) {
      File(_tempFile).deleteSync();
    }
    if (Directory(_tempReports).existsSync()) {
      Directory(_tempReports).deleteSync(recursive: true);
    }
  });

  group('VeryGoodPerformance', () {
    test('measures a successful report', () async {
      final timeline = Timeline.fromJson(successReportJson);
      when(() => flutterDriver.traceAction(any()))
          .thenAnswer((_) async => timeline);
      try {
        await flutterDriver.capturePerformanceReport(
          reportName: 'success',
          action: () async => stdout.writeln('do nothing'),
        );
      } catch (_) {
        fail('this should not throw');
      }
    });

    test('measures a warning report', () async {
      final timeline = Timeline.fromJson(warningReportJson);
      when(() => flutterDriver.traceAction(any()))
          .thenAnswer((_) async => timeline);
      expect(
        () async => await flutterDriver.capturePerformanceReport(
          reportName: 'warning',
          action: () async => stdout.writeln('do nothing'),
        ),
        throwsA(isA<PerformanceException>()),
      );
    });

    test('measures an error report', () async {
      final timeline = Timeline.fromJson(errorReportJson);
      when(() => flutterDriver.traceAction(any()))
          .thenAnswer((_) async => timeline);
      expect(
        () async => await flutterDriver.capturePerformanceReport(
          reportName: 'warning',
          action: () async => stdout.writeln('do nothing'),
        ),
        throwsA(isA<PerformanceException>()),
      );
    });
  });
}
