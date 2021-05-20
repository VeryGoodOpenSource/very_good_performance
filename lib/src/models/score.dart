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
}
