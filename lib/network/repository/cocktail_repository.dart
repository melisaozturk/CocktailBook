import 'package:flutter_projem/network/model/response-model/base_response_model.dart';
import 'package:flutter_projem/network/service/cocktail_service.dart';

class CocktailRepository {
  CocktailService? service;
  CocktailRepository({apiService}) : service = apiService ?? CocktailService.create();

  Future<BaseResponseModel>? getLatestCocktails() async {
    final response = await service!.getLatestCocktails();

    if (response.statusCode == 200) {
      return BaseResponseModel.fromJson(response.body);
    } else {
      throw Exception("Request Failed");
    }
  }

  Future<BaseResponseModel>? getPopularCocktails(String filter) async {
    final response = await service!.getPopularCocktails(filter);

    if (response.statusCode == 200) {
      return BaseResponseModel.fromJson(response.body);
    } else {
      throw Exception("Request Failed");
    }
  }

  Future<BaseResponseModel>? getCocktailIngredient(String id) async {
    final response = await service!.getCocktailIngredients(id);

    if (response.statusCode == 200) {
      return BaseResponseModel.fromJson(response.body);
    } else {
      throw Exception("Request Failed");
    }
  }
}
