import 'dart:async';

import 'package:cleanco/presentation/resources/colors-manager.dart';
import 'package:cleanco/presentation/resources/font-manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../onboarding/onboarding_view.dart';
import '../resources/constant/custom_text.dart';
import '../resources/styles-manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnBoardingView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(context, designSize: const Size(360, 690));
    return Scaffold(
      backgroundColor: ColorsManager.backGround,
      body: Stack(
        children: [
          Positioned(
            top: 0,
              child: Image.asset('assets/images/Bubbles.png')),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Image.asset('assets/images/logo.png')),
              CustomText(
                txt: 'Clean Co',
                color: ColorsManager.titleTextColor,
                fontfamily: FontManager.fontFamilyTitle,
                fontWeight: FontWeight.bold, // Fixed typo here
                fontSize: FontSize.s30.sp,
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Center(
              child: Image.asset('assets/images/bubble.png'),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
