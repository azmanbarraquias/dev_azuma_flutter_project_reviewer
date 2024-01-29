
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../../a_real_apps/main_real_apps.dart';
import 'pages/init_dependency.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // getGetMaterialApp for GetX Navigation
      initialBinding: InitDep(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
