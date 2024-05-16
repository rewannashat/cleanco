import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../Categories/categories_view.dart';
import '../drawer/drawer_view.dart';
import '../resources/colors-manager.dart';
import '../resources/constant/custom_button.dart';
import '../resources/constant/custom_text.dart';
import '../resources/constant/staticwidget.dart';
import '../resources/font-manager.dart';
import 'home_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

int _currentIndex = 0;
int _currentIndex2 = 0;

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ScreenUtil.init(context, designSize: const Size(360, 690));

    int _pageIndex = 0 ;
    ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)),
    );

    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


    return Scaffold(
      drawer: DrawerView(),
      key: scaffoldKey,
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
                    children: [
                      SizedBox(height: 80.h,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: (){
                            scaffoldKey.currentState?.openDrawer();
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
                            child: Image.asset('assets/images/home.png'),
                          ),
                        ),
                      ),
                      SizedBox(height: 40.h,),
                      Padding(
                        padding:const EdgeInsetsDirectional.symmetric(
                          horizontal: 25,),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: FittedBox(
                            child: CustomText(
                              txt: 'Hi Ali, Which Service\nDo you Need ?',
                              color: ColorsManager.blackColor,
                              fontfamily: FontManager.fontFamilyApp,
                              fontWeight: FontWightManager.fontWeightMedium,
                              fontSize: FontSize.s20.sp,
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CarouselSlider(
                items:[1,2,3].map((e) {
                  return Container(
                  margin: EdgeInsetsDirectional.symmetric(horizontal: 15),
                  width: 351.w,height: 195.h,
                  decoration: BoxDecoration(
                     // color: containerColors[index],
                     color: ColorsManager.backGroundPhotoColor,
                      borderRadius: BorderRadius.circular(FontSize.s14.r)
                  ),
                  child: Stack(
                    children: [
                      Center(child: Image.asset('assets/images/stack.png')),
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(horizontal: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FittedBox(
                              child: CustomText(
                                txt: 'Get 30% Off',
                                color: ColorsManager.blackColor,
                                fontfamily: FontManager.fontFamilyApp,
                                fontWeight: FontWightManager.fontWeightBold,
                                fontSize: FontSize.s24.sp,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 5.h,),
                            FittedBox(
                              child: CustomText(
                                txt: 'Get discount for every \norder  only valid for today',
                                color: ColorsManager.blackColor,
                                fontfamily: FontManager.fontFamilyApp,
                                fontWeight: FontWightManager.fontWeightBold,
                                fontSize: FontSize.s13.sp,
                                textAlign: TextAlign.center,
                                height: 1.1.h,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
                },).toList(),
                options: CarouselOptions(
                  aspectRatio: 16/9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentIndex = index ;
                    });
                  },
                )
            ),
            CircleIndicator(_currentIndex,[0,1,2]),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                    child: CustomText(
                      txt: 'Categories',
                      color: ColorsManager.blackColor,
                      fontfamily: FontManager.fontFamilyButton,
                      fontWeight: FontWightManager.fontWeightMedium,
                      fontSize: FontSize.s18.sp,
                      textAlign: TextAlign.start,
                    ),
                  ),
                 GestureDetector(
                   onTap: (){
                     NormalNav(ctx: context,screen: CategoriesView());
                   },
                   child: Row(
                     children: [
                       FittedBox(
                         child: CustomText(
                           txt: 'See all',
                           color: ColorsManager.blackColor,
                           fontfamily: FontManager.fontFamilyButton,
                           fontWeight: FontWightManager.fontWeightLight,
                           fontSize: FontSize.s12.sp,
                           textAlign: TextAlign.start,
                         ),
                       ),
                       Icon(Icons.arrow_forward_ios, color: ColorsManager.blackColor,size: FontSize.s14.sp,),
                     ],
                   ),
                 )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20,),
              child: GridView.builder(
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
            ),
            Container(
              height: 450.h,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        left:-120,
                          child: Image.asset('assets/images/homme.png')),
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FittedBox(
                              child: CustomText(
                                txt: 'Popular House Maid',
                                color: ColorsManager.blackColor,
                                fontfamily: FontManager.fontFamilyButton,
                                fontWeight: FontWightManager.fontWeightMedium,
                                fontSize: FontSize.s18.sp,
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Row(
                              children: [
                                FittedBox(
                                  child: CustomText(
                                    txt: 'See all',
                                    color: ColorsManager.blackColor,
                                    fontfamily: FontManager.fontFamilyButton,
                                    fontWeight: FontWightManager.fontWeightLight,
                                    fontSize: FontSize.s12.sp,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                Icon(Icons.arrow_forward_ios, color: ColorsManager.blackColor,size: FontSize.s14.sp,),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(vertical: 60),
                        child: Column(
                          children: [
                            CarouselSlider(
                                items:[1,2,3,4,5].map((e) {
                                  return Container(
                                      margin: EdgeInsetsDirectional.symmetric(horizontal: 15),
                                      width: 330.w,height: 112.h,
                                      decoration: BoxDecoration(
                                        color: ColorsManager.whiteColor,
                                        borderRadius: BorderRadius.circular(FontSize.s18.r),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.1),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: const Offset(0, 3), // changes position of shadow
                                          ),],
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset('assets/images/list2.png'),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  FittedBox(
                                                    child: CustomText(
                                                      txt: 'Shruti Kedia',
                                                      color: ColorsManager.blackColor,
                                                      fontfamily: FontManager.fontFamilyButton,
                                                      fontWeight: FontWightManager.fontWeightMedium,
                                                      fontSize: FontSize.s16.sp,
                                                      textAlign: TextAlign.start,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10.h,),
                                                  FittedBox(
                                                    child: CustomText(
                                                        txt: 'Hi my name is Kedia and \nI m House maid',
                                                        color: ColorsManager.blackColor,
                                                        fontfamily: FontManager.fontFamilyButton,
                                                        fontWeight: FontWightManager.fontWeightLight,
                                                        fontSize: FontSize.s12.sp,
                                                        textAlign: TextAlign.start,
                                                        height: 0.9.h
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 20.w,),
                                              Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: [
                                                  IconButton(onPressed: (){}, icon: Icon(Icons.favorite) , color: ColorsManager.redColor,),

                                                ],
                                              ),

                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(right: 20),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                Icon(Icons.star_rate , color: ColorsManager.starColor,),
                                                Icon(Icons.star_rate , color: ColorsManager.starColor,),
                                                Icon(Icons.star_rate , color: ColorsManager.starColor,),
                                                Icon(Icons.star_rate , color: ColorsManager.starColor,),

                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                  );
                                },).toList(),
                                options: CarouselOptions(
                                  aspectRatio: 25/9,
                                  viewportFraction: 1.2,
                                  initialPage: 0,
                                  enableInfiniteScroll: true,
                                  reverse: false,
                                  autoPlay: true,
                                  autoPlayInterval: Duration(seconds: 3),
                                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeCenterPage: true,
                                  enlargeFactor: 0.3,
                                  scrollDirection: Axis.horizontal,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _currentIndex2 = index ;
                                    });
                                  },
                                )
                            ),
                            CircleIndicator(_currentIndex2,[0,1,2,3,4]),
                            Padding(
                              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  FittedBox(
                                    child: CustomText(
                                      txt: 'Feature Nurses ',
                                      color: ColorsManager.blackColor,
                                      fontfamily: FontManager.fontFamilyButton,
                                      fontWeight: FontWightManager.fontWeightMedium,
                                      fontSize: FontSize.s18.sp,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      FittedBox(
                                        child: CustomText(
                                          txt: 'See all',
                                          color: ColorsManager.blackColor,
                                          fontfamily: FontManager.fontFamilyButton,
                                          fontWeight: FontWightManager.fontWeightLight,
                                          fontSize: FontSize.s12.sp,
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      Icon(Icons.arrow_forward_ios, color: ColorsManager.blackColor,size: FontSize.s14.sp,),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 150.h,
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: nurseModel.length,
                                scrollDirection:Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return buildContainerList(index);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                    child: CustomText(
                      txt: 'Top 4 Laundry in Al Khor',
                      color: ColorsManager.blackColor,
                      fontfamily: FontManager.fontFamilyButton,
                      fontWeight: FontWightManager.fontWeightMedium,
                      fontSize: FontSize.s18.sp,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Row(
                    children: [
                      FittedBox(
                        child: CustomText(
                          txt: 'See all',
                          color: ColorsManager.blackColor,
                          fontfamily: FontManager.fontFamilyButton,
                          fontWeight: FontWightManager.fontWeightLight,
                          fontSize: FontSize.s12.sp,
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios, color: ColorsManager.blackColor,size: FontSize.s14.sp,),
                    ],
                  )
                ],
              ),
            ),
            Container(
              height: 140.h,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                scrollDirection:Axis.horizontal,
                padding: EdgeInsetsDirectional.symmetric(vertical: 10,),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                    child: Stack(
                      children: [
                        Image.asset('assets/images/listView.png'),
                        Positioned(
                          bottom:15,left:25,
                          child: CustomButton(
                            outLineBorder: false,
                            width: 91.w,high: 35.h,
                            onPressed: (){},
                            borderRadius: FontSize.s10.r,
                            colorButton: ColorsManager.buttonCategoryColor,
                            txt: 'Book',
                            colorTxt: ColorsManager.whiteColor,
                            fontFamily:FontManager.fontFamilyButton,
                            alignment: Alignment.center,
                            fontWeight: FontWightManager.fontWeightSemiBold,
                            fontSize: FontSize.s16.sp,

                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),


          ],
        ),
      ),
    );
  }

  Container buildContainerList(int index) {
    return Container (
                                  width: 96.w,
                                  margin: EdgeInsetsDirectional.symmetric(horizontal: 15,vertical: 5),
                                  decoration: BoxDecoration(
                                    color: ColorsManager.whiteColor,
                                    borderRadius: BorderRadius.circular(FontSize.s18.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3), // changes position of shadow
                                      ),],
                                  ),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(onPressed: (){}, icon: Icon(Icons.favorite) , color: ColorsManager.redColor,),
                                          Row(
                                            children: [
                                              Icon(Icons.star_rate , color: ColorsManager.starColor,),
                                              FittedBox(
                                                child: CustomText(
                                                  txt: '2.9',
                                                  color: ColorsManager.blackColor,
                                                  fontfamily: FontManager.fontFamilyButton,
                                                  fontWeight: FontWightManager.fontWeightMedium,
                                                  fontSize: FontSize.s10.sp,
                                                  textAlign: TextAlign.start,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      Image.asset(nurseModel[index].image as String),
                                      SizedBox(height: 10.h,),
                                      FittedBox(
                                        child: CustomText(
                                          txt: nurseModel[index].name,
                                          color: ColorsManager.blackColor,
                                          fontfamily: FontManager.fontFamilyButton,
                                          fontWeight: FontWightManager.fontWeightMedium,
                                          fontSize: FontSize.s12.sp,
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                      SizedBox(height: 3.h,),
                                      FittedBox(
                                        child: RichText(
                                          text: TextSpan(
                                            text: '\$',
                                            style: TextStyle(
                                              fontWeight:FontWightManager.fontWeightLight,
                                              color: ColorsManager.dollarColor,
                                              fontFamily: FontManager.fontFamilyApp,
                                              fontSize: FontSize.s9.sp,
                                            ),
                                            children:[
                                              TextSpan(
                                                text: '500.00',
                                                style: TextStyle(
                                                  fontWeight:FontWightManager.fontWeightLight,
                                                  color: ColorsManager.staticTextColor,
                                                  fontFamily: FontManager.fontFamilyApp,
                                                  fontSize: FontSize.s9.sp,
                                                ),),
                                              TextSpan(
                                                text: '/ Month',
                                                style: TextStyle(
                                                  fontWeight:FontWightManager.fontWeightLight,
                                                  color: ColorsManager.staticTextColor,
                                                  fontFamily: FontManager.fontFamilyApp,
                                                  fontSize: FontSize.s9.sp,
                                                ),),
                                            ],

                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
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


}
class CircleIndicator extends StatelessWidget {
   int currentIndex;
   List num ;
  CircleIndicator(this.currentIndex,this.num);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: num.map((i) {
        return Container(
          margin: EdgeInsets.all(5),
          width: currentIndex == i ? 19.w : 6.w,
          height: 6.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: currentIndex == i ? Colors.blue : Colors.grey,
          ),
        );
      }).toList(),
    );
  }




}
