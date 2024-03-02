class FoodModel {
  final String name;
  final weight;
  final calories;
  final totalFat;
  final protin;
  final carbs;
  final saturatedFat;
  final cholesterol;
  final sodium;
  final fiber;
  final sugars;
  final potassium;
  final String image;

  FoodModel({
    required this.name,
    required this.weight,
    required this.calories,
    required this.totalFat,
    required this.protin,
    required this.carbs,
    required this.saturatedFat,
    required this.cholesterol,
    required this.sodium,
    required this.fiber,
    required this.sugars,
    required this.potassium,
    required this.image,
  });
  factory FoodModel.fromJson(jsonData) {
    return FoodModel(
      name: jsonData['foods'][0]['food_name'],
      weight: jsonData['foods'][0]['serving_weight_grams'],
      calories: jsonData['foods'][0]['nf_calories'],
      totalFat: jsonData['foods'][0]['nf_total_fat'],
      saturatedFat: jsonData['foods'][0]['nf_saturated_fat'],
      protin: jsonData['foods'][0]['nf_protein'],
      carbs: jsonData['foods'][0]['nf_total_carbohydrate'],
      cholesterol: jsonData['foods'][0]['nf_cholesterol'],
      sodium: jsonData['foods'][0]['nf_sodium'],
      fiber: jsonData['foods'][0]['nf_dietary_fiber'],
      sugars: jsonData['foods'][0]['nf_sugars'],
      potassium: jsonData['foods'][0]['nf_potassium'],
      image: jsonData['foods'][0]['photo']['thumb'],
    );
  }
}
