class DoTaskInputDto {
  Duration duration;
  DoTaskInputDto({
    required this.duration,
  });

  Map<String, dynamic> toJson() {
    return {
      "totalTime": "${duration.inHours}:${duration.inMinutes.remainder(60)}:${duration.inSeconds.remainder(60)}",
    };
  }
}