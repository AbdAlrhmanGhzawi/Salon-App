class EmployeesModel {
  int? idEmp;
  String? nameEmp;
  String? description;
  String? phone;
  String? urlImage;

  EmployeesModel({this.idEmp, this.nameEmp, this.description, this.phone ,this.urlImage});

  EmployeesModel.fromJson(Map<String, dynamic> json) {
    idEmp = json['id_emp'];
    nameEmp = json['name_emp'];
    description = json['description'];
    phone = json['phone'];
    urlImage = json['urlImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_emp'] = this.idEmp;
    data['name_emp'] = this.nameEmp;
    data['description'] = this.description;
    data['phone'] = this.phone;
    data['urlImage'] = this.urlImage;
    return data;
  }
}