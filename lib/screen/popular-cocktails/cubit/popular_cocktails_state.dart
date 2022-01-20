part of 'popular_cocktails_cubit.dart';

enum StatusType { loading, success, failure }

abstract class BaseDrinksState extends Equatable {
  BaseDrinksState._({
    this.statusType = StatusType.loading,
    this.drinkList = const [],
  });

  final StatusType statusType;
  List<Drinks>? drinkList;

  BaseDrinksState copyWith({
    StatusType statusType,
    List<Drinks>? drinkList,
  });

  @override
  List<Object> get props => [statusType, drinkList!];
}
