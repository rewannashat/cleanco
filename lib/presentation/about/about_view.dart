import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors-manager.dart';
import '../resources/constant/custom_text.dart';
import '../resources/constant/staticwidget.dart';
import '../resources/font-manager.dart';

class AboutView extends StatelessWidget {
  String? text ;
   AboutView({this.text , super.key});

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
            SizedBox(height: 30.h,),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  child: CustomText(
                    txt:text,
                    color: ColorsManager.starColor,
                    fontfamily: FontManager.fontFamilyText,
                    fontWeight: FontWightManager.fontWeightSemiBold,
                    fontSize: FontSize.s24.sp,
                    textAlign: TextAlign.left,
                    height: 1.3,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h,),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
              child: CustomText(
                txt:'here are many variations of passages of Lorem Ipsum available,\n but the majority have suffered alteration in some form, by injected humour,\n'
                    'or randomised words which don\'t look even slightly believable. If you are going to use\n'
                    'a passage of Lorem Ipsum, you need to be \n\n'
                    'sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum\n'
                    'generators on the Internet tend to repeat predefined chunks as necessary, making\n\n'
                    'this the first true generator on the Internet It uses a dictionary of over 200 Latin words\n'
                    'combined with a handful of model sentence\n\n'
                    'structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum\n'
                    'is therefore always free from repetition,\ninjected humour, or non-characteristic words\n'
                    'etc.',
                color: ColorsManager.blackColor,
                fontfamily: FontManager.fontFamilyText,
                fontWeight: FontWightManager.fontWeightSemiBold,
                fontSize: FontSize.s16.sp,
                textAlign: TextAlign.left,
                maxLine: 100,
                height: 1.4,
              ),
            ),

          ],
        ),
      ),
    );
  }
}
