import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import '../home/home_model.dart';
import '../resources/colors-manager.dart';
import '../resources/constant/custom_text.dart';
import '../resources/constant/staticwidget.dart';
import '../resources/font-manager.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(context, designSize: const Size(360, 690));

    int _pageIndex = 0 ;
    ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)),
    );

    return Scaffold(
      bottomNavigationBar: SnakeNavigationBar.color(
        height: 50.h,
        elevation: 5,
        shadowColor: ColorsManager.greyColor,
        behaviour: SnakeBarBehaviour.floating,
        snakeShape:SnakeShape.circle,
        shape: bottomBarShape,
        padding: EdgeInsets.symmetric(horizontal: 20),

        ///configuration for SnakeNavigationBar.color
        snakeViewColor: ColorsManager.buttonColor,
        selectedItemColor: ColorsManager.iconBottomBarColor ,
        unselectedItemColor: ColorsManager.iconBottomBarColor,

        ///configuration for SnakeNavigationBar.gradient
        //snakeViewGradient: selectedGradient,
        //selectedItemGradient: snakeShape == SnakeShape.indicator ? selectedGradient : null,
        //unselectedItemGradient: unselectedGradient,

        // showUnselectedLabels: showUnselectedLabels,
        // showSelectedLabels: showSelectedLabels,
        currentIndex: _pageIndex,
        // onTap: (index) => setState(() => _selectedItemPosition = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.book), label: 'book'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'message')
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200.h,
              child: Stack(
                children: [
                  Positioned(
                      top: -50,right: -50,
                      child: Image.asset('assets/images/bubbleRegister.png')),
                  Positioned(
                      top: 0,right: -10,
                      child: Image.asset('assets/images/bubbleRegist2.png')),
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

                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(
                  child: CustomText(
                    txt: 'Categories',
                    color: ColorsManager.blackColor,
                    fontfamily: FontManager.fontFamilyApp,
                    fontWeight: FontWightManager.fontWeightBold,
                    fontSize: FontSize.s24.sp,
                  ),
                ),
                GridView.builder(
                  itemCount: homeModel.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder:  (context, index) {
                    return buildContainer(index);
                  },
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
Column buildContainer(int index) {
  return Column(
    children: [
      Container(
        width: 100.w, height: 90.h,
        decoration: BoxDecoration(
          color: ColorsManager.backGroundPhotoColor,
          borderRadius: BorderRadius.circular(FontSize.s14.r),
          image: DecorationImage(
            image: AssetImage(homeModel[index].image as String),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        //  child: Image.asset('assets/images/list1.png'),
      ),
      SizedBox(height: 10.h,),
      FittedBox(
        child: CustomText(
          txt: homeModel[index].text,
          color: ColorsManager.blackColor,
          fontfamily: FontManager.fontFamilyText,
          fontWeight: FontWightManager.fontWeightMedium,
          fontSize: FontSize.s15.sp,
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}