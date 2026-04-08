

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';


class getUser {

  Crud crud ;

  getUser(this.crud) ;

  postData( String idUser) async {

    var response = await crud.postData(AppLink.getUser, {
      "idUser" :  idUser,

    });
    print(response) ;
    return response.fold((l) => l, (r) => r) ;

  }


}
