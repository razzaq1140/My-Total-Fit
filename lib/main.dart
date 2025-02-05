import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_total_fit/src/feature/ai_chat/provider/ai_chat_provider.dart';
import 'package:my_total_fit/src/feature/bottom_navigation_bar/bottom_navigation_provider.dart';
import 'package:my_total_fit/src/feature/home/pages/work_out_tracking/controller/workout_controller.dart';
import 'package:my_total_fit/src/feature/onboarding/provider/onboarding_provider.dart';
import 'package:my_total_fit/src/route/get_pages.dart';
import 'package:my_total_fit/src/theme/app_theme.dart';
import 'package:provider/provider.dart';

import 'src/nutrition/provider/add_data_nutrition.dart';

GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(DevicePreview(
    enabled: false,
    builder: (context) => MultiProvider(
      providers: [
        ChangeNotifierProvider<OnboardingProvider>(
          create: (_) => OnboardingProvider(),
        ),
        ChangeNotifierProvider<BottomNavigationProvider>(
          create: (context) => BottomNavigationProvider(),
        ),
        ChangeNotifierProvider<AiChatProvider>(
          create: (context) => AiChatProvider(),
        ),
        ChangeNotifierProvider<AddDataNutritionProvider>(
          create: (context) => AddDataNutritionProvider(),
        ),
        ChangeNotifierProvider<WorkoutController>(
          create: (context) => WorkoutController(),
        ),
      ],
      child: const MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      builder: DevicePreview.appBuilder,
      locale: DevicePreview.locale(context),
      scaffoldMessengerKey: scaffoldMessengerKey,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.instance.lightTheme,
      routerDelegate: MyAppRouter.router.routerDelegate,
      routeInformationParser: MyAppRouter.router.routeInformationParser,
      routeInformationProvider: MyAppRouter.router.routeInformationProvider,
    );
  }
}


// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
//
// void main() => runApp(MyApp());
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   String _scanBarcode = 'Unknown';
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   Future<void> startBarcodeScanStream() async {
//     FlutterBarcodeScanner.getBarcodeStreamReceiver(
//         '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
//         .listen((barcode) => print(barcode));
//   }
//
//   Future<void> scanQR() async {
//     String barcodeScanRes;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.QR);
//       print(barcodeScanRes);
//     } on PlatformException {
//       barcodeScanRes = 'Failed to get platform version.';
//     }
//
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//
//     setState(() {
//       _scanBarcode = barcodeScanRes;
//     });
//   }
//
//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> scanBarcodeNormal() async {
//     String barcodeScanRes;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.BARCODE);
//       print(barcodeScanRes);
//     } on PlatformException {
//       barcodeScanRes = 'Failed to get platform version.';
//     }
//
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;
//
//     setState(() {
//       _scanBarcode = barcodeScanRes;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             appBar: AppBar(title: const Text('Barcode scan')),
//             body: Builder(builder: (BuildContext context) {
//               return Container(
//                   alignment: Alignment.center,
//                   child: Flex(
//                       direction: Axis.vertical,
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         ElevatedButton(
//                             onPressed: () => scanBarcodeNormal(),
//                             child: Text('Start barcode scan')),
//                         ElevatedButton(
//                             onPressed: () => scanQR(),
//                             child: Text('Start QR scan')),
//                         ElevatedButton(
//                             onPressed: () => startBarcodeScanStream(),
//                             child: Text('Start barcode scan stream')),
//                         Text('Scan result : $_scanBarcode\n',
//                             style: TextStyle(fontSize: 20))
//                       ]));
//             })));
//   }
// }