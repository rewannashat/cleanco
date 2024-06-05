import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../about/about_view.dart';
import '../adress/adress_view.dart';
import '../login/login_view.dart';
import '../profile/profile_view.dart';
import '../resources/colors-manager.dart';
import '../resources/constant/custom_button.dart';
import '../resources/constant/custom_text.dart';
import '../resources/constant/staticwidget.dart';
import '../resources/font-manager.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(context, designSize: const Size(360, 690));


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
             buildPadding(txt: 'Profile' , press: () => NormalNav(ctx: context , screen: ProfileView())
             ),
             buildPadding(txt: 'Address' , press: ()=> NormalNav(ctx: context , screen: AddressView())),
             buildPadding(txt: 'Language' , press: ()=>  _showAlertDialog(context: context , txt: 'العربية' , txt2: 'الإنجليزية')),
             buildPadding(txt: 'About Cleanco' , press: ()=> NormalNav(ctx: context , screen: AboutView(text: 'About Cleanco',))),
             buildPadding(txt: 'Currency' , press: ()=>  _showAlertDialog(context: context , txt: 'Qatar Rial' , txt2: 'US Dollar')),
             buildPadding(txt: 'Terms and conditions' , press: ()=>  NormalNav(ctx: context , screen: AboutView(text: 'Terms and Conditions',))),
             buildPadding(txt: 'Log Out' , press: () {
               _showDeleteAlertDialog(context: context , txt: 'Log Out' , txt2: 'Are you sure you want to logout?' ,
                   press: (){
                     NavAndRemove(ctx: context , screen: LoginView());
                     toast(state: StatusCase.SUCCES, msg: 'Log Out Success');
                   }
               );
             }),
             Padding(
               padding: const EdgeInsetsDirectional.symmetric(horizontal: 25,vertical: 20),
               child: Align(
                 alignment: Alignment.centerLeft,
                 child: GestureDetector(
                   onTap: () {
                     _showDeleteAlertDialog(context: context , txt: 'Delete' , txt2: 'Are you sure you want to delete\nyour account' ,
                     press: (){
                       Navigator.of(context).pop();
                       toast(state: StatusCase.ERROR, msg: 'Deleted Success');
                     }
                     );
                     },
                   child: FittedBox(
                     child: CustomText(
                       txt:'Delete My Account',
                       color: ColorsManager.redColor,
                       fontfamily: FontManager.fontFamilyText,
                       fontWeight: FontWightManager.fontWeightSemiBold,
                       fontSize: FontSize.s13.sp,
                       textAlign: TextAlign.left,
                     ),
                   ),
                 ),
               ),
             ),
           ],
         ),
       ),
    );
  }

  Padding buildPadding({String? txt , Function? press}) {
    return Padding(
             padding: const EdgeInsetsDirectional.symmetric(horizontal: 25,vertical: 5),
             child: Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     FittedBox(
                       child: CustomText(
                         txt:txt,
                         color: ColorsManager.blackColor,
                         fontfamily: FontManager.fontFamilyText,
                         fontWeight: FontWightManager.fontWeightSemiBold,
                         fontSize: FontSize.s16.sp,
                         textAlign: TextAlign.left,
                       ),
                     ),
                     IconButton(onPressed: () => press!(), icon: Icon(Icons.arrow_forward_ios)),
                   ],
                 ),
                 dividerList,

               ],
             ),
           );
  }

  void _showAlertDialog({BuildContext? context , String? txt ,String? txt2 ,  Function? press}) {
    showDialog(
      context: context!,
      builder: (BuildContext context) {
        return AlertDialog(

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                width: 330.w,
                txt: txt,
                high: 50.h,
                onPressed: press,
                outLineBorder: true,
                colorOutLineButton:ColorsManager.buttonColor,
                colorButton: ColorsManager.whiteColor,
                colorTxt: ColorsManager.buttonColor,
                fontWeight: FontWightManager.fontWeightMedium,
                fontSize: FontSize.s18,
              ),
              SizedBox(height: 10.h,),
              CustomButton(
                width: 330.w,
                txt: txt2,
                high: 50.h,
                onPressed: () {},
                outLineBorder: false,
                colorButton: ColorsManager.buttonColor,
                colorTxt: ColorsManager.whiteColor,
                fontWeight: FontWightManager.fontWeightMedium,
                fontSize: FontSize.s18,
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDeleteAlertDialog({BuildContext? context , String? txt , String? txt2 , Function? press}) {
    showDialog(
      context: context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(txt!),
          content: Text(txt2!),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
               press!();
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }

}

