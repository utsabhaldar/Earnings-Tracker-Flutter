import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/earnings.dart';
import '../../utils/constants.dart';

class ApiService {
  final String _baseUrl = 'https://api.api-ninjas.com';

  Future<List<Earnings>> fetchEarningsData(String ticker) async {
    final url = Uri.parse('$_baseUrl/earningscalendar?ticker=$ticker');
    final response = await http.get(url, headers: {'X-Api-Key': API_KEY});

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((e) => Earnings.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load earnings data');
    }
  }

  Future<String> fetchEarningsTranscript(String transcriptUrl) async {
    final url =
        Uri.parse('$_baseUrl/earningscalltranscript?url=$transcriptUrl');
    final response = await http.get(url, headers: {'X-Api-Key': API_KEY});

    if (response.statusCode == 200) {
      return json.decode(response.body)['transcript'];
    } else {
      throw Exception('Failed to load transcript');
    }
  }
}
