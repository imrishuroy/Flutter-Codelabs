import 'package:flutter/material.dart';
import 'package:flutter_admob/add_helper.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ShowBannerAdd extends StatefulWidget {
  const ShowBannerAdd({Key? key}) : super(key: key);

  @override
  _ShowBannerAddState createState() => _ShowBannerAddState();
}

class _ShowBannerAddState extends State<ShowBannerAdd> {
  // late BannerAd myBanner;

  late BannerAd _bannerAd;

  @override
  void initState() {
    super.initState();
    _loadBannerAds();

    // _bannerAd = BannerAd(
    //   adUnitId: AdHelper.bannerAdUnitId,
    //   size: AdSize.banner,
    //   request: AdRequest(),
    //   listener: BannerAdListener(
    //     // Called when an ad is successfully received.
    //     onAdLoaded: (Ad ad) => print('Ad loaded.'),
    //     // Called when an ad request failed.
    //     onAdFailedToLoad: (Ad ad, LoadAdError error) {
    //       // Dispose the ad here to free resources.
    //       ad.dispose();
    //       print('Ad failed to load: $error');
    //     },
    //     // Called when an ad opens an overlay that covers the screen.
    //     onAdOpened: (Ad ad) => print('Ad opened.'),
    //     // Called when an ad removes an overlay that covers the screen.
    //     onAdClosed: (Ad ad) => print('Ad closed.'),
    //     // Called when an impression occurs on the ad.
    //     onAdImpression: (Ad ad) => print('Ad impression.'),
    //   ),
    // );

    // _bannerAd.load();
  }

  _loadBannerAds() {
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            // _isBannerAdReady = false;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          //_isBannerAdReady = true;
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Center(
          child: Container(
            alignment: Alignment.center,
            child: AdWidget(
              ad: _bannerAd,
            ),
            width: _bannerAd.size.width.toDouble(),
            height: _bannerAd.size.height.toDouble(),
          ),
        ),
      ],
    )

        // Column(
        //   children: [
        //     Align(
        //       alignment: FractionalOffset.topCenter,
        //       child: Padding(
        //         padding: EdgeInsets.only(top: 10.0),
        //         child: Container(
        //           alignment: Alignment.center,
        //           child: AdWidget(
        //             ad: myBanner,
        //           ),
        //           width: myBanner.size.width.toDouble(),
        //           height: myBanner.size.height.toDouble(),
        //         ),
        //       ),
        //     )
        //   ],
        // ),

        );
  }
}
