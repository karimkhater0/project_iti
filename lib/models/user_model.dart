import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserModel
{

 final String fullName;
 final String email;
 final String phoneNumber;



  UserModel({
    required this.fullName,
    required this.email,
    required this.phoneNumber,

  });

 factory UserModel.fromMap(Map<String,dynamic> json)=>UserModel(
     fullName: json['fullName'],
     email: json['email'],
     phoneNumber: json['phone'],

 );

  toJson()
  {
    return {
      "name":fullName,
      "email":email,
      "phone":phoneNumber,

    };
  }

  setData()async{
    var docUser=FirebaseFirestore.instance.collection('users').doc();

    await docUser.set(toJson()).then((value) async{
      SharedPreferences prefs =await SharedPreferences.getInstance();
      prefs.setString('id', docUser.id);

    });

  }






}