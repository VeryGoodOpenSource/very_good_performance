// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Configuration _$ConfigurationFromJson(Map json) {
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

PerformanceReport _$PerformanceReportFromJson(Map json) {
  return $checkedNew('PerformanceReport', json, () {
    final val = PerformanceReport(
      $checkedConvert(json, 'directory', (v) => v as String),
    );
    return val;
  });
}

IntegrationTestExpectations _$IntegrationTestExpectationsFromJson(Map json) {
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

PerformanceMetrics _$PerformanceMetricsFromJson(Map json) {
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

MissedFramesThreshold _$MissedFramesThresholdFromJson(Map json) {
  return $checkedNew('MissedFramesThreshold', json, () {
    $checkKeys(json,
        requiredKeys: const ['warning_percentage', 'error_percentage']);
    final val = MissedFramesThreshold(
      warningPercentage: $checkedConvert(
          json, 'warning_percentage', (v) => (v as num).toDouble()),
      errorPercentage: $checkedConvert(
          json, 'error_percentage', (v) => (v as num).toDouble()),
    );
    return val;
  }, fieldKeyMap: const {
    'warningPercentage': 'warning_percentage',
    'errorPercentage': 'error_percentage'
  });
}

FrameBuildRateThreshold _$FrameBuildRateThresholdFromJson(Map json) {
  return $checkedNew('FrameBuildRateThreshold', json, () {
    $checkKeys(json,
        requiredKeys: const ['warning_time_in_millis', 'error_time_in_millis']);
    final val = FrameBuildRateThreshold(
      warningTimeInMillis: $checkedConvert(
          json, 'warning_time_in_millis', (v) => (v as num).toDouble()),
      errorTimeInMillis: $checkedConvert(
          json, 'error_time_in_millis', (v) => (v as num).toDouble()),
    );
    return val;
  }, fieldKeyMap: const {
    'warningTimeInMillis': 'warning_time_in_millis',
    'errorTimeInMillis': 'error_time_in_millis'
  });
}
