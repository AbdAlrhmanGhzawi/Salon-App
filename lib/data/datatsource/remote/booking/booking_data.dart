
import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class BookingData {
  Crud crud;

  BookingData(this.crud);


  getData(int idSer) async {
    var response = await crud.postData(AppLink.getBooking, {"idSer" : '$idSer'});
    return response.fold((l) => l, (r) => r);
  }

  getUserData(String idU) async {
    var response = await crud.postData(AppLink.get_user_booking, { "id_u": idU});
    return response.fold((l) => l, (r) => r);
  }


  deleteData(int idSer , int idU) async {
    var response = await crud.postData(AppLink.deleteBooking, {"idSer" : '$idSer' , "id_u" : '$idU'});
    return response.fold((l) => l, (r) => r);
  }

  ///////////////// manager ///////////////////
  getPendingBooking() async {
    var response = await crud.postData(AppLink.get_pending_booking, {});
    return response.fold((l) => l, (r) => r);
  }

  addBooking(String idU , int idSer , String nameSer , int servicesDuration , String bookingStart , String bookingEnd) async {
    var response = await crud.postData(AppLink.addBooking,
        {
          "id_u" : idU ,
          "idSer" : '$idSer' ,
          "nameSer" : nameSer ,
          "services_duration" : '$servicesDuration' ,
          "bookingStart" : bookingStart ,
          "bookingEnd" : bookingEnd ,
        }
    );
    return response.fold((l) => l, (r) => r);

  }

  updateStatus(int idSer , int idU)  async {
    var response = await crud.postData(AppLink.updateStatus, {"idSer" : '$idSer' , "id_u" : '$idU'});
    return response.fold((l) => l, (r) => r);
  }

  getSalonWorks() async {
    var response = await crud.postData(AppLink.get_Works, {});
    return response.fold((l) => l, (r) => r);

  }




}
