import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors-manager.dart';
import '../resources/constant/custom_button.dart';
import '../resources/constant/custom_text.dart';
import '../resources/constant/staticwidget.dart';
import '../resources/constant/text-form-field.dart';
import '../resources/font-manager.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static GlobalKey<FormState> textGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(context, designSize: const Size(360, 690));

    var firstName = TextEditingController();
    var phoneNum = TextEditingController();
    var email = TextEditingController();
    var id = TextEditingController();





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
            SizedBox(height: 15.h,),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 25),
              child: Align(
                alignment: Alignment.centerLeft,
                child: FittedBox(
                  child: CustomText(
                    txt:'Hello,\nMohamed Ali Gh !',
                    color: ColorsManager.blackColor,
                    fontfamily: FontManager.fontFamilyButton,
                    fontWeight: FontWightManager.fontWeightMedium,
                    fontSize: FontSize.s28.sp,
                    textAlign: TextAlign.left,
                    height: 1.3,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h,),
            buildPadding(textEditingController: firstName , txt: 'Full Name' , label: 'Rewan Nashat'),
            buildPadding(textEditingController: phoneNum , txt: 'Phone Number' , label: '+201282986958'),
            buildPadding(textEditingController: email , txt: 'E-mail Address' , label: 'mrrwan55@gmail.com'),
            buildPadding(textEditingController: id , txt: 'Qatar ID' , label: '3021945566515615'),
            SizedBox(height: 20.h,),
            CustomButton(
              width: 211.w,
              txt: 'Save Changes',
              high: 56.h,
              onPressed: () {
                toast(state: StatusCase.SUCCES, msg: 'Change Success');
              },
              outLineBorder: false,
              colorButton: ColorsManager.buttonColor,
              colorTxt: ColorsManager.whiteColor,
              fontWeight: FontWightManager.fontWeightMedium,
              fontSize: FontSize.s18,
            ),



          ],
        ),
      ),
    );
  }

  Padding buildPadding({TextEditingController? textEditingController , String? txt ,String? label ,  Function? press}) {
    return Padding(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 25,vertical: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: FittedBox(
                    child: CustomText(
                      txt:txt,
                      color: ColorsManager.blackColor,
                      fontfamily: FontManager.fontFamilyApp,
                      fontWeight: FontWightManager.fontWeightBold,
                      fontSize: FontSize.s12.sp,
                      textAlign: TextAlign.left,
                      height: 1.3,
                    ),
                  ),
                ),
                SizedBox(height: 8.h,),
                CustomTextFormField(
                  controller: textEditingController,
                  label: label,
                  labelStyle: TextStyle(
                    color: ColorsManager.hintColor,
                    fontSize: FontSize.s14.sp,
                    fontFamily: FontManager.fontFamilyApp,
                    fontWeight: FontWightManager.fontWeightMedium,
                  ),
                  radius: FontSize.s8.r,
                  colorBorder: ColorsManager.backGroundLogin,
                  colorBorderEnable: ColorsManager.backGroundLogin,
                  fillColor:ColorsManager.backGroundLogin ,
                  textAlign: TextAlign.center,
                  fontSize: FontSize.s16.sp,
                  fontWeight: FontWightManager.fontWeightLight,
                  keyboardType: TextInputType.name,
                  suffexIcon: Icons.edit_note_sharp,
                  suffexIconColor: ColorsManager.baseTextColor,
                  onSubmitted: (value) {
                    print(value);
                  },
                ),

              ],
            ),
          );
  }
}
