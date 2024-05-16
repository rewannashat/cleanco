import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

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

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(context, designSize: const Size(360, 690));

    var phone = TextEditingController();
    var pass = TextEditingController();

    LoginCubit cubit = LoginCubit.get(context);

    final textGlobalKey = GlobalKey<FormState>();


    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // resizeToAvoidBottomInset: true,
        body: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return SingleChildScrollView(
              //   reverse: true,
              child: Column(
                children: [
                  Container(
                    height: 230.h,
                    child: Stack(
                      children: [
                        Positioned(
                            top: -150,
                            left: -140,
                            child: Image.asset('assets/images/leftbubble.png')),
                        Positioned(
                            top: -20,
                            right: -130,
                            child: Image.asset('assets/images/rightbubble.png')),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsetsDirectional.symmetric(horizontal: 25),
                    child: Align(
                      alignment: Alignment.topLeft,
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
                  Container(
                      padding:  EdgeInsetsDirectional.symmetric(horizontal: 25),
                      child: Form(
                        key: textGlobalKey,
                        child: Column(
                          children: [
                            IntlPhoneField(
                            //  autofocus: true,
                              controller: phone,
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
                            CustomTextFormField(
                              autofocus: true,
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
                          ],
                        ),
                      )),
                  Padding(
                    padding:
                    const EdgeInsetsDirectional.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: TextButton(
                        onPressed: () {
                          NormalNav(ctx: context , screen: PasswordMobileView());
                        },
                        child: FittedBox(
                          child: CustomText(
                            txt: 'Forgot Password?',
                            color: ColorsManager.messageTextColor,
                            fontfamily: FontManager.fontFamilyApp,
                            fontWeight: FontWightManager.fontWeightRegular,
                            // Fixed typo here
                            fontSize: FontSize.s12.sp,
                            decoration: TextDecoration.underline,
                            decorationColor: ColorsManager.messageTextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsetsDirectional.symmetric(horizontal: 25),
                    child: CustomButton(
                      width: 330.w,
                      txt: 'Login',
                      high: 50.h,
                      onPressed: () {
                        if (textGlobalKey.currentState!.validate()) {
                          toast(state: StatusCase.SUCCES, msg: 'Login Success');
                        }
                        phone.clear();
                        pass.clear();
                        NavAndRemove(ctx: context,screen: HomeView());
                      },
                      outLineBorder: false,
                      colorButton: ColorsManager.buttonColor,
                      colorTxt: ColorsManager.whiteColor,
                      fontWeight: FontWightManager.fontWeightMedium,
                      fontSize: FontSize.s18,
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsetsDirectional.symmetric(horizontal: 15),
                    child: Align(
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
                            // Fixed typo here
                            fontSize: FontSize.s14.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsetsDirectional.symmetric(horizontal: 28),
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
                  Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom)),
                ],
              ),
            );
          },
        ),
      ),
    );
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
}

