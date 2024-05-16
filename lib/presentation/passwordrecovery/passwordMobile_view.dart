import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../login/login-viewmodel/logCubit.dart';
import '../otp/otp_view.dart';
import '../resources/colors-manager.dart';
import '../resources/constant/custom_button.dart';
import '../resources/constant/custom_text.dart';
import '../resources/constant/custom_textclick.dart';
import '../resources/constant/staticwidget.dart';
import '../resources/constant/text-form-field.dart';
import '../resources/font-manager.dart';

class PasswordMobileView extends StatelessWidget {
  const PasswordMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(context, designSize: const Size(360, 690));

    var phoneNum = TextEditingController();

    LoginCubit cubit = LoginCubit.get(context);

    final textGlobalKey = GlobalKey<FormState>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150.h,
              child: Stack(
                children: [
                  Positioned(
                      top: -100,right: -50,
                      child: Image.asset('assets/images/bubbleRegister.png')),
                  Positioned(
                      top: 0,right: -10,
                      child: Image.asset('assets/images/bubbleRegist2.png')),
                ],
              ),
            ),
            Stack(children:[
              Center(
                child: Material(
                  elevation: 5, // Adjust elevation as needed
                  shape: CircleBorder(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorsManager.whiteColor, // White background color
                      shape: BoxShape.circle,
                    ),
                    width: 125.w, // Adjust size as needed
                    height: 85.h,
                  ),
                ),
              ),
              Center(
                child: Image.asset(
                  'assets/images/registPerson.png', // Replace with your image path
                  width: 90.w, // Adjust image size as needed
                  height:85.h,
                ),
              ),
            ],
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 80,vertical: 25),
              child: FittedBox(
                child: CustomText(
                  txt: 'Password Recovery',
                  color: ColorsManager.blackColor,
                  fontfamily: FontManager.fontFamilyApp,
                  fontWeight: FontWightManager.fontWeightBold,
                  fontSize: FontSize.s28.sp,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 50,vertical: 10),
              child: FittedBox(
                child: CustomText(
                  txt: 'How you would like to restore\n your password?',
                  color: ColorsManager.blackColor,
                  fontfamily: FontManager.fontFamilyApp,
                  fontWeight: FontWightManager.fontWeightLight,
                  fontSize: FontSize.s19.sp,
                  textAlign: TextAlign.center,
                  height: 1.1.h,
                ),
              ),
            ),
            Container(
                margin:  EdgeInsetsDirectional.symmetric(horizontal: 25,vertical: 40),
                child: Form(
                  key: textGlobalKey,
                  child: Column(
                    children: [
                      IntlPhoneField(
                        // autofocus: true,
                        controller: phoneNum,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          hintText: 'Enter Your Phone Number',
                          filled: true,
                          border: InputBorder.none,
                          fillColor: ColorsManager.backGroundLogin,
                          hintStyle: TextStyle(
                            color: ColorsManager.hintColor,
                            fontSize: FontSize.s14.sp,
                            fontFamily: FontManager.fontFamilyApp,
                            fontWeight: FontWightManager.fontWeightMedium,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(FontSize.s12.r),
                            borderSide:  BorderSide(color:ColorsManager.backGroundLogin),//out color
                          ),
                        ),
                        initialCountryCode: 'IN',

                        validator: (value) {
                          if (value == null) {
                            return 'Phone Number is required';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                )),
            Padding(
              padding:
              const EdgeInsetsDirectional.symmetric(horizontal: 25),
              child: CustomButton(
                width: 330.w,
                txt: 'Next',
                high: 50.h,
                onPressed: () {
                  if (textGlobalKey.currentState!.validate()) {
                    toast(state: StatusCase.SUCCES, msg: 'Send Otp Success');
                  }
                  phoneNum.clear();
                   NormalNav(ctx: context,screen: OtpView());
                },
                outLineBorder: false,
                colorButton: ColorsManager.buttonColor,
                colorTxt: ColorsManager.whiteColor,
                fontWeight: FontWightManager.fontWeightMedium,
                fontSize: FontSize.s18,
              ),
            ),
            CustomTextClick(
              txt: 'Cancel',
              function: (){
                lastNav(ctx: context);
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
