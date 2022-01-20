import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:chopper/chopper.dart';

part 'cocktail_service.chopper.dart';
// flutter pub run build_runner build
// flutter packages pub run build_runner build

@ChopperApi()
abstract class CocktailService extends ChopperService {
  @Get(path: "/popular.php", headers: {
    'x-rapidapi-host': 'the-cocktail-db.p.rapidapi.com',
    'x-rapidapi-key': '50a99c8713mshb2c7bbbb30c134cp168a3bjsnaf15fb5b918e'
  })
  Future<Response> getCocktails();

  static CocktailService create() {
    final client = ChopperClient(
      baseUrl: dotenv.env['BASE_URL']!,
      services: [
        _$CocktailService(),
      ],
      converter: const JsonConverter(),
    );
    return _$CocktailService(client);
  }
}