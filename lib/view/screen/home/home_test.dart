/*
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../controller/home_controller.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/imagasset.dart';


class home_test extends StatelessWidget {
  const home_test({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    CollectionReference Categories = FirebaseFirestore.instance.collection('Categories');
    firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

      Future<String> downloadUrl(String imageName) async {
      firebase_storage.Reference ref = storage.ref().child('$imageName');
      String  imageUrel = await ref.getDownloadURL();
      return imageUrel ;
    }


    return Scaffold(

      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(

          children:[

            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(children: [
                Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Find Product",
                          hintStyle: TextStyle(fontSize: 18),
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10)),
                          filled: true,
                          fillColor: Colors.grey[200]),
                    )),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  width: 60,
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications_active_outlined,
                        size: 30,
                        color: Colors.grey[600],
                      )),
                )
              ]),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 15),
              child: Stack(children: [
                Container(
                  alignment: Alignment.center,
                  height: 150,
                  decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: const ListTile(
                    title: Text("A summer surprise",
                        style: TextStyle(
                            color: Colors.white, fontSize: 20)),
                    subtitle: Text("Cashback 20%",
                        style: TextStyle(
                            color: Colors.white, fontSize: 30)),
                  ),
                ),
                Positioned(
                  top: -20,
                  right: -20,
                  child: Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(160)),
                  ),
                ),
                Positioned(
                  top: -75,
                  right: -35,
                  child: Lottie.asset(
                      AppImageAsset.cashback, width: 200, height: 200),
                )
              ]),
            ),


            FutureBuilder<QuerySnapshot>(
              future: Categories.get(),
              builder:
                  (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("loading ...");
                }

                if (snapshot.hasData) {

                  // return Text("Full Name: ${data['Categories_name']} => ${data['Categories_id']}");

                  return SizedBox(
                    height: 100,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal ,
                        itemCount: snapshot.data?.size,
                        itemBuilder: (context , i){
                          Map<String, dynamic> data = snapshot.data!.docs[i].data() as Map<String, dynamic>;

                          return Container(
                              margin: const EdgeInsets.all(10),
                              //color: Colors.green,
                              child: Text("Full Name: ${data['Categories_name']} => ${data['Categories_id']}")

                          );
                            // SizedBox(
                            //
                            //   height: 100,
                            //   child: ListView.separated(
                            //     separatorBuilder: (context, index) =>
                            //     const SizedBox(width: 10),
                            //     itemCount: snapshot.data!.size,
                            //     scrollDirection: Axis.horizontal,
                            //     itemBuilder: (context, index) {
                            //       return Column(
                            //         children: [
                            //           Container(
                            //             decoration: BoxDecoration(
                            //                 color: AppColor.primaryColor,
                            //                 borderRadius: BorderRadius.circular(20)),
                            //             padding: const EdgeInsets.symmetric(
                            //                 horizontal: 10
                            //             ),
                            //             height: 70,
                            //             width: 70,
                            //             child: Text("image"),
                            //             // child: SvgPicture.network(
                            //             //     "${AppLink.imagestCategories}/${controller.categories[index]['categories_image']}",
                            //             //     color: AppColor.secondColor),
                            //           ),
                            //           Text(
                            //             "${data['categories_name']}",
                            //             style: const TextStyle(
                            //                 fontSize: 13, color: AppColor.black),
                            //           )
                            //         ],
                            //       );
                            //     },
                            //   ),
                            // );

                        }),
                  );

                }

                return Text("loading");
              },
            ),



            FutureBuilder<QuerySnapshot>(
              future: Categories.get(),
              builder:
                  (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("loading ...");
                }

                if (snapshot.hasData) {



                  return SizedBox(
                    height: 200,
                    child: ListView.builder(
                        shrinkWrap: true ,
                        scrollDirection: Axis.horizontal ,
                        itemCount: snapshot.data?.size,
                        itemBuilder: (context , i){
                         // Map<String, dynamic> data = snapshot.data!.docs[i].data() as Map<String, dynamic>;
                         // String image = downloadUrl('Gaming-Chair.png') as String ;
                         // print(image) ;
                          Map<String, dynamic> data = snapshot.data!.docs[i].data() as Map<String, dynamic>;

                          return
                            Container(
                              height: 200,
                            width: 200,
                            color: Colors.white,
                            margin: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Image.asset(AppImageAsset.logo, width: 100 ,height: 100,) ,
                                SizedBox(height: 20,),
                                Text("Full Name: ${data['Categories_name']} => ${data['Categories_id']}")
                              ],
                            )  ,



                          ) ;


                        }),
                  );

                }

                return Text("loading");
              },
            ),






          ] ,
        ),
      ) ,

      ) ;




  }
}


class ListCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Card(
      child : Row(
        children: [

          Expanded(
              flex: 1,
              child:Image.network(
                "url" ,
                fit: BoxFit.fill,
                height: 80 ,

              ) ,


          ) ,
          Expanded(
            flex: 1,
            child:ListTile(
              title: Text("title"),
              subtitle: Text("subtitle"),
              trailing: Icon(Icons.edit),

            ) ,
          )


        ],

      )


    );

  }



}

 */

