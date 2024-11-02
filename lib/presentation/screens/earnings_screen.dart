import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/earnings_provider.dart';
import '../widgets/earnings_chart.dart';
import '../widgets/ticker_input.dart';

class EarningsScreen extends StatelessWidget {
  final TextEditingController _tickerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Earnings Tracker")),
      body: Column(
        children: [
          TickerInput(
            controller: _tickerController,
            onSearch: () {
              Provider.of<EarningsProvider>(context, listen: false)
                  .fetchEarnings(_tickerController.text);
            },
          ),
          Expanded(
            child: Consumer<EarningsProvider>(
              builder: (context, provider, child) {
                return provider.isLoading
                    ? CircularProgressIndicator()
                    : EarningsChart(
                        earningsList: provider.earningsList,
                        onTap: (url) {
                          provider.fetchTranscript(url);
                          Navigator.pushNamed(context, '/transcript');
                        },
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
