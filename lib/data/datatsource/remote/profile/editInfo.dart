import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';


class EditInfo {

  Crud crud ;

  EditInfo(this.crud) ;

  postData(String NewUsername , String NewEmail , String email ,String ConfirmPassword ,String address) async {

    var response = await crud.postData(AppLink.editInfo, {
      "NewUsername" :  NewUsername,
      "email" : email ,
      "NewEmail" : NewEmail ,
      "ConfirmPassword" : ConfirmPassword ,
      "address" : address ,

    });
    print(response) ;
    return response.fold((l) => l, (r) => r) ;

  }
}