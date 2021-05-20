import 'package:ansicolor/ansicolor.dart';
import 'package:barbecue/barbecue.dart';

import 'models/models.dart';

class Printer {
  static void printScore(Report report, Score score) {
    print(Table(
      tableStyle: const TableStyle(border: true),
      cellStyle: const CellStyle(
        borderBottom: true,
        borderRight: true,
        borderLeft: true,
        borderTop: true,
        alignment: TextAlignment.TopLeft,
        paddingRight: 2,
      ),
      header: const TableSection(rows: [
        Row(
          cells: [
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
        ],
      ),
    ).render());
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
}
