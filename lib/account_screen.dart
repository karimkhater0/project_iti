import 'package:flutter/material.dart';
import 'package:project_iti/about_app_screen.dart';
import 'package:project_iti/components/components.dart';
import 'package:project_iti/developers_screen.dart';
import 'package:project_iti/login_screen.dart';
import 'package:project_iti/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  String name = '';
  String phone = '';
  String email = '';
  List<Map<String, dynamic>> list = [];

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      email = prefs.getString("email")!;
      name = prefs.getString("name")!;
      phone = prefs.getString("phone")!;
    });
  }

  returnFav() async {
    await getFav();
    setState(() {
      list = favLaptops;
    });
  }

  @override
  void initState() {
    setState(() {
      getData();
      returnFav();
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    list = [];
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: email.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///ACCOUNT,FAV
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            child: Icon(
                              Icons.account_circle,
                              size: 100,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  name,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  phone,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                Text(
                                  email,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),

                      ///Fav Laptop
                      const Text(
                        'Favourite Laptops',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Container(
                          height: 380,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.indigo, width: 2),
                          ),
                          child: favLaptops.isNotEmpty
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListView.separated(
                                      itemBuilder: (context, index) =>
                                          gridViewHomeItem(
                                            img: list[index]['img'],
                                            vendor: list[index]['vendor'],
                                            model: list[index]['model'],
                                            cpu: list[index]['cpu'],
                                            gpu: list[index]['gpu'],
                                            ram: list[index]['ram'],
                                            storage: list[index]['storage'],
                                            price: list[index]['price'],
                                            os: list[index]['os'],
                                            monitor: list[index]['monitor'],
                                            fav: list[index]['fav'],
                                          ),
                                      separatorBuilder: (context, index) =>
                                          const Divider(),
                                      itemCount: list.length),
                                )
                              : const Center(
                                  child: Text(
                                  'Empty',
                                  style: TextStyle(fontSize: 40),
                                ))),
                    ],
                  ),
                ),

                ///INFO
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: const BoxDecoration(
                      color: Colors.indigoAccent,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Padding(
                    padding: const EdgeInsets.all(26.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                navigateTo(context, const AboutAppScreen());
                              },
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'About us',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                navigateTo(context, const DevelopersScreen());
                              },
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Developed By',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                navigateTo(context, const LoginScreen());
                              },
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Login',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                navigateTo(context, const RegisterScreen());
                              },
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Register',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
