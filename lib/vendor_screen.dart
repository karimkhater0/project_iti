import 'package:flutter/material.dart';
import 'package:project_iti/components/components.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VendorScreen extends StatefulWidget {
  const VendorScreen({
    super.key,
  });

  @override
  State<VendorScreen> createState() => _VendorScreenState();
}

class _VendorScreenState extends State<VendorScreen> {

  String name='';
  getName()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('vendor')!;

    });
  }

  @override
  void initState() {
    setState(() {
     getName();
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    setState(() {
      laptops=[];

    });
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$name Laptops'),

      ),
      body: laptops.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView.separated(
                itemBuilder: (context, index) => gridViewHomeItem(
                  cpu: laptops[index]['cpu'],
                  img: laptops[index]['img'],
                  gpu: laptops[index]['gpu'],
                  ram: laptops[index]['ram'],
                  storage: laptops[index]['storage'],
                  vendor: laptops[index]['vendor'],
                  model: laptops[index]['model'],
                  price: laptops[index]['price'],
                  os: laptops[index]['os'],
                  monitor: laptops[index]['monitor'],
                  fav: laptops[index]['fav'],
                  id: id[index],

                ),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: laptops.length,
              ),
            ),
    );
  }
}
