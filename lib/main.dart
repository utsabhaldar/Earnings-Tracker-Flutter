import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/earnings_provider.dart';
import 'presentation/screens/earnings_screen.dart';
import 'presentation/screens/transcript_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => EarningsProvider(),
      child: MaterialApp(
        routes: {
          '/': (context) => EarningsScreen(),
          '/transcript': (context) => TranscriptScreen(),
        },
      ),
    );
  }
}
