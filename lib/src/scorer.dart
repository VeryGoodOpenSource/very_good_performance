import 'models/models.dart';

class Scorer {
  static Score score(Report report, Configuration configuration) {
    final perfMetrics = configuration.performanceMetrics;
    return Score(
      missedFrames: _rating(
        value: report.missedFrameBuildBudgetCount,
        warning: perfMetrics.missedFramesThreshold.warningPercentage,
        error: perfMetrics.missedFramesThreshold.errorPercentage,
      ),
      averageBuildRate: _rating(
        value: report.averageFrameBuildTimeMillis,
        warning: perfMetrics.averageFrameBuildRateThreshold.warningTimeInMillis,
        error: perfMetrics.averageFrameBuildRateThreshold.errorTimeInMillis,
      ),
      worstFrameBuildRate: _rating(
        value: report.worstFrameBuildTimeMillis,
        warning: perfMetrics.worstFrameBuildRateThreshold.warningTimeInMillis,
        error: perfMetrics.worstFrameBuildRateThreshold.errorTimeInMillis,
      ),
    );
  }

  static Rating _rating({
    required num value,
    required num warning,
    required num error,
  }) {
    if (value < warning) {
      return Rating.success;
    } else if (value >= warning && value < error) {
      return Rating.warning;
    }
    return Rating.failure;
  }
}
