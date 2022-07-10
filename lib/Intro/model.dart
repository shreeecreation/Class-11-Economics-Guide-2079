// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

class Eco_Model {
  var chapter;
  var name;
  var core;

  Eco_Model({required this.chapter, required this.name, required this.core});
  Eco_Model.fromJson(Map<String, dynamic> json) {
    chapter = json["chapter"];
    name = json["name"];
    core = json["core"];
  }
}
