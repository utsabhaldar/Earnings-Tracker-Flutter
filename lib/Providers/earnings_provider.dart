import 'package:flutter/material.dart';
import '../data/models/earnings.dart';
import '../data/network/api_service.dart';

class EarningsProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  List<Earnings> _earningsList = [];
  String _transcript = '';
  bool _isLoading = false;

  List<Earnings> get earningsList => _earningsList;
  String get transcript => _transcript;
  bool get isLoading => _isLoading;

  Future<void> fetchEarnings(String ticker) async {
    _isLoading = true;
    notifyListeners();
    _earningsList = await _apiService.fetchEarningsData(ticker);
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchTranscript(String transcriptUrl) async {
    _isLoading = true;
    notifyListeners();
    _transcript = await _apiService.fetchEarningsTranscript(transcriptUrl);
    _isLoading = false;
    notifyListeners();
  }
}
