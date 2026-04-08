import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class TestData {

  Crud crud ;

  TestData(this.crud) ;

  getData() async {

    var response = await crud.postData(AppLink.test, {});
    print(response) ;
    return response.fold((l) => l, (r) => r) ;

  }


}
