class ResponseModel {
  ResponseModel({
      this.text, 
      this.number, 
      this.found, 
      this.type,});

  ResponseModel.fromJson(dynamic json) {
    text = json['text'];
    number = json['number'];
    found = json['found'];
    type = json['type'];
  }
  String? text;
  int? number;
  bool? found;
  String? type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['number'] = number;
    map['found'] = found;
    map['type'] = type;
    return map;
  }

}