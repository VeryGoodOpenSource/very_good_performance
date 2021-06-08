import 'dart:io';

import 'package:ansicolor/ansicolor.dart';
import 'package:barbecue/barbecue.dart';

import 'models/models.dart';

class Printer {
  static void printScore(
    Report report,
    Score score,
    Configuration configuration,
  ) {
    final perfMetrics = configuration.performanceMetrics;
    final missedFrames = perfMetrics.missedFramesThreshold;
    final averageBuild = perfMetrics.averageFrameBuildRateThreshold;
    final worstBuild = perfMetrics.worstFrameBuildRateThreshold;
    stdout
      ..writeln(Table(
        tableStyle: const TableStyle(border: true),
        cellStyle: const CellStyle(
          borderBottom: true,
          borderRight: true,
          borderLeft: true,
          borderTop: true,
          alignment: TextAlignment.TopLeft,
          paddingRight: 1,
          paddingLeft: 2,
        ),
        header: const TableSection(rows: [
          Row(
            cells: [
              Cell(''),
              Cell('Missed Frames'),
              Cell('Average Frame Build Time ("ms")'),
              Cell('Worst Frame Build Time("ms")'),
            ],
          ),
        ]),
        body: TableSection(
          rows: [
            Row(
              cells: [
                const Cell('Result'),
                Cell(score.missedFrames.colorize(
                  '${report.missedFrameBuildBudgetCount}',
                )),
                Cell(score.averageBuildRate.colorize(
                  '${report.averageFrameBuildTimeMillis}',
                )),
                Cell(score.worstFrameBuildRate.colorize(
                  '${report.worstFrameBuildTimeMillis}',
                )),
              ],
            ),
            Row(
              cells: [
                const Cell('Warning-Error Range'),
                Cell(
                  '${missedFrames.warning} - '
                  '${missedFrames.error}',
                ),
                Cell(
                  '${averageBuild.warningTimeInMilliseconds} - '
                  '${averageBuild.errorTimeInMilliseconds}',
                ),
                Cell(
                  '${worstBuild.warningTimeInMilliseconds} - '
                  '${worstBuild.errorTimeInMilliseconds}',
                ),
              ],
            ),
          ],
        ),
      ).render())
      ..writeln(score.overall.explanation);
  }

  static void printReportLocation(Configuration configuration, String name) {
    final current = Directory.current.path;
    final message = '''
Two performance reports have been generated. They can be located at:
* $current/${configuration.performaceReport.directory}/$name.timeline.json
* $current/${configuration.performaceReport.directory}/$name.timeline_summary.json
    ''';
    stdout.writeln(message);
  }
}

extension on Rating {
  String colorize(String message) {
    ansiColorDisabled = false;
    switch (this) {
      case Rating.success:
        final pen = AnsiPen()..green(bold: true);
        return pen(message);
      case Rating.warning:
        final pen = AnsiPen()..yellow(bold: true);
        return pen(message);
      case Rating.failure:
        final pen = AnsiPen()..red(bold: true);
        return pen(message);
    }
  }

  String get explanation {
    ansiColorDisabled = false;
    switch (this) {
      case Rating.success:
        final pen = AnsiPen()..green(bold: true);
        return pen('Very Good! Your application is performing well!');
      case Rating.warning:
        final pen = AnsiPen()..yellow(bold: true);
        return pen(r''''
Heads up! Your application might be starting to experience some degradation in 
its performance. You might want to consider launching an investigation to 
understand what components of your application are consuming more resources''');
      case Rating.failure:
        final pen = AnsiPen()..red(bold: true);
        return pen('Error! Your application is not performing well!');
    }
  }
}
