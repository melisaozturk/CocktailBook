import 'package:chopper/chopper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'cocktail_service.chopper.dart';
// flutter pub run build_runner build
// flutter packages pub run build_runner build

@ChopperApi()
abstract class CocktailService extends ChopperService {
  @Get(path: "/popular.php")
  Future<Response> getPopularCocktails(
    @Query("filter.php?c") String c,
  );

  @Get(path: "/latest.php")
  Future<Response> getLatestCocktails();

  @Get(path: "/lookup.php")
  Future<Response> getCocktailIngredients(
    @Query("i") String i,
  );

  static CocktailService create() {
    final baseUrl = dotenv.env['BASE_URL'];
    if (baseUrl == null || baseUrl.isEmpty) {
      throw Exception('BASE_URL is not set in .env file');
    }
    
    final client = ChopperClient(
      baseUrl: baseUrl, // todo dotenv.get('BASE_URL', fallback: 'Base url can not found')
      services: [
        _$CocktailService(),
      ],
      converter: const JsonConverter(),
      interceptors: [
        (Request request) async {
          final apiKey = dotenv.env['API_KEY'];
          if (apiKey == null || apiKey.isEmpty) {
            throw Exception('API_KEY is not set in .env file');
          }
          
          return request.copyWith(
            headers: {
              ...request.headers,
              'x-rapidapi-host': 'the-cocktail-db.p.rapidapi.com',
              'x-rapidapi-key': apiKey,
            },
          );
        },
      ],  
    );
    return _$CocktailService(client);
  }
}
