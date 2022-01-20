import 'package:json_annotation/json_annotation.dart';
import 'drinks.dart';

part 'base_response_model.g.dart';

@JsonSerializable()
class BaseResponseModel {
  BaseResponseModel({this.drinks});

  List<Drinks>? drinks;

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$BaseResponseModelToJson(this);
}