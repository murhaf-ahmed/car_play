import 'package:car_play/dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class Use extends StatefulWidget {
  const Use({Key? key}) : super(key: key);

  @override
  _UseState createState() => _UseState();
}

class _UseState extends State<Use> {
  late BannerAd _bannerAd;
  bool _isBannerAdLoaded = false;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    MobileAds.instance.initialize();

    _bannerAd = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdLoaded = true;
          });
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
          print('BannerAd failed to load: $error');
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(padding: EdgeInsets.only(top:screenHeight * 0.08,left: screenWidth * 0.1,right: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: screenWidth * 0.15,
                  width: screenWidth * 0.15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color(0xFF03A400),
                  ),
                  child: Center(
                    child: IconButton(onPressed:  () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => Dashboard()),
                            (route) => false,
                      );
                    }, icon: Icon(Icons.arrow_back_ios_new),color: Colors.white,),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: screenWidth * 0.3),
                  child: Text("How to use",style: TextStyle(fontWeight: FontWeight.w600,fontSize: screenWidth * 0.04)),
                ),
              ],
            ),
            Container(child: Text("How To Use",style: TextStyle(fontWeight: FontWeight.w800,fontSize: screenWidth * 0.05)),margin: EdgeInsets.only(top: screenHeight * 0.06),),
            Container(child: Text("1) Choose your car.",style: TextStyle(fontWeight: FontWeight.w800,fontSize: screenWidth * 0.05)),margin: EdgeInsets.only(top: screenHeight * 0.03),),
            Container(child: Text("2) Enable wifi network.",style: TextStyle(fontWeight: FontWeight.w800,fontSize: screenWidth * 0.05)),margin: EdgeInsets.only(top: screenHeight * 0.02),),
            Container(child: Text("3) Connect your car, if your car screen display doesnt support content Us.",style: TextStyle(fontWeight: FontWeight.w800,fontSize: screenWidth * 0.05)),margin: EdgeInsets.only(top: screenHeight * 0.02),),
            SizedBox(height: 30,),
            SizedBox(height: screenHeight * 0.09),
            if (_isBannerAdLoaded)
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: _bannerAd.size.width.toDouble(),
                  height: _bannerAd.size.height.toDouble(),
                  child: AdWidget(ad: _bannerAd),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
