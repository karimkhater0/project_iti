import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'components/components.dart';
import 'login_screen.dart';
import 'models/boarding_model.dart';




class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {



  List<BoardingModel> boarding=[
    BoardingModel(
      image: 'assets/images/on_boarding_img/onboard1.jpg',
      title: 'BROWSE ONLINE',
      body:'Browse all brands and compare between them',
    ),
    BoardingModel(
      image: 'assets/images/on_boarding_img/onboard2.jpg',
      title: 'KEEP AN EYE ON THE MARKET',
      body:'See the latest updates in the market',
    ),
    BoardingModel(
      image: 'assets/images/on_boarding_img/onboard3.jpg',
      title: 'GET YOUR PERFECT LAPTOP',
      body:'choose between laptops and get your dream laptop',
    ),

  ];

  var boardController = PageController();
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            TextButton(onPressed: (){
              navigateAndFinish(context, const LoginScreen());
            },
                child: const Text('SKIP',))
          ],
        ),

        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [

                ///IMAGE, TITLE, BODY
                Expanded(
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    controller: boardController,
                    onPageChanged: (int index)
                    {
                      if(index==boarding.length-1)
                      {
                        setState(() {
                          isLast=true;
                        });
                      }
                      else
                      {
                        isLast=false;
                      }
                    },
                    itemBuilder: (context,index)=>buildBoardingItem(boarding[index]),
                    itemCount:boarding.length,
                  ),
                ),
                const SizedBox(height: 40,),

                ///INDICATOR
                Row(
                  children: [
                    SmoothPageIndicator(
                      controller: boardController,
                      effect:  const ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: Colors.indigo,
                        dotHeight: 10,
                        expansionFactor: 4,
                        dotWidth: 10,
                        spacing: 5,
                      ),
                      count: 3,
                    ),
                    const Spacer(),
                    FloatingActionButton(
                      onPressed: () {
                        if(isLast)
                        {

                          navigateAndFinish(context, const LoginScreen());
                        }
                        else
                        {
                          boardController.nextPage(
                            duration: const Duration(
                              microseconds: 750,
                            ),
                            curve: Curves.fastLinearToSlowEaseIn,
                          );
                        }


                      },
                      child: const Icon(
                          Icons.arrow_forward_ios
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        )
    );
  }


}
