import 'package:flutter_projem/network/model/response-model/base_response_model.dart';
import 'package:flutter_projem/network/service/cocktail_service.dart';

class CoctailRepository {
  CocktailService? service;
  CoctailRepository({apiService})
      : service = apiService ?? CocktailService.create();

  Future<BaseResponseModel>? getCoctailList(String filter) async {
    final response = await service!.getCocktails(filter);

    if (response.statusCode == 200) {
      return BaseResponseModel.fromJson(response.body);
    } else {
      throw Exception("Request Failed");
    }
  }
}
