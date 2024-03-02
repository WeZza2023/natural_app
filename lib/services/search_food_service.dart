import 'package:natural_app/helper/api.dart';
import 'package:natural_app/models/food_model.dart';
import 'package:natural_app/models/search_auto_model.dart';

class SearchFoodService {
  Future<FoodModel> foodSearch({required String foodItem}) async {
    Map<String, dynamic> data = await Api().post(
      url: 'https://trackapi.nutritionix.com/v2/natural/nutrients',
      headers: {
        'Content-Type': 'application/json',
        'x-app-id': '6cbc998a',
        'x-app-key': 'db3fdec5c4ade23726693cee52199785',
      },
      foodItem: foodItem,
    );
    return FoodModel.fromJson(data);
  }
}

class AutoSearchService {
  Future<SearchAutoModel> foodSearch({required String foodItem}) async {
    Map<String, dynamic> data = await Api().get(
      foodItem: foodItem,
      url: 'https://trackapi.nutritionix.com/v2/search/instant/',
      headers: {
        'Content-Type': 'application/json',
        'x-app-id': '6cbc998a',
        'x-app-key': 'db3fdec5c4ade23726693cee52199785',
      },
    );
    SearchAutoModel searchAutoModel = SearchAutoModel.fromJson(data);

    return searchAutoModel;
  }
}
