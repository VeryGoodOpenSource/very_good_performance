library very_good_performance;

import 'dart:io';

import 'package:flutter_driver/flutter_driver.dart';
import 'package:very_good_performance/src/models/models.dart';

import 'printer.dart';
import 'scorer.dart';

extension VeryGoodPerformance on FlutterDriver {
  /// It will create two performance reports with the given [reportName]:
  /// * [reportName].timeline.json
  /// * [reportName].timeline_summary.json
  ///
  /// At the same time, it will also print on the `stdout` some performance
  /// information (missed frames, average build time and worst build time).
  ///
  /// It will terminate with a status code of zero if no performance issues were
  /// found. Otherwise, it will look at your `very_good_performance.yaml`
  /// configuration to determine which status code should be used.
  Future<void> capturePerformanceReport({
    required String reportName,
    required Future<dynamic> Function() action,
  }) async {
    final configuration = _configuration;
    final timeline = await traceAction(action);
    final summary = TimelineSummary.summarize(timeline);
    await summary.writeTimelineToFile(
      reportName,
      destinationDirectory: _configuration.performaceReport.directory,
      pretty: true,
    );
    final report = Report.fromJson(summary.summaryJson);
    final score = Scorer.score(report, configuration);
    Printer.printScore(report, score, configuration);
    Printer.printReportLocation(configuration, reportName);
    exit(score.overall.statusCode(configuration.integrationTestExpectations));
  }

  Configuration get _configuration {
    final stringYaml = File('very_good_performance.yaml').readAsStringSync();
    return Configuration.fromString(stringYaml);
  }
}

extension on Rating {
  int statusCode(IntegrationTestExpectations expectations) {
    switch (this) {
      case Rating.success:
        return 0;
      case Rating.warning:
        return expectations.shouldFailBuildOnWarning ? 1 : 0;
      case Rating.failure:
        return expectations.shouldFailBuildOnError ? 1 : 0;
    }
  }
}
