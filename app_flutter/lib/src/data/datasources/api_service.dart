import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  Future<String> getText(String text) async {
    final res = await http.post(
      Uri.parse('https://aohbtrdiieqxurwbclfx.supabase.co/functions/v1/askai'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'query': text}),
    );
    return jsonDecode(res.body)['choices'][0]['message']['content'];
  }

  Future<String> getImage(String text) async {
    final res = await http.post(
      Uri.parse('https://aohbtrdiieqxurwbclfx.supabase.co/functions/v1/gen_ai'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'query': text}),
    );
    return jsonDecode(res.body)['data'][0]['url'];
  }
}
