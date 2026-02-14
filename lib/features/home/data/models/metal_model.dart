class MetalModel {
  String? name;
  double? price;
  String? symbol;
  String? updatedAt;
  String? updatedAtReadable;

  MetalModel({
    this.name,
    this.price,
    this.symbol,
    this.updatedAt,
    this.updatedAtReadable,
  });

  factory MetalModel.fromJson(Map<String, dynamic> json) => MetalModel(
    name: json['name'] as String?,
    price: (json['price'] as num?)?.toDouble(),
    symbol: json['symbol'] as String?,
    updatedAt: json['updatedAt'] as String?,
    updatedAtReadable: json['updatedAtReadable'] as String?,
  );
}

enum MetalType { gold, silver }
