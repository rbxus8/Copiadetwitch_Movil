import 'dart:convert';
import 'package:http/http.dart' as http;

class TwitchService {
  static const String _clientId = '79kohu7spf9barypkoek6t7pnn1myl';
  static const String _clientSecret = 'xuvqt5jly72onibbinmnmtb6r9u5l4';
  static const String _baseUrl = 'https://api.twitch.tv/helix';

  String? _accessToken;

  Future<void> authenticate() async {
    final response = await http.post(
      Uri.parse('https://id.twitch.tv/oauth2/token?client_id=$_clientId&client_secret=$_clientSecret&grant_type=client_credentials'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _accessToken = data['access_token'];
    } else {
      throw Exception('Failed to authenticate with Twitch');
    }
  }

  Future<List<dynamic>> getTopStreams({int first = 20}) async {
    if (_accessToken == null) await authenticate();

    final response = await http.get(
      Uri.parse('$_baseUrl/streams?first=$first'),
      headers: {
        'Client-ID': _clientId,
        'Authorization': 'Bearer $_accessToken',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to fetch streams');
    }
  }

  Future<List<dynamic>> getGames() async {
    if (_accessToken == null) await authenticate();

    final response = await http.get(
      Uri.parse('$_baseUrl/games/top'),
      headers: {
        'Client-ID': _clientId,
        'Authorization': 'Bearer $_accessToken',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to fetch games');
    }
  }

  Future<List<dynamic>> searchChannels(String query) async {
    if (_accessToken == null) await authenticate();

    final response = await http.get(
      Uri.parse('$_baseUrl/search/channels?query=$query'),
      headers: {
        'Client-ID': _clientId,
        'Authorization': 'Bearer $_accessToken',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to search channels');
    }
  }
}
