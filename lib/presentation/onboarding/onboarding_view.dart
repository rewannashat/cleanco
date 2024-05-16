import 'package:cleanco/presentation/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors-manager.dart';
import '../resources/constant/custom_button.dart';
import '../resources/constant/custom_text.dart';
import '../resources/constant/custom_textclick.dart';
import '../resources/constant/staticwidget.dart';
import '../resources/font-manager.dart';

class OnBoardingView extends StatefulWidget {
  @override
  _OnBoardingViewState createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  late PageController _pageController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void nextPage() {
    if (index < 2) {
      setState(() {
        index++;
      });
      _pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginView()),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(context, designSize: const Size(360, 690));
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            index = value;
            print(index);
          });
        },
        children: [
          Page(
            image: 'assets/images/on1.png',
            title: 'Cleaning Service',
            titleButton: 'Get Started',
            press: () {
              nextPage();
            },
            index: 0,
          ),
          Page(
            image: 'assets/images/on2.png',
            title: 'Work Quality',
            titleButton: 'Next',
            press: () {
              nextPage();
            },
            index: 1,
          ),
          Page(
            image: 'assets/images/on3.png',
            title: 'Work Quality',
            titleButton: 'Next',
            index: 2,
            press: () {
              NavAndRemove(ctx: context , screen: LoginView());
            },
          ),
        ],
      ),
    );
  }
}

class Page extends StatelessWidget {
  final String image;
  final String title;
  final String titleButton;
  final VoidCallback press;
  final int index ;

  const Page({
    required this.image,
    required this.title,
    required this.titleButton,
    required this.press,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30.h,),
        Image.asset(image),
        CustomText(
          txt: title,
          color: ColorsManager.titleTextColor,
          fontfamily: FontManager.fontFamilyTitle,
          fontWeight: FontWightManager.fontWeightLight, // Fixed typo here
          fontSize: FontSize.s32.sp,
        ),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 18,vertical: 20),
          child: CustomText(
            txt: 'Room Cleaning means the performance of services or that are cleanliness',
            color: ColorsManager.blackColor,
            fontfamily: FontManager.fontFamilyApp,
            fontWeight: FontWightManager.fontWeightRegular, // Fixed typo here
            fontSize: FontSize.s15.sp,
            textAlign: TextAlign.center,
          ),
        ),
        Center(child: Circle(index)),
        SizedBox(height: 30.h,),
        CustomButton(
          width:330.w,
          txt:titleButton,
          high:50.h,
          onPressed:press ,
          outLineBorder: false,
          colorButton: ColorsManager.buttonColor,
          colorTxt: ColorsManager.whiteColor,
          fontWeight: FontWightManager.fontWeightMedium,
          fontSize: FontSize.s18,
        ),
        CustomTextClick(
          txt: 'Skip',
          function: (){
            NavAndRemove(ctx: context , screen: LoginView());
          },
          fontfamily: FontManager.fontFamilyButton,
          fontWeight: FontWightManager.fontWeightRegular, // Fixed typo here
          fontSize: FontSize.s15.sp,
          textAlign: TextAlign.center,
          color: ColorsManager.staticTextColor,
        ),
      ],
    );
  }
}

class Circle extends StatelessWidget {
  int i ;
  Circle(this.i);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildContainer(i==0?19.w:6.w , i==0 ?ColorsManager.buttonColor:ColorsManager.circleColor ),
        buildContainer(i==1?19.w:6.w, i==1 ?ColorsManager.buttonColor:ColorsManager.circleColor),
        buildContainer(i==2?19.w:6.w, i==2 ?ColorsManager.buttonColor:ColorsManager.circleColor),
      ],
    );
  }

  Container buildContainer(double width,Color color) {
    return Container(
      margin: EdgeInsets.all(5),
      width: width,
      height: 6.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        //shape: BoxShape.circle,
        color:color,
      ),
    );
  }


}
