// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: implicit_dynamic_parameter, require_trailing_commas

part of 'configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Configuration _$ConfigurationFromJson(Map<dynamic, dynamic> json) {
  return $checkedNew('Configuration', json, () {
    $checkKeys(json, requiredKeys: const [
      'performance_report',
      'integration_test_expectations',
      'performance_metrics'
    ]);
    final val = Configuration(
      $checkedConvert(json, 'performance_report',
          (v) => PerformanceReport.fromJson(v as Map)),
      $checkedConvert(json, 'integration_test_expectations',
          (v) => IntegrationTestExpectations.fromJson(v as Map)),
      $checkedConvert(json, 'performance_metrics',
          (v) => PerformanceMetrics.fromJson(v as Map)),
    );
    return val;
  }, fieldKeyMap: const {
    'performaceReport': 'performance_report',
    'integrationTestExpectations': 'integration_test_expectations',
    'performanceMetrics': 'performance_metrics'
  });
}

PerformanceReport _$PerformanceReportFromJson(Map<dynamic, dynamic> json) {
  return $checkedNew('PerformanceReport', json, () {
    final val = PerformanceReport(
      $checkedConvert(json, 'directory', (v) => v as String),
    );
    return val;
  });
}

IntegrationTestExpectations _$IntegrationTestExpectationsFromJson(
  Map<dynamic, dynamic> json,
) {
  return $checkedNew('IntegrationTestExpectations', json, () {
    $checkKeys(json, requiredKeys: const [
      'should_fail_build_on_warning',
      'should_fail_build_on_error'
    ]);
    final val = IntegrationTestExpectations(
      shouldFailBuildOnWarning: $checkedConvert(
          json, 'should_fail_build_on_warning', (v) => v as bool),
      shouldFailBuildOnError:
          $checkedConvert(json, 'should_fail_build_on_error', (v) => v as bool),
    );
    return val;
  }, fieldKeyMap: const {
    'shouldFailBuildOnWarning': 'should_fail_build_on_warning',
    'shouldFailBuildOnError': 'should_fail_build_on_error'
  });
}

PerformanceMetrics _$PerformanceMetricsFromJson(Map<dynamic, dynamic> json) {
  return $checkedNew('PerformanceMetrics', json, () {
    $checkKeys(json, requiredKeys: const [
      'missed_frames_threshold',
      'average_frame_build_rate_threshold',
      'worst_frame_build_rate_threshold'
    ]);
    final val = PerformanceMetrics(
      $checkedConvert(json, 'missed_frames_threshold',
          (v) => MissedFramesThreshold.fromJson(v as Map)),
      $checkedConvert(json, 'average_frame_build_rate_threshold',
          (v) => FrameBuildRateThreshold.fromJson(v as Map)),
      $checkedConvert(json, 'worst_frame_build_rate_threshold',
          (v) => FrameBuildRateThreshold.fromJson(v as Map)),
    );
    return val;
  }, fieldKeyMap: const {
    'missedFramesThreshold': 'missed_frames_threshold',
    'averageFrameBuildRateThreshold': 'average_frame_build_rate_threshold',
    'worstFrameBuildRateThreshold': 'worst_frame_build_rate_threshold'
  });
}

MissedFramesThreshold _$MissedFramesThresholdFromJson(
  Map<dynamic, dynamic> json,
) {
  return $checkedNew('MissedFramesThreshold', json, () {
    $checkKeys(json, requiredKeys: const ['warning', 'error']);
    final val = MissedFramesThreshold(
      warning: $checkedConvert(json, 'warning', (v) => v as int),
      error: $checkedConvert(json, 'error', (v) => v as int),
    );
    return val;
  });
}

FrameBuildRateThreshold _$FrameBuildRateThresholdFromJson(
  Map<dynamic, dynamic> json,
) {
  return $checkedNew('FrameBuildRateThreshold', json, () {
    $checkKeys(json, requiredKeys: const [
      'warning_time_in_milliseconds',
      'error_time_in_milliseconds'
    ]);
    final val = FrameBuildRateThreshold(
      warningTimeInMilliseconds: $checkedConvert(
          json, 'warning_time_in_milliseconds', (v) => (v as num).toDouble()),
      errorTimeInMilliseconds: $checkedConvert(
          json, 'error_time_in_milliseconds', (v) => (v as num).toDouble()),
    );
    return val;
  }, fieldKeyMap: const {
    'warningTimeInMilliseconds': 'warning_time_in_milliseconds',
    'errorTimeInMilliseconds': 'error_time_in_milliseconds'
  });
}
