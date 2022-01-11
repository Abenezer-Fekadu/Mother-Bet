import 'package:mother_bet/dataProvider/foods_data_provider.dart';
import 'package:mother_bet/models/food.dart';

class FoodsRepository {
  final FoodsDataProvider _dataProvider;
  FoodsRepository(this._dataProvider);

  Future<List<Food>> fetchTopFoods() async {
    return _dataProvider.fetchTopFoods();
  }
}
