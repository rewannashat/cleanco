import 'package:bloc/bloc.dart';
import 'package:cleanco/presentation/login/login-viewmodel/logCubit.dart';
import 'package:cleanco/presentation/splash/splash_view.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'domain/shared/bloc_observer.dart';
import 'domain/shared/local/sharedPref.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  await ScreenUtil.ensureScreenSize();
  await SharedPrefrence.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        home: SplashView(),
      ),
    );
  }
}

