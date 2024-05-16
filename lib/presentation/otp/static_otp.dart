import 'package:cleanco/presentation/resources/font-manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/colors-manager.dart';

class OTPContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        OTPDigit(),
        OTPDigit(),
        OTPDigit(),
        OTPDigit(),
      ],
    );
  }
}

class OTPDigit extends StatefulWidget {
  @override
  _OTPDigitState createState() => _OTPDigitState();
}

class _OTPDigitState extends State<OTPDigit> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(360, 690));
    return Container(
      margin: EdgeInsetsDirectional.symmetric(vertical: 25,),
      width: 73.w,
      height: 66.h,
      decoration: BoxDecoration(
        color: ColorsManager.whiteColor,
        borderRadius: BorderRadius.circular(FontSize.s10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      alignment: Alignment.center,
      child: TextFormField(
        focusNode: _focusNode,
        onChanged: (String value) {
          if (value.length == 1) {
            _focusNode.nextFocus();
          }
        },
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          counter: Offstage(),
          border: InputBorder.none,
        ),
      ),
    );
  }
}