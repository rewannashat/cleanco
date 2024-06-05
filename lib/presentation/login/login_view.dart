import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:phone_text_field/phone_text_field.dart';

import '../home/home_view.dart';
import '../passwordrecovery/passwordMobile_view.dart';
import '../register/register_view.dart';
import '../resources/colors-manager.dart';
import '../resources/constant/custom_button.dart';
import '../resources/constant/custom_text.dart';
import '../resources/constant/newtextfield.dart';
import '../resources/constant/staticwidget.dart';
import '../resources/constant/text-form-field.dart';
import '../resources/font-manager.dart';
import 'login-viewmodel/logCubit.dart';
import 'login-viewmodel/logState.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(context, designSize: const Size(360, 690));

    var phone = TextEditingController();
    var pass = TextEditingController();

    LoginCubit cubit = LoginCubit.get(context);

    final textScaffoldKey = GlobalKey<ScaffoldState>();


    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key:_formKey,
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(height: 80.h,),
                    Align(
                      alignment: Alignment.center,
                      child: FittedBox(
                        child: CustomText(
                          txt: 'Log In',
                          color: ColorsManager.blackColor,
                          fontfamily: FontManager.fontFamilyApp,
                          fontWeight: FontWightManager.fontWeightMedium,
                          // Fixed typo here
                          fontSize: FontSize.s32.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h,),
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
                      controller: phone,
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
                      height: 21.h,
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
                      height: 50.h,
                    ),
                    CustomButton(
                      width: 330.w,
                      txt: 'Login',
                      high: 50.h,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          toast(state: StatusCase.SUCCES, msg: 'Login Success');
                          NavAndRemove(ctx: context,screen: HomeView());
                          phone.clear();
                          pass.clear();
                        }

                      },
                      outLineBorder: false,
                      colorButton: ColorsManager.buttonColor,
                      colorTxt: ColorsManager.whiteColor,
                      fontWeight: FontWightManager.fontWeightMedium,
                      fontSize: FontSize.s18,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        onPressed: () {
                          // NavAndRemove(ctx: context , screen: RegisterScreen());
                        },
                        child: FittedBox(
                          child: CustomText(
                            txt: 'Don\'t Have An Account?',
                            color: ColorsManager.blackColor,
                            fontfamily: FontManager.fontFamilyApp,
                            fontWeight: FontWightManager.fontWeightMedium,
                            fontSize: FontSize.s14.sp,
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              child: FittedBox(
                                child: CustomText(
                                  txt: 'REGISTER',
                                  color: ColorsManager.buttonColor,
                                  fontfamily: FontManager.fontFamilyApp,
                                  fontWeight: FontWightManager.fontWeightBold,
                                  // Fixed typo here
                                  fontSize: FontSize.s16.sp,
                                ),
                              ),
                              onTap: () {
                                NormalNav(ctx: context,screen: RegisterView());
                              },
                            ),
                            IconButton(
                              onPressed: () => {
                                NormalNav(ctx: context,screen: RegisterView())
                              },
                              icon: const Icon(Icons.arrow_forward),
                              color: ColorsManager.buttonColor,
                              alignment: Alignment.centerRight,
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
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
}

