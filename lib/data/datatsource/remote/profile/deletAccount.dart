

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';


class DeletAccount {

  Crud crud ;

  DeletAccount(this.crud) ;

  postData( String email , String phone) async {

    var response = await crud.postData(AppLink.deleteAccount, {
      "email" :  email,
      "phone" : phone
    });
    print(response) ;
    return response.fold((l) => l, (r) => r) ;

  }
}