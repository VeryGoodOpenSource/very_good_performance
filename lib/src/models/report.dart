import 'package:barbecue/barbecue.dart';
import 'package:json_annotation/json_annotation.dart';

part 'report.g.dart';

@JsonSerializable(createFactory: true, createToJson: false)
class Report {
  const Report({
    required this.averageFrameBuildTimeMillis,
    required this.th90PercentileFrameBuildTimeMillis,
    required this.th99PercentileFrameBuildTimeMillis,
    required this.worstFrameBuildTimeMillis,
    required this.missedFrameBuildBudgetCount,
    required this.averageFrameRasterizerTimeMillis,
    required this.th90percentileFrameRasterizerTimeMillis,
    required this.th99percentileFrameRasterizerTimeMillis,
    required this.worstFrameRasterizerTimeMillis,
    required this.missedFrameRasterizerBudgetCount,
    required this.frameCount,
    required this.frameBuildTimes,
    required this.frameRasterizerTimes,
  });

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

  @JsonKey(name: 'average_frame_build_time_millis')
  final double averageFrameBuildTimeMillis;
  @JsonKey(name: '90th_percentile_frame_build_time_millis')
  final double th90PercentileFrameBuildTimeMillis;
  @JsonKey(name: '99th_percentile_frame_build_time_millis')
  final double th99PercentileFrameBuildTimeMillis;
  @JsonKey(name: 'worst_frame_build_time_millis')
  final double worstFrameBuildTimeMillis;
  @JsonKey(name: 'missed_frame_build_budget_count')
  final int missedFrameBuildBudgetCount;
  @JsonKey(name: 'average_frame_rasterizer_time_millis')
  final double averageFrameRasterizerTimeMillis;
  @JsonKey(name: '90th_percentile_frame_rasterizer_time_millis')
  final double th90percentileFrameRasterizerTimeMillis;
  @JsonKey(name: '99th_percentile_frame_rasterizer_time_millis')
  final double th99percentileFrameRasterizerTimeMillis;
  @JsonKey(name: 'worst_frame_rasterizer_time_millis')
  final double worstFrameRasterizerTimeMillis;
  @JsonKey(name: 'missed_frame_rasterizer_budget_count')
  final int missedFrameRasterizerBudgetCount;
  @JsonKey(name: 'frame_count')
  final int frameCount;
  @JsonKey(name: 'frame_build_times')
  final List<int> frameBuildTimes;
  @JsonKey(name: 'frame_rasterizer_times')
  final List<int> frameRasterizerTimes;

  String toTable() {
    return Table(
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
              Cell('$missedFrameBuildBudgetCount'),
              Cell('$averageFrameBuildTimeMillis'),
              Cell('$worstFrameBuildTimeMillis'),
            ],
          ),
        ],
      ),
    ).render();
  }
}
