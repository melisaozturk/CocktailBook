// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cocktail_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$CocktailService extends CocktailService {
  _$CocktailService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = CocktailService;

  @override
  Future<Response<dynamic>> getCocktails() {
    final $url = '/popular.php';
    final $headers = {
      'x-rapidapi-host': 'the-cocktail-db.p.rapidapi.com',
      'x-rapidapi-key': '50a99c8713mshb2c7bbbb30c134cp168a3bjsnaf15fb5b918e',
    };

    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
