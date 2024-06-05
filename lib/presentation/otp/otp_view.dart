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

  static GlobalKey<FormState> textGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(context, designSize: const Size(360, 690));


    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
          child: Form(
            key: textGlobalKey,
            child: Column(
              children: [
                SizedBox(height: 80.h,),
                Align(
                  alignment: Alignment.topLeft,
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
                SizedBox(height: 50.h,),
                FittedBox(
                  child: CustomText(
                    txt: 'Hello, Rewan !!',
                    color: ColorsManager.blackColor,
                    fontfamily: FontManager.fontFamilyApp,
                    fontWeight: FontWightManager.fontWeightBold,
                    fontSize: FontSize.s28.sp,
                  ),
                ),
                SizedBox(height: 15.h,),
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
                SizedBox(height: 30.h,),
                CustomButton(
                  width: 330.w,
                  txt: 'Next',
                  high: 50.h,
                  onPressed: () {
                    if (textGlobalKey.currentState!.validate()) {
                      toast(state: StatusCase.SUCCES, msg: 'OTP Success');
                      NormalNav(ctx: context,screen: SetUpPassView());
                    }
                  },
                  outLineBorder: false,
                  colorButton: ColorsManager.buttonColor,
                  colorTxt: ColorsManager.whiteColor,
                  fontWeight: FontWightManager.fontWeightMedium,
                  fontSize: FontSize.s18,
                ),
                CustomTextClick(
                  txt: 'Send Again',
                  function: (){
                    NavAndRemove(ctx: context , screen: OtpView());
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
        ),
      ),
    );
  }
}
