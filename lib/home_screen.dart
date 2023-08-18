import 'package:flutter/material.dart';

import 'components/components.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> list=[];
  returnData()async{

        await getCollection();
        setState(() {
          list=allLaptops;
        });
  }



  @override
  void initState() {
    returnData();

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    list=[];

    // TODO: implement dispose
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list.isEmpty
          ? const Center(child: CircularProgressIndicator())
          :Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.separated(
                  itemBuilder: (context, index) => gridViewHomeItem(
                    cpu: list[index]['cpu'],
                    img: list[index]['img'],
                    gpu: list[index]['gpu'],
                    ram: list[index]['ram'],
                    storage: list[index]['storage'],
                    vendor: list[index]['vendor'],
                    model: list[index]['model'],
                    price: list[index]['price'],
                    os: list[index]['os'],
                    monitor: list[index]['monitor'],
                    fav: list[index]['fav'],
                    id: id[index],
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: list.length)),
    );
  }
}
