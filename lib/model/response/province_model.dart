class ProvinceModel {
  Map<int, String> provinces;

  ProvinceModel({required this.provinces});

  factory ProvinceModel.fromJson(Map<String, dynamic> json) => ProvinceModel(
    provinces: json.map((key, value) => MapEntry(int.parse(key), value)),
  );

  Map<String, dynamic> toJson() =>
      provinces.map((key, value) => MapEntry(key.toString(), value));
}
