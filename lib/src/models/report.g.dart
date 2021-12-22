// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, require_trailing_commas

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Report _$ReportFromJson(Map<String, dynamic> json) {
  return Report(
    averageFrameBuildTimeMillis:
        (json['average_frame_build_time_millis'] as num).toDouble(),
    th90PercentileFrameBuildTimeMillis:
        (json['90th_percentile_frame_build_time_millis'] as num).toDouble(),
    th99PercentileFrameBuildTimeMillis:
        (json['99th_percentile_frame_build_time_millis'] as num).toDouble(),
    worstFrameBuildTimeMillis:
        (json['worst_frame_build_time_millis'] as num).toDouble(),
    missedFrameBuildBudgetCount: json['missed_frame_build_budget_count'] as int,
    averageFrameRasterizerTimeMillis:
        (json['average_frame_rasterizer_time_millis'] as num).toDouble(),
    th90percentileFrameRasterizerTimeMillis:
        (json['90th_percentile_frame_rasterizer_time_millis'] as num)
            .toDouble(),
    th99percentileFrameRasterizerTimeMillis:
        (json['99th_percentile_frame_rasterizer_time_millis'] as num)
            .toDouble(),
    worstFrameRasterizerTimeMillis:
        (json['worst_frame_rasterizer_time_millis'] as num).toDouble(),
    missedFrameRasterizerBudgetCount:
        json['missed_frame_rasterizer_budget_count'] as int,
    frameCount: json['frame_count'] as int,
    frameBuildTimes: (json['frame_build_times'] as List<dynamic>)
        .map((e) => e as int)
        .toList(),
    frameRasterizerTimes: (json['frame_rasterizer_times'] as List<dynamic>)
        .map((e) => e as int)
        .toList(),
  );
}
