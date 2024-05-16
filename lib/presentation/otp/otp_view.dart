import 'package:cleanco/presentation/otp/static_otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../passwordrecovery/setupPass_view.dart';
import '../resources/colors-manager.dart';
import '../resources/constant/custom_button.dart';
import '../resources/constant/custom_text.dart';
import '../resources/constant/custom_textclick.dart';
import '../resources/constant/staticwidget.dart';
import '../resources/font-manager.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(context, designSize: const Size(360, 690));

    var textGlobalKey = GlobalKey<FormState>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200.h,
              child: Stack(
                children: [
                  Positioned(
                      top:-230,left: -150,
                      child: Image.asset('assets/images/bubbleOtp.png')),
                  Positioned(
                      top: -260,left: -220,
                      child: Image.asset('assets/images/bubbleOtp2.png')),
                  Positioned(
                    top: 50,
                    child: GestureDetector(
                      onTap: (){
                        lastNav(ctx: context);
                      },
                      child: Container(
                        margin:const EdgeInsetsDirectional.symmetric(
                          horizontal: 25,),
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

                ],
              ),
            ),
            FittedBox(
              child: CustomText(
                txt: 'Hello, Rewan !!',
                color: ColorsManager.blackColor,
                fontfamily: FontManager.fontFamilyApp,
                fontWeight: FontWightManager.fontWeightBold,
                fontSize: FontSize.s28.sp,
              ),
            ),
            SizedBox(height: 25.h,),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 50),
              child: FittedBox(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Check your SMS inbox, we have sent\nyou the code at',
                    style: TextStyle(
                      fontWeight:FontWightManager.fontWeightRegular,
                      color: ColorsManager.blackColor,
                      fontFamily: FontManager.fontFamilyApp,
                      fontSize: FontSize.s18.sp,
                    ),
                    children: [
                      TextSpan(
                        text: '+974 6621 9400.',
                        style: TextStyle(
                          fontWeight:FontWightManager.fontWeightBold,
                          color: ColorsManager.blackColor,
                          fontFamily: FontManager.fontFamilyApp,
                          fontSize: FontSize.s18.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            OTPContainer(),
            Padding(
              padding:
              const EdgeInsetsDirectional.symmetric(horizontal: 25,vertical: 30),
              child: CustomButton(
                width: 330.w,
                txt: 'Next',
                high: 50.h,
                onPressed: () {
                 /* if (textGlobalKey.currentState!.validate()) {
                    toast(state: StatusCase.SUCCES, msg: 'Register Success');
                  }*/
                  NormalNav(ctx: context,screen: SetUpPassView());
                },
                outLineBorder: false,
                colorButton: ColorsManager.buttonColor,
                colorTxt: ColorsManager.whiteColor,
                fontWeight: FontWightManager.fontWeightMedium,
                fontSize: FontSize.s18,
              ),
            ),
            CustomTextClick(
              txt: 'Send Again',
              function: (){
             //   NavAndRemove(ctx: context , screen: LoginView());
              },
              fontfamily: FontManager.fontFamilyButton,
              fontWeight: FontWightManager.fontWeightRegular, // Fixed typo here
              fontSize: FontSize.s15.sp,
              textAlign: TextAlign.center,
              color: ColorsManager.staticTextColor,
            ),
          ],
        ),
      ),
    );
  }
}
