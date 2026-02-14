class HistoryMetalModel {
  String? day;
  String? maxPrice;

  HistoryMetalModel({this.day, this.maxPrice});

  factory HistoryMetalModel.fromJson(Map<String, dynamic> json) {
    return HistoryMetalModel(
      day: json['day'] as String?,
      maxPrice: json['max_price'] as String?,
    );
  }
}
