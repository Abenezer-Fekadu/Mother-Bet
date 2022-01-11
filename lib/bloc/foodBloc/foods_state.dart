part of 'foods_bloc.dart';

abstract class FoodsState extends Equatable {
  const FoodsState();

  @override
  List<Object> get props => [];
}

class FoodsInitial extends FoodsState {}

class FoodsOperationSuccess extends FoodsState {
  final Iterable<Food> foods;

  const FoodsOperationSuccess([this.foods = const []]);

  @override
  List<Object> get props => [foods];
}

class FoodsOperationFailure extends FoodsState {
  final String message;

  const FoodsOperationFailure(this.message);

  @override
  List<Object> get props => [message];
}
