import 'package:flutter/material.dart';
import 'package:project_iti/components/components.dart';
import 'package:project_iti/developers_screen.dart';

class AboutAppScreen extends StatelessWidget {
  const AboutAppScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About App'),
        centerTitle: true,
      ),

      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const Text(
                '''Are you looking for a new laptop? Whether you need it for work, school, gaming, or entertainment,
Laptop app has the perfect laptop for you.
Laptop app is the ultimate online destination for choosing your laptop from top brands like Dell, HP, Lenovo, and more.
You can browse through hundreds of models, compare features and prices, read reviews and ratings, and find the best deals and discounts.
Laptop app is more than just an app, it’s your trusted partner for finding your dream laptop.''',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),


              ),
              TextButton(onPressed: (){
                navigateTo(context, const DevelopersScreen());

                },
                  child: const Text(
                  'Developers',
                style: TextStyle(
                  fontSize: 20,
                ),
              )),
            ],
          ),

        ),
      ),
    );
  }
}
