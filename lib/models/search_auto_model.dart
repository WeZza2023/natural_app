class SearchAutoModel {
  final List<dynamic> foodNames;

  SearchAutoModel({required this.foodNames});

  factory SearchAutoModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> commonList = json['common'];
    final List foodNames = commonList.map((item) => item['food_name']).toList();
    return SearchAutoModel(foodNames: foodNames);
  }
}
