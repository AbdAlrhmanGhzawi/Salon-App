class SportBooking {
  int? idU;
  int? idSer;
  String? nameSer;
  int? servicesDuration;
  String? bookingStart;
  String? bookingEnd;

  SportBooking(
      {this.idU,
        this.idSer,
        this.servicesDuration,
        this.bookingStart,
        this.bookingEnd});

  SportBooking.fromJson(Map<String, dynamic> json) {
    idU = json['id_u'];
    idSer = json['id_ser'];
    nameSer = json['name_ser'];
    servicesDuration = json['services_duration'];
    bookingStart = json['bookingStart'];
    bookingEnd = json['bookingEnd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_u'] = this.idU;
    data['id_ser'] = this.idSer;
    data['name_ser'] = this.nameSer;
    data['services_duration'] = this.servicesDuration;
    data['bookingStart'] = this.bookingStart;
    data['bookingEnd'] = this.bookingEnd;
    return data;
  }
}
