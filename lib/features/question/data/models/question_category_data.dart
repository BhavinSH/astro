class QuestionCategoryData {
  int? id;
  String? name;
  String? description;
  double? price;
  List<String>? suggestions;
  bool? isSelected = false;

  QuestionCategoryData({
    this.id,
    this.name,
    this.description,
    this.price,
    this.suggestions,
    this.isSelected,
  });

  QuestionCategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    suggestions = json['suggestions'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['price'] = price;
    data['suggestions'] = suggestions;
    return data;
  }
}
