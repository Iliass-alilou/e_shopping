import 'package:e_shopping/models/boardinModels.dart';
import 'package:e_shopping/modules/login_Screen.dart';
import 'package:e_shopping/shared/component/components.dart';
import 'package:e_shopping/shared/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class On_Boarding extends StatefulWidget {

  @override
  _On_BoardingState createState() => _On_BoardingState();
}

class _On_BoardingState extends State<On_Boarding> {
   List <Boarding_model> boarding = [
     Boarding_model(
         image: 'assets/images/onbording1.png',
         title: 'Screen title 1',
         body: 'Screen body 1',
     ),
     Boarding_model(
         image: 'assets/images/onbording1.png',
         title: 'Screen title 2',
         body: 'Screen body 2',
     ),
     Boarding_model(
         image: 'assets/images/onbording1.png',
         title: 'Screen title 3',
         body: 'Screen body 3',
     ),
   ];

   var boardController = PageController();

   bool isLast_indicator = false;

   @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 20.0
            ),
            child: TextButton(
                onPressed: (){
                  Navigate_and_Finish( context , Login_Screen() );
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 20.0
                  ),
                ),
            ),
          ),
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.all(23.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                physics: BouncingScrollPhysics(),
                itemBuilder:(context ,index)=> buildBoardingItem(boarding[index]),
                itemCount:boarding.length ,

                onPageChanged: (int index){
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast_indicator = true;
                    });
                    print('isLast_indicator is $isLast_indicator');
                  } else {
                    setState(() {
                      isLast_indicator = false;
                    });
                  }
                },

              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller:boardController ,
                  effect: ExpandingDotsEffect(
                    activeDotColor: defaultColor,
                    dotColor: Colors.grey,
                    dotHeight: 10.0,
                    expansionFactor: 4,
                    spacing: 5.0,
                  ),
                  count: boarding.length,
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: (){
                    if(isLast_indicator){
                      Navigate_and_Finish( context , Login_Screen() );
                    }
                    else{
                      boardController.nextPage(
                        duration: Duration(
                          milliseconds: 1000,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
          ],
        ),
      ) ,
    );
  }

  Widget buildBoardingItem (Boarding_model boarding) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image(
            image: AssetImage(
              '${boarding.image}',
            ),
            //fit: BoxFit.cover,
          ),
        ),
      ),

      Text(
        '${boarding.title}',
        style: TextStyle(
          fontSize: 24.0,

        ),
      ),
      SizedBox(
        height: 15.0,
      ),
      Text(
        '${boarding.body}',
        style: TextStyle(
          fontSize: 14.0,
        ),
      ),
      SizedBox(
        height: 30.0,
      ),
    ],
  );
}
