

import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';


class SignUpData {

  Crud crud ;

  SignUpData(this.crud) ;

  postData(String username , String password , String email , String phone , String address,String token) async {

    var response = await crud.postData(AppLink.signUp, {
      "username" :  username,
      "password" : password ,
      "email" :  email,
      "phone" :  phone,
      "address" :  address,
      "token" : token

    });
    print(response) ;
    return response.fold((l) => l, (r) => r) ;

  }

}
