import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-7299135035558926/9624623596';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw new UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-7299135035558926/8119970230';
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/4411468910";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-7299135035558926/2008829788';
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/1712485313";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}








// import 'dart:io';

// class AdHelper {
//   static String get bannerAdUnitId {
//     if (Platform.isAndroid) {
//       return '<YOUR_ANDROID_BANNER_AD_UNIT_ID>';
//     } else if (Platform.isIOS) {
//       return '<YOUR_IOS_BANNER_AD_UNIT_ID>';
//     } else {
//       throw new UnsupportedError('Unsupported platform');
//     }
//   }

//   static String get interstitialAdUnitId {
//     if (Platform.isAndroid) {
//       return '<YOUR_ANDROID_INTERSTITIAL_AD_UNIT_ID>';
//     } else if (Platform.isIOS) {
//       return '<YOUR_IOS_INTERSTITIAL_AD_UNIT_ID>';
//     } else {
//       throw new UnsupportedError('Unsupported platform');
//     }
//   }

//   static String get rewardedAdUnitId {
//     if (Platform.isAndroid) {
//       return '<YOUR_ANDROID_INTERSTITIAL_AD_UNIT_ID>';
//     } else if (Platform.isIOS) {
//       return '<YOUR_IOS_INTERSTITIAL_AD_UNIT_ID>';
//     } else {
//       throw new UnsupportedError('Unsupported platform');
//     }
//   }
// }
