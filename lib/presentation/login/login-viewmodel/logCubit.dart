import 'dart:developer';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:cleanco/presentation/resources/colors-manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logState.dart';



class LoginCubit extends Cubit <LoginStates> {
  LoginCubit() : super(InitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isIconClicked = false;

  void changeIcon() {
    isIconClicked = !isIconClicked;
    emit(ChangeIconButtonState());
  }

  bool isChecked = false;
  void changeCheckIcon() {
    isChecked = !isChecked;
    emit(ChangeIconButtonState());
  }


  IconData? suffixIcon = Icons.check;
  Color? suffixIconColor = ColorsManager.greyColor;
  bool check = true ;
  void changeList () {
    check ? suffixIconColor = ColorsManager.greenColor : suffixIconColor;
    emit(ChangeListState());
  }

}




