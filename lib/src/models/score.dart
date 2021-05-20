enum Rating {
  success,
  warning,
  failure,
}

class Score {
  const Score({
    required this.missedFrames,
    required this.averageBuildRate,
    required this.worstFrameBuildRate,
  });

  final Rating missedFrames;
  final Rating averageBuildRate;
  final Rating worstFrameBuildRate;

  Rating get overall {
    if (missedFrames == Rating.success &&
        averageBuildRate == Rating.success &&
        worstFrameBuildRate == Rating.success) {
      return Rating.success;
    } else if (missedFrames == Rating.failure ||
        averageBuildRate == Rating.failure ||
        worstFrameBuildRate == Rating.failure) {
      return Rating.failure;
    }
    return Rating.warning;
  }
}
