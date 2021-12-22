import 'package:json_annotation/json_annotation.dart';
import 'package:yaml/yaml.dart';

part 'configuration.g.dart';

@JsonSerializable(
  checked: true,
  anyMap: true,
  createFactory: true,
  createToJson: false,
)
class Configuration {
  const Configuration(
    this.performaceReport,
    this.integrationTestExpectations,
    this.performanceMetrics,
  );

  factory Configuration.fromJson(Map json) => _$ConfigurationFromJson(json);

  factory Configuration.fromString(String stringYaml) {
    final yaml = loadYaml(stringYaml) as YamlMap;
    return Configuration.fromJson(yaml);
  }

  @JsonKey(name: 'performance_report', required: true)
  final PerformanceReport performaceReport;
  @JsonKey(name: 'integration_test_expectations', required: true)
  final IntegrationTestExpectations integrationTestExpectations;
  @JsonKey(name: 'performance_metrics', required: true)
  final PerformanceMetrics performanceMetrics;
}

@JsonSerializable(
  checked: true,
  anyMap: true,
  createFactory: true,
  createToJson: false,
)
class PerformanceReport {
  const PerformanceReport(this.directory);

  factory PerformanceReport.fromJson(Map json) =>
      _$PerformanceReportFromJson(json);

  @JsonKey(name: 'directory')
  final String directory;
}

@JsonSerializable(
  checked: true,
  anyMap: true,
  createFactory: true,
  createToJson: false,
)
class IntegrationTestExpectations {
  const IntegrationTestExpectations({
    required this.shouldFailBuildOnWarning,
    required this.shouldFailBuildOnError,
  });

  factory IntegrationTestExpectations.fromJson(Map json) =>
      _$IntegrationTestExpectationsFromJson(json);

  @JsonKey(name: 'should_fail_build_on_warning', required: true)
  final bool shouldFailBuildOnWarning;
  @JsonKey(name: 'should_fail_build_on_error', required: true)
  final bool shouldFailBuildOnError;
}

@JsonSerializable(
  checked: true,
  anyMap: true,
  createFactory: true,
  createToJson: false,
)
class PerformanceMetrics {
  const PerformanceMetrics(
    this.missedFramesThreshold,
    this.averageFrameBuildRateThreshold,
    this.worstFrameBuildRateThreshold,
  );

  factory PerformanceMetrics.fromJson(Map json) =>
      _$PerformanceMetricsFromJson(json);

  @JsonKey(name: 'missed_frames_threshold', required: true)
  final MissedFramesThreshold missedFramesThreshold;
  @JsonKey(name: 'average_frame_build_rate_threshold', required: true)
  final FrameBuildRateThreshold averageFrameBuildRateThreshold;
  @JsonKey(name: 'worst_frame_build_rate_threshold', required: true)
  final FrameBuildRateThreshold worstFrameBuildRateThreshold;
}

@JsonSerializable(
  checked: true,
  anyMap: true,
  createFactory: true,
  createToJson: false,
)
class MissedFramesThreshold {
  const MissedFramesThreshold({
    required this.warning,
    required this.error,
  });

  factory MissedFramesThreshold.fromJson(Map json) =>
      _$MissedFramesThresholdFromJson(json);

  @JsonKey(name: 'warning', required: true)
  final int warning;
  @JsonKey(name: 'error', required: true)
  final int error;
}

@JsonSerializable(
  checked: true,
  anyMap: true,
  createFactory: true,
  createToJson: false,
)
class FrameBuildRateThreshold {
  const FrameBuildRateThreshold({
    required this.warningTimeInMilliseconds,
    required this.errorTimeInMilliseconds,
  });

  factory FrameBuildRateThreshold.fromJson(Map json) =>
      _$FrameBuildRateThresholdFromJson(json);

  @JsonKey(name: 'warning_time_in_milliseconds', required: true)
  final double warningTimeInMilliseconds;
  @JsonKey(name: 'error_time_in_milliseconds', required: true)
  final double errorTimeInMilliseconds;
}
