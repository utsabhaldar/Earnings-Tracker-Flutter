import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/earnings_provider.dart';

class TranscriptScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transcript = Provider.of<EarningsProvider>(context).transcript;
    return Scaffold(
      appBar: AppBar(title: Text("Earnings Transcript")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text(transcript),
      ),
    );
  }
}
