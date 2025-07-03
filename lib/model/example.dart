class BeeModel {
  final int? id;
  final String? name;
  final double? weight;
  final bool? enable;

  BeeModel({this.id, this.name, this.weight, this.enable});

  factory BeeModel.fromJson(Map<String, dynamic> json) {
    return BeeModel(
      id: int.tryParse('${json['id']}'),
      name: json['name'] as String?,
      weight: double.tryParse('${json['weight']}'),
      enable: bool.tryParse('${json['enable']}'),
    );
  }

  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "weight": weight, "enable": enable};
  }

  @override
  String toString() {
    return 'BeeModel(id: $id, name: $name, weight: $weight, enable: $enable)';
  }

  BeeModel copyWith({int? id, String? name, double? weight, bool? enable}) {
    return BeeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      weight: weight ?? this.weight,
      enable: enable ?? this.enable,
    );
  }
}
