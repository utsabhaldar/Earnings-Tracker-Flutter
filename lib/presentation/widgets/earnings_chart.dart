import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../data/models/earnings.dart';

class EarningsChart extends StatelessWidget {
  final List<Earnings> earningsList;
  final Function(String) onTap;

  EarningsChart({required this.earningsList, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        lineBarsData: [
          LineChartBarData(
            spots: earningsList
                .asMap()
                .entries
                .map((entry) =>
                    FlSpot(entry.key.toDouble(), entry.value.estimatedEarnings))
                .toList(),
            isCurved: true,
            color: Colors.blue,
          ),
          LineChartBarData(
            spots: earningsList
                .asMap()
                .entries
                .map((entry) =>
                    FlSpot(entry.key.toDouble(), entry.value.actualEarnings))
                .toList(),
            isCurved: true,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}
