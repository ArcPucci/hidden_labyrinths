import 'dart:async';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hidden_labyrinths/application.dart';
import 'package:hidden_labyrinths/providers/providers.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isSE = false;

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);

      final deviceInfoPlugin = DeviceInfoPlugin();
      final iosInfo = await deviceInfoPlugin.iosInfo;

      isSE = iosInfo.modelName.contains('SE');

      final preferences = await SharedPreferences.getInstance();
      final prefProvider = PreferencesProvider(preferences);

      runApp(
        ScreenUtilInit(
          designSize: const Size(390, 844),
          builder: (context, child) {
            return Application(preferencesProvider: prefProvider);
          },
        ),
      );
    },
    (error, stack) {
      print(error);
      print(stack);
    },
  );
}
