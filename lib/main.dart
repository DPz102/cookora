import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:flutter/foundation.dart';

import 'package:cookora/firebase_options_manager.dart';
import 'package:cookora/my_app.dart';

import 'package:cookora/core/di/service_locator.dart';

Future<void> main() async {
  // Đảm bảo các binding được khởi tạo trước khi chạy app
  WidgetsFlutterBinding.ensureInitialized();

  // Khởi tạo Firebase
  await Firebase.initializeApp(options: FirebaseOptionsManager.currentPlatform);

  await FirebaseAppCheck.instance.activate(
    providerAndroid: kDebugMode
        ? const AndroidDebugProvider(
            debugToken: '327A4AB3-EADA-4002-A595-90103ACFB146',
          )
        : const AndroidPlayIntegrityProvider(),
  );

  // Khởi tạo các dependencies
  await initializeDependencies();

  // Chạy ứng dụng
  runApp(const MyApp());
}
