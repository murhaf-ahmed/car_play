import 'package:car_play/cars.dart';
import 'package:car_play/wifiConnection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'bluetoothConnection.dart';
import 'castingConnection.dart';

class ConnectType extends StatefulWidget {
  const ConnectType({Key? key}) : super(key: key);
  @override
  _ConnectTypeState createState() => _ConnectTypeState();
}

class _ConnectTypeState extends State<ConnectType> {
  List<Map<String, String>> connectList = [
    {"name": "Bluetooth", "image": "assets/connectType/bluetooth.png"},
    {"name": "Casting", "image": "assets/connectType/casting.png"},
    {"name": "Wifi", "image": "assets/connectType/wifi.png"},
  ];

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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  top: screenWidth * 0.15,
                  right: screenWidth * 0.05,
                  left: screenWidth * 0.05,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: screenWidth * 0.15,
                      width: screenWidth * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * 0.075),
                        color: Color(0xFF03A400),
                      ),
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => Cars()),
                                  (route) => false,
                            );
                          },
                          icon: Icon(Icons.arrow_back_ios_new),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: screenWidth * 0.2),
                      child: Text(
                        "Select Connect",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: screenWidth * 0.05,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Container(
                height: screenHeight * 0.2,
                width: screenWidth,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: connectList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        if(connectList[index]["name"] == "Bluetooth"){
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => BluetoothConnection()),
                          );
                        }
                        else if(connectList[index]["name"] == "Casting"){
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => CastingConnection()),
                          );
                        }
                        else if (connectList[index]["name"] == "Wifi"){
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => WifiConnection()),
                          );
                        }
                      },
                      child: Card(
                        child: Column(
                          children: [
                            SizedBox(height: screenHeight * 0.02),
                            Container(
                              width: screenWidth * 0.2,
                              height: screenWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(screenWidth * 0.05),
                                color: Colors.white,
                              ),
                              child: Image.asset(connectList[index]["image"]!),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Container(
                              alignment: Alignment.center,
                              width: screenWidth * 0.3,
                              decoration: BoxDecoration(
                                color: Color(0xFF03A400),
                                borderRadius: BorderRadius.circular(screenWidth * 0.5),
                              ),
                              child: Text(
                                connectList[index]["name"]!,
                                style: TextStyle(fontSize: screenWidth * 0.04, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
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
      ),
    );
  }
}
