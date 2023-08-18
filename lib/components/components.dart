import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:like_button/like_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/boarding_model.dart';
import '../vendor_screen.dart';

Future<Object?> navigateTo(BuildContext context, Widget nextScreen) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => nextScreen),
  );
}

Future<Object?> navigateAndFinish(BuildContext context, Widget nextScreen) {
  return Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (BuildContext context) => nextScreen),
      (route) {
    return false;
  });
}

Widget buildBoardingItem(BoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(model.image),
          ),
        ),
        Text(
          model.title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          model.body,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    );

Future<bool?> toast({required bool isSuccess, required String message}) =>
    Fluttertoast.showToast(
        msg: message,
        toastLength: isSuccess ? Toast.LENGTH_SHORT : Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: isSuccess ? Colors.green : Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);



Widget gridViewCategoryItem(
    {required String img, required String name, required var context}) {
  return InkWell(
    onTap: ()async {
      SharedPreferences prefs=await SharedPreferences.getInstance();
      prefs.setString('vendor', name);
      await getMultipleDocuments(name);
      navigateTo(
          context,
          const VendorScreen()
      );
      },
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.black12),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                img,
              ),
              fit: BoxFit.scaleDown,
              height: 100,
              width: 100,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              name,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


Future<bool> changeData(status) async {
  //your code
  return Future.value(!status);
}

Widget gridViewHomeItem({
  required String img,
  required String vendor,
  required String model,
  required String cpu,
  required String gpu,
  required String ram,
  required String storage,
  required String price,
  required String os,
  required String monitor,
  required bool fav,
  String? id,
}) =>
    Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.black12),
      padding: const EdgeInsetsDirectional.all(14),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Image(
            image: NetworkImage(img),
            fit: BoxFit.scaleDown,
            height: 100,
            width: 100,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///specs
                Text(
                  '$vendor, $model, $cpu, $gpu, $ram, $storage, $monitor, $os.',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                  ),
                ),

                ///price ,Favourite Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),

                    LikeButton(
                      isLiked: fav?true:false,
                      bubblesColor: const BubblesColor(
                          dotPrimaryColor: Colors.indigo,
                          dotSecondaryColor: Colors.indigoAccent

                      ),
                      circleColor: const CircleColor(
                          start: Colors.transparent,
                          end: Colors.transparent
                      ),

                      onTap: (isLiked){
                        fav = !fav;
                        updateData(id: id!, field: 'fav', value: fav);
                        return changeData(
                          isLiked,
                        );
                      },
                      likeBuilder: (isLiked){
                        return Icon(

                          isLiked?Icons.favorite:Icons.favorite_border,
                          color: Colors.indigo,
                          size: 40,

                        );
                      },
                    ),


                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );





var db = FirebaseFirestore.instance;
List<Map<String, dynamic>> allLaptops = [];
List<Map<String, dynamic>> laptops = [];
List<Map<String, dynamic>> favLaptops = [];
List<String> id = [];
List<String> favID = [];


getCollection() async {
  allLaptops=[];
  await db.collection("laptop").get().then(
    (querySnapshot) {

      for (var docSnapshot in querySnapshot.docs) {
        print('====================');
        print('${docSnapshot.id} => ${docSnapshot.data()}');
        allLaptops.add(docSnapshot.data());
        id.add(docSnapshot.id);

      }
    },
  ).catchError((onError) {
    print(onError);
  });

  return allLaptops;
}

getMultipleDocuments(String vendor) async {
  laptops=[];
  await db.collection("laptop").where("vendor", isEqualTo: vendor.toLowerCase()).get().then(
    (querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {

        //print('${docSnapshot.id} => ${docSnapshot.data()}');
        laptops.add(docSnapshot.data());

      }
    },

  ).catchError((onError) {
    print(onError);
  });
  return laptops;
}

getFav()async {
  favLaptops=[];
  await db.collection("laptop").where("fav", isEqualTo: true).get().then(
        (querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        //print('${docSnapshot.id} => ${docSnapshot.data()}');
        favLaptops.add(docSnapshot.data());
        favID.add(docSnapshot.id);
      }
    },

  ).catchError((onError) {
    print(onError);
  });
  return favLaptops;
}

setData({required String email}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  await db.collection("users").where("email", isEqualTo: email).get().then(
    (querySnapshot) {
      for (var docSnapshot in querySnapshot.docs) {
        //print('${docSnapshot.id} => ${docSnapshot.data()}');

        prefs.setString('id', docSnapshot.id);
        prefs.setString('name', docSnapshot['name']);
        prefs.setString('phone', docSnapshot['phone']);
      }
    },
    onError: (e) => print("Error completing: $e"),
  );
}

updateData({required String id,required String field,required var value}){

  final data = {field: value};
  db.collection("laptop").doc(id).set(data, SetOptions(merge: true));

}


