import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../login/login-viewmodel/logCubit.dart';
import '../otp/otp_view.dart';
import '../resources/colors-manager.dart';
import '../resources/constant/custom_button.dart';
import '../resources/constant/custom_text.dart';
import '../resources/constant/custom_textclick.dart';
import '../resources/constant/staticwidget.dart';
import '../resources/constant/text-form-field.dart';
import '../resources/font-manager.dart';

class SetUpPassView extends StatelessWidget {
  const SetUpPassView({super.key});
  static GlobalKey<FormState> textGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(context, designSize: const Size(360, 690));

    var pass = TextEditingController();
    var passAuth = TextEditingController();

    LoginCubit cubit = LoginCubit.get(context);



    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
          child: Form(
            key: textGlobalKey,
            child: Column(
              children: [
                SizedBox(height: 80.h,),
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
                      txt: 'Setup New Password',
                      color: ColorsManager.blackColor,
                      fontfamily: FontManager.fontFamilyApp,
                      fontWeight: FontWightManager.fontWeightBold,
                      fontSize: FontSize.s28.sp,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: 50,vertical: 5),
                  child: FittedBox(
                    child: CustomText(
                      txt: 'Please, setup a new password for\n your account',
                      color: ColorsManager.blackColor,
                      fontfamily: FontManager.fontFamilyApp,
                      fontWeight: FontWightManager.fontWeightLight,
                      fontSize: FontSize.s19.sp,
                      textAlign: TextAlign.center,
                      height: 1.1.h,
                    ),
                  ),
                ),
                CustomTextFormField(
                  controller: pass,
                  hintTxt: 'New Password',
                  hintStyle: TextStyle(
                      color: ColorsManager.hintColor,
                      fontSize: FontSize.s16.sp,
                      fontFamily: FontManager.fontFamilyButton,
                      fontWeight: FontWightManager.fontWeightLight,
                  ),
                  radius: FontSize.s10.r,
                  colorBorder: ColorsManager.backGroundLogin,
                  colorBorderEnable: ColorsManager.backGroundLogin,
                  textAlign: TextAlign.center,
                  fontSize: FontSize.s16.sp,
                  fontWeight: FontWightManager.fontWeightLight,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Password required';
                    }
                  },
                  onSubmitted: (value) {
                    print(value);
                  },
                ),
                SizedBox(height: 10.h,),
                CustomTextFormField(
                  controller: passAuth,
                  hintTxt: 'Repeat Password',
                  hintStyle: TextStyle(
                    color: ColorsManager.hintColor,
                    fontSize: FontSize.s16.sp,
                    fontFamily: FontManager.fontFamilyButton,
                    fontWeight: FontWightManager.fontWeightLight,
                  ),
                  radius: FontSize.s10.r,
                  colorBorder: ColorsManager.backGroundLogin,
                  colorBorderEnable: ColorsManager.backGroundLogin,
                  textAlign: TextAlign.center,
                  fontSize: FontSize.s16.sp,
                  fontWeight: FontWightManager.fontWeightLight,
                  keyboardType: TextInputType.visiblePassword,
                  suffexIcon: cubit.suffixIcon,
                  suffexIconColor: cubit.suffixIconColor, // ToDo
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Password required';
                    } else if (value != pass.text) {
                      return 'Password Not Match';
                    }
                  },
                  onChange: () {
                    cubit.changeList();
                  },
                  onSubmitted: (value) {
                    print(value);
                  },
                ),
                SizedBox(height: 50.h,),
                CustomButton(
                  width: 330.w,
                  txt: 'Save',
                  high: 50.h,
                  onPressed: () {
                    if (textGlobalKey.currentState!.validate()) {
                      toast(state: StatusCase.SUCCES, msg: 'Changing Success');
                      cubit.changeList();
                    }
                    pass.clear();
                    passAuth.clear();
                  //  NormalNav(ctx: context,screen: OtpView());
                  },
                  outLineBorder: false,
                  colorButton: ColorsManager.buttonColor,
                  colorTxt: ColorsManager.whiteColor,
                  fontWeight: FontWightManager.fontWeightMedium,
                  fontSize: FontSize.s18,
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
        ),
      ),
    );
  }
}
