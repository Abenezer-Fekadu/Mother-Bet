part of 'foods_bloc.dart';

abstract class FoodsEvent extends Equatable {
  const FoodsEvent();

  @override
  List<Object> get props => [];
}

class LoadFoods extends FoodsEvent {
  const LoadFoods();
}