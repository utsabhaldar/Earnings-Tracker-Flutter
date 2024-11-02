class Earnings {
  final String quarter;
  final double estimatedEarnings;
  final double actualEarnings;
  final String transcriptUrl;

  Earnings({
    required this.quarter,
    required this.estimatedEarnings,
    required this.actualEarnings,
    required this.transcriptUrl,
  });

  factory Earnings.fromJson(Map<String, dynamic> json) {
    return Earnings(
      quarter: json['quarter'] ?? '',
      estimatedEarnings: json['estimated_earnings']?.toDouble() ?? 0.0,
      actualEarnings: json['actual_earnings']?.toDouble() ?? 0.0,
      transcriptUrl: json['transcript_url'] ?? '',
    );
  }
}
