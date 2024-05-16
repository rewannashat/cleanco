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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(context, designSize: const Size(360, 690));

    final textGlobalKey = GlobalKey<FormState>();

    var email = TextEditingController();
    var phoneNum = TextEditingController();
    var pass = TextEditingController();
    var passAuth = TextEditingController();

    LoginCubit cubit = LoginCubit.get(context);


    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {},
          builder: (context, state) =>  Column(
            children: [
              Container(
                height: 230.h,
                child: Stack(
                  children: [
                    Positioned(
                      top: -50,right: -50,
                        child: Image.asset('assets/images/bubbleRegister.png')),
                    Positioned(
                        top: 0,right: -10,
                        child: Image.asset('assets/images/bubbleRegist2.png')),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                        Padding(
                          padding:
                          const EdgeInsetsDirectional.symmetric(horizontal: 25),
                          child: Align(
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
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 25, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildCustomButton(txt: 'GOOGLE', press: () {}),
                    buildCustomButton(txt: 'APPLED', press: () {}),
                  ],
                ),
              ),
              rowDiv(61.8.w),
              SizedBox(
                height: 21.h,
              ),
              Form(
                key: textGlobalKey,
                child: Container(
                    padding:
                    const EdgeInsetsDirectional.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        CustomTextFormField(
                          controller: email,
                          backgroundColor: ColorsManager.backGroundLogin,
                          hintTxt: 'Enter You\'r E-mail Address',
                          hintStyle: TextStyle(
                              color: ColorsManager.hintColor,
                              fontSize: FontSize.s14.sp,
                              fontFamily: FontManager.fontFamilyApp,
                              fontWeight: FontWightManager.fontWeightMedium),
                          radius: FontSize.s10.r,
                          colorBorder: ColorsManager.backGroundLogin,
                          colorBorderEnable: ColorsManager.backGroundLogin,
                          textAlign: TextAlign.start,
                          fontSize: FontSize.s8.sp,
                          fontWeight: FontWightManager.fontWeightMedium,
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Email required';
                            }
                          },
                          onSubmitted: (value) {
                            print(value);
                          },
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
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
                        SizedBox(
                          height: 10.h,
                        ),
                        CustomTextFormField(
                          controller: pass,
                          backgroundColor: ColorsManager.backGroundLogin,
                          hintTxt: 'Password',
                          hintStyle: TextStyle(
                              color: ColorsManager.hintColor,
                              fontSize: FontSize.s14.sp,
                              fontFamily: FontManager.fontFamilyApp,
                              fontWeight: FontWightManager.fontWeightMedium),
                          radius: FontSize.s10.r,
                          colorBorder: ColorsManager.backGroundLogin,
                          colorBorderEnable: ColorsManager.backGroundLogin,
                          textAlign: TextAlign.start,
                          fontSize: FontSize.s8.sp,
                          fontWeight: FontWightManager.fontWeightMedium,
                          keyboardType: TextInputType.visiblePassword,
                          suffexIcon: cubit.isIconClicked
                              ? Icons.visibility
                              : Icons.visibility_off,
                          //cubit.isIconClicked ? Icons.visibility:
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
                          backgroundColor: ColorsManager.backGroundLogin,
                          hintTxt: 'Password',
                          hintStyle: TextStyle(
                              color: ColorsManager.hintColor,
                              fontSize: FontSize.s14.sp,
                              fontFamily: FontManager.fontFamilyApp,
                              fontWeight: FontWightManager.fontWeightMedium),
                          radius: FontSize.s10.r,
                          colorBorder: ColorsManager.backGroundLogin,
                          colorBorderEnable: ColorsManager.backGroundLogin,
                          textAlign: TextAlign.start,
                          fontSize: FontSize.s8.sp,
                          fontWeight: FontWightManager.fontWeightMedium,
                          keyboardType: TextInputType.visiblePassword,
                          suffexIcon: cubit.isIconClicked
                              ? Icons.visibility
                              : Icons.visibility_off,
                          //cubit.isIconClicked ? Icons.visibility:
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
                              }
                              email.clear();
                              phoneNum.clear();
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
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
CustomButton buildCustomButton({String? txt, Function? press}) {
  return CustomButton(
    txt: txt,
    outLineBorder: false,
    onPressed: press,
    high: 53.h,
    width: 150.w,
    colorButton: ColorsManager.backGroundLogin,
    colorTxt: ColorsManager.blackColor,
    fontFamily: FontManager.fontFamilyApp,
    fontWeight: FontWightManager.fontWeightMedium,
    fontSize: FontSize.s18.sp,
  );
}