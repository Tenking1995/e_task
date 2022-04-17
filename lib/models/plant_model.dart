class PlantModel {
  String? imagePath;
  String? plantType;
  String? title;
  String? originalPrice;
  String? currentPrice;

  PlantModel({
    required this.imagePath,
    required this.plantType,
    required this.title,
    this.originalPrice,
    this.currentPrice,
  });
}
