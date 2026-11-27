import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nivo/core/di/service_locator.dart';
import 'package:nivo/core/helpers/bloc_observer.dart';
import 'package:nivo/core/routing/app_router.dart';
import 'package:nivo/firebase_options.dart';

import 'core/helpers/shared_pref_helper.dart';
import 'my_app.dart';

Future<void> _initFirebase() async {
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}

void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await _initFirebase();
  await initServiceLocator();
  await ScreenUtil.ensureScreenSize();
  await SharedPrefHelper.init();
  AppRouter.initRouter();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}
