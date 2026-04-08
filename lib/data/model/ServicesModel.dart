class ServicesModel {
  int? idSer;
  String? nameSer;
  int? priceSer;
  String? urlImage;
  int? idEmp;
  String? description;
  int? maxTime;
  int? bookingEnd;
  int? bookingStart;

  ServicesModel(
      {this.idSer,
        this.nameSer,
        this.priceSer,
        this.urlImage,
        this.idEmp,
        this.description,
        this.maxTime,
        this.bookingEnd ,
        this.bookingStart
      });

  ServicesModel.fromJson(Map<String, dynamic> json) {
    idSer = json['id_ser'];
    nameSer = json['name_ser'];
    priceSer = json['price_ser'];
    urlImage = json['url_image'];
    idEmp = json['id_emp'];
    description = json['Description'];
    maxTime = json['max_time'];
    bookingEnd = json['bookingEnd'];
    bookingStart = json['bookingStart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_ser'] = this.idSer;
    data['name_ser'] = this.nameSer;
    data['price_ser'] = this.priceSer;
    data['url_image'] = this.urlImage;
    data['id_emp'] = this.idEmp;
    data['Description'] = this.description;
    data['max_time'] = this.maxTime;
    data['bookingEnd'] = this.bookingEnd;
    data['bookingStart'] = this.bookingStart;

    return data;
  }
}