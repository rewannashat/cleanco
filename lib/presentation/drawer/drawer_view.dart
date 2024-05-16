import 'package:cleanco/presentation/resources/colors-manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/constant/custom_text.dart';
import '../resources/constant/staticwidget.dart';
import '../resources/font-manager.dart';

class DrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(context, designSize: const Size(360, 690));


    return Drawer(
      child: Container(
        color: ColorsManager.drawerColor,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(height: 50.h,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
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
                    Image.asset('assets/images/drawer.png'),
                  ],
                ),
                FittedBox(
                  child: CustomText(
                    txt: 'Mohamed Ali Gh',
                    color: ColorsManager.whiteColor,
                    fontfamily: FontManager.fontFamilyText,
                    fontWeight: FontWightManager.fontWeightSemiBold,
                    fontSize: FontSize.s18.sp,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            ListTile(
              title: Row(
                children: [
                  Image.asset('assets/images/profile.png'),
                  Text('Item 1'),
                ],
              ),
              onTap: () {},
            ),
            // Add more list tiles for additional items
          ],
        ),
      ),
    );
  }
}
