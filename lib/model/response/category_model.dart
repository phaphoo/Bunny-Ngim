class CategoryModel {
  int? id;
  int? parentId;
  String? display;
  String? title;

  CategoryModel({this.id, this.parentId, this.display, this.title});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    display = json['display'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['display'] = this.display;
    data['title'] = this.title;
    return data;
  }
}
