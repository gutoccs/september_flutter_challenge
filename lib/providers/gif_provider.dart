import 'package:http/http.dart' as http;

import 'package:september_flutter_challenge/models/api_response.dart';

class GifProvider {
  final String url = 'https://api.giphy.com';
  final String apiKey = '9IsUkt6R93oz4dh5V1UXEdsWRIBiCCpP';

  Future<ApiResponse> trendingGif() async {
    Uri url = Uri.parse(
        '${this.url}/v1/gifs/trending?api_key=${this.apiKey}&limit=21&rating=g');

    final resp = await http.get(url);

    final gifResponse = apiResponseFromJson(resp.body);

    return gifResponse;
  }
}
