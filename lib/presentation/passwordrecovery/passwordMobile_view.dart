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
  static GlobalKey<FormState> textGlobalKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(context, designSize: const Size(360, 690));

    var phoneNum = TextEditingController();

    LoginCubit cubit = LoginCubit.get(context);


    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
          child: Form(
            key: textGlobalKey,
            child: Column(
              children: [
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
                CustomTextFormField(
                  controller: phoneNum,
                  hintTxt: 'Phone Number',
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
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Phone Number required';
                    }
                  },
                  onSubmitted: (value) {
                    print(value);
                  },
                ),
                SizedBox(height: 10.h,),
                CustomButton(
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
