
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors-manager.dart';
import '../resources/constant/custom_button.dart';
import '../resources/constant/custom_text.dart';
import '../resources/constant/staticwidget.dart';
import '../resources/font-manager.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(context, designSize: const Size(360, 690));


    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80.h,),
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: (){
                  lastNav(ctx: context);
                },
                child: Container(
                  margin:const EdgeInsetsDirectional.symmetric(horizontal: 25,),
                  height: 47.h,width: 47.w,
                  decoration: BoxDecoration(
                    color: ColorsManager.whiteColor,
                    borderRadius: BorderRadius.circular(FontSize.s15.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ),
            SizedBox(height: 40.h,),
            Image.asset('assets/images/adress.png' , ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 25,),
              child: Align(
                alignment: Alignment.topLeft,
                child: FittedBox(
                  child: CustomText(
                    txt:'Select Address :',
                    color: ColorsManager.blackColor,
                    fontfamily: FontManager.fontFamilyButton,
                    fontWeight: FontWightManager.fontWeightMedium,
                    fontSize: FontSize.s18.sp,
                    textAlign: TextAlign.left,
                    height: 1.3,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            CustomButton(
              width: 330.w,
              txt: 'Use Current Location',
              high: 50.h,
              onPressed: () {},
              outLineBorder: false,
              colorButton: ColorsManager.buttonColor,
              colorTxt: ColorsManager.whiteColor,
              fontWeight: FontWightManager.fontWeightMedium,
              fontSize: FontSize.s18,
            ),
            SizedBox(height: 20.h,),
            CustomButton(
              width: 330.w,
              txt: 'Set From Map',
              high: 50.h,
              onPressed: () {},
              outLineBorder: true,
              colorOutLineButton:ColorsManager.buttonColor,
              colorButton: ColorsManager.whiteColor,
              colorTxt: ColorsManager.buttonColor,
              fontWeight: FontWightManager.fontWeightMedium,
              fontSize: FontSize.s18,
            ),
          ],
        ),
      ),
    );
  }
}
