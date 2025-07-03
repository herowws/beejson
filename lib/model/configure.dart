class ConfigureModel {
  bool isCopyWith;
  bool isFromJson;
  bool isToJson;
  bool isToString;
  bool isFinal;

  ConfigureModel({
    this.isCopyWith = false,
    this.isFromJson = true,
    this.isToJson = true,
    this.isToString = false,
    this.isFinal = true,
  });

  factory ConfigureModel.fromJson(Map<String, dynamic> json) {
    return ConfigureModel(
      isCopyWith: bool.tryParse('${json['isCopyWith']}') ?? false,
      isFromJson: bool.tryParse('${json['isFromJson']}') ?? true,
      isToJson: bool.tryParse('${json['isToJson']}') ?? true,
      isToString: bool.tryParse('${json['isToString']}') ?? false,
      isFinal: bool.tryParse('${json['isFinal']}') ?? true,
    );
  }

  ConfigureModel copyWith({
    bool? isCopyWith,
    bool? isFromJson,
    bool? isToJson,
    bool? isToString,
    bool? isFinal,
  }) => ConfigureModel(
    isCopyWith: isCopyWith ?? this.isCopyWith,
    isFromJson: isFromJson ?? this.isFromJson,
    isToJson: isToJson ?? this.isToJson,
    isToString: isToString ?? this.isToString,
    isFinal: isFinal ?? this.isFinal,
  );

  Map<String, dynamic> toJson() => {
    'isCopyWith': isCopyWith,
    'isFromJson': isFromJson,
    'isToJson': isToJson,
    'isToString': isToString,
    'isFinal': isFinal,
  };
}
