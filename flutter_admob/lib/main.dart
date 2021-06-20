import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';
import 'game_route.dart';
import 'home_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeRoute(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new HomeRoute(),
        '/game': (BuildContext context) => new GameRoute()
      },
      theme: ThemeData(
        primaryColor: AppTheme.primary,
        primaryColorDark: AppTheme.primaryDark,
        accentColor: AppTheme.accent,
        textTheme: GoogleFonts.acmeTextTheme().copyWith(
            button: GoogleFonts.ubuntuMono(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        )),
        buttonTheme: ButtonThemeData(
          buttonColor: AppTheme.accent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          textTheme: ButtonTextTheme.primary,
        ),
      ),
    ),
  );
}



























// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await MobileAds.instance.initialize();
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ShowBannerAdd(),
//       //home: Scaffold(),
//     );
//   }
// }










// import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

// import 'add_helper.dart';

// void main() {
//   runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
// }

// // You can also test with your own ad unit IDs by registering your device as a
// // test device. Check the logs for your device's ID value.
// const String testDevice = 'YOUR_DEVICE_ID';

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   BannerAd? _bannerAd;

//   @override
//   void initState() {
//     super.initState();
//     _bannerAd = BannerAd(
//       //adUnitId: BannerAd.testAdUnitId,
//       adUnitId: AdHelper.bannerAdUnitId,
//       request: AdRequest(),
//       size: AdSize.banner,
//       listener: BannerAdListener(
//         onAdLoaded: (Ad ad) {
//           print('$BannerAd loaded.');
//         },
//         onAdFailedToLoad: (Ad ad, LoadAdError error) {
//           print('$BannerAd failedToLoad: $error');
//         },
//         onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
//         onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
//         //  onApplicationExit: (Ad ad) => print('$BannerAd onApplicationExit.'),
//       ),
//     );

//     _bannerAd?.load();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _bannerAd?.dispose();
//     _bannerAd = null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final AdWidget adWidget = AdWidget(ad: _bannerAd!);
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Google Mobile Ads'),
//         actions: <Widget>[],
//       ),
//       body: Column(
//         children: [
//           Align(
//             alignment: FractionalOffset.topCenter,
//             child: Padding(
//                 padding: EdgeInsets.only(top: 10.0),
//                 child: Container(
//                   alignment: Alignment.center,
//                   child: adWidget,
//                   width: _bannerAd?.size.width.toDouble(),
//                   height: _bannerAd?.size.height.toDouble(),
//                 )),
//           )
//         ],
//       ),
//     );
//   }
// }
