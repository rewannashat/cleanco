import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../login/login-viewmodel/logCubit.dart';
import '../login/login-viewmodel/logState.dart';
import '../otp/otp_view.dart';
import '../resources/colors-manager.dart';
import '../resources/constant/custom_button.dart';
import '../resources/constant/custom_text.dart';
import '../resources/constant/staticwidget.dart';
import '../resources/constant/text-form-field.dart';
import '../resources/font-manager.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static GlobalKey<FormState> textGlobalKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(context, designSize: const Size(360, 690));



    var email = TextEditingController();
    var phoneNum = TextEditingController();
    var pass = TextEditingController();
    var passAuth = TextEditingController();
    var name = TextEditingController();

    LoginCubit cubit = LoginCubit.get(context);


    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {},
          builder: (context, state) =>  Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
            child: Form(
              key: textGlobalKey,
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
                  SizedBox(height: 40.h,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: FittedBox(
                      child: CustomText(
                        txt: 'Register',
                        color: ColorsManager.blackColor,
                        fontfamily: FontManager.fontFamilyApp,
                        fontWeight: FontWightManager.fontWeightMedium,
                        // Fixed typo here
                        fontSize: FontSize.s32.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Row(
                    children: [
                      buildCustomButton(txt: 'Google',image: 'assets/images/gmail.png' ,press: () {}),
                      SizedBox(width: 5.w,),
                      buildCustomButton(txt: 'Appled',image: 'assets/images/apple.png', press: () {}),
                    ],
                  ),
                  SizedBox(height: 10.h,),
                  rowDiv(61.8.w),
                  SizedBox(
                    height: 21.h,
                  ),
                  CustomTextFormField(
                    controller: name,
                    hintTxt: 'Full Name',
                    hintStyle: TextStyle(
                        color: ColorsManager.hintColor,
                        fontSize: FontSize.s16.sp,
                        fontFamily: FontManager.fontFamilyButton,
                        fontWeight: FontWightManager.fontWeightLight),
                    radius: FontSize.s10.r,
                    colorBorder: ColorsManager.backGroundLogin,
                    colorBorderEnable: ColorsManager.backGroundLogin,
                    textAlign: TextAlign.start,
                    fontSize: FontSize.s16.sp,
                    fontWeight: FontWightManager.fontWeightLight,
                    keyboardType: TextInputType.text,

                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Full Name required';
                      }
                    },
                    onSubmitted: (value) {
                      print(value);
                    },
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                  CustomTextFormField(
                    controller: phoneNum,
                    hintTxt: 'Phone Number',
                    hintStyle: TextStyle(
                        color: ColorsManager.hintColor,
                        fontSize: FontSize.s16.sp,
                        fontFamily: FontManager.fontFamilyButton,
                        fontWeight: FontWightManager.fontWeightLight),
                    radius: FontSize.s10.r,
                    colorBorder: ColorsManager.backGroundLogin,
                    colorBorderEnable: ColorsManager.backGroundLogin,
                    textAlign: TextAlign.start,
                    fontSize: FontSize.s16.sp,
                    fontWeight: FontWightManager.fontWeightLight,
                    keyboardType: TextInputType.phone,

                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Phone Num required';
                      }
                    },
                    onSubmitted: (value) {
                      print(value);
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                    controller: pass,
                    hintTxt: 'Password',
                    hintStyle: TextStyle(
                        color: ColorsManager.hintColor,
                        fontSize: FontSize.s16.sp,
                        fontFamily: FontManager.fontFamilyButton,
                        fontWeight: FontWightManager.fontWeightLight),
                    radius: FontSize.s10.r,
                    colorBorder: ColorsManager.backGroundLogin,
                    colorBorderEnable: ColorsManager.backGroundLogin,
                    textAlign: TextAlign.start,
                    fontSize: FontSize.s16.sp,
                    fontWeight: FontWightManager.fontWeightLight,
                    keyboardType: TextInputType.visiblePassword,
                    suffexIcon: cubit.isIconClicked
                        ? Icons.visibility
                        : Icons.visibility_off,
                    onPressedSuffexIcon: () {
                      cubit.changeIcon();
                    },
                    obscureText: cubit.isIconClicked ? false : true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Password required';
                      }
                    },
                    onSubmitted: (value) {
                      print(value);
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                    controller: passAuth,
                    hintTxt: 'Password',
                    hintStyle: TextStyle(
                        color: ColorsManager.hintColor,
                        fontSize: FontSize.s16.sp,
                        fontFamily: FontManager.fontFamilyButton,
                        fontWeight: FontWightManager.fontWeightLight),
                    radius: FontSize.s10.r,
                    colorBorder: ColorsManager.backGroundLogin,
                    colorBorderEnable: ColorsManager.backGroundLogin,
                    textAlign: TextAlign.start,
                    fontSize: FontSize.s16.sp,
                    fontWeight: FontWightManager.fontWeightLight,
                    keyboardType: TextInputType.visiblePassword,
                    suffexIcon: cubit.isIconClicked
                        ? Icons.visibility
                        : Icons.visibility_off,
                    onPressedSuffexIcon: () {
                      cubit.changeIcon();
                    },
                    obscureText: cubit.isIconClicked ? false : true,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Password required';
                      } else if (value != pass.text) {
                        return 'Passwords do not match';
                      }
                    },
                    onSubmitted: (value) {
                      print(value);
                    },
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: cubit.isChecked,
                        onChanged: (bool? value) {
                          cubit.changeCheckIcon();
                        },

                      ),
                      FittedBox(
                        child: RichText(
                          text: TextSpan(
                            text: 'I’ve read and agree to the',
                            style: TextStyle(
                              fontWeight:FontWightManager.fontWeightRegular,
                              color: ColorsManager.hintColor,
                              fontFamily: FontManager.fontFamilyApp,
                              fontSize: FontSize.s12.sp,
                            ),
                            children:[
                              TextSpan(
                              text: ' terms',
                              style: TextStyle(
                                fontWeight:FontWightManager.fontWeightBold,
                                color: ColorsManager.titleTextColor,
                                fontFamily: FontManager.fontFamilyApp,
                                fontSize: FontSize.s10.sp,
                              ),),
                              TextSpan(
                                text: ' of',
                                style: TextStyle(
                                  fontWeight:FontWightManager.fontWeightRegular,
                                  color: ColorsManager.hintColor,
                                  fontFamily: FontManager.fontFamilyApp,
                                  fontSize: FontSize.s12.sp,
                                ),),
                              TextSpan(
                                text: ' privacy policy',
                                style: TextStyle(
                                  fontWeight:FontWightManager.fontWeightBold,
                                  color: ColorsManager.titleTextColor,
                                  fontFamily: FontManager.fontFamilyApp,
                                  fontSize: FontSize.s10.sp,
                                ),),
                            ],

                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                    const EdgeInsetsDirectional.symmetric(horizontal: 25),
                    child: CustomButton(
                      width: 330.w,
                      txt: 'Next',
                      high: 50.h,
                      onPressed: () {
                        if (textGlobalKey.currentState!.validate()) {
                          toast(state: StatusCase.SUCCES, msg: 'Register Success');
                          email.clear();
                          phoneNum.clear();
                          pass.clear();
                          passAuth.clear();
                          NormalNav(ctx: context,screen: OtpView());
                        }
                      },
                      outLineBorder: false,
                      colorButton: ColorsManager.buttonColor,
                      colorTxt: ColorsManager.whiteColor,
                      fontWeight: FontWightManager.fontWeightMedium,
                      fontSize: FontSize.s18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
Container buildCustomButton({String? txt, String? image , Function? press}) {
  return Container(
    margin: EdgeInsetsDirectional.symmetric(vertical: 10,),
    height: 54.h, width: 160.w,
    decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
        color: ColorsManager.whiteColor,
        borderRadius: BorderRadius.circular(FontSize.s12.r)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset(image!),
        FittedBox(
          child: CustomText(
            txt: txt,
            color:ColorsManager.blackColor,
            fontfamily: FontManager.fontFamilyApp,
            fontWeight: FontWightManager.fontWeightMedium,
            fontSize:FontSize.s15.sp,
          ),
        ),
      ],
    ),
  );
}