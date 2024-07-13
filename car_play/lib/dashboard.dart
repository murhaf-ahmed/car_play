import 'package:car_play/cars.dart';
import 'package:car_play/use.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Container(
              child: Image.asset(
                "assets/start/car.png",
                width: screenWidth * 0.6,
                color: Color(0xFF03A400),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 50),
              width: screenWidth * 0.8,
              child: Row(
                children: [
                  Flexible(
                    child: Text(
                      "Connect your phone with the car screen dashboard easily by using carplay app.",
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 5,
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Use()),
                );
              },
              child: Container(
                width: screenWidth * 0.5,
                height: screenHeight * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFF03A400),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/dashboard/guide.png",
                      width: screenWidth * 0.08,
                    ),
                    Text(
                      "HOW TO USE",
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => Cars()),
                );
              },
              child: Container(
                width: screenWidth * 0.5,
                height: screenHeight * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Color(0xFF03A400),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/dashboard/connect.png",
                      width: screenWidth * 0.08,
                    ),
                    Text(
                      "CONNECT",
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.08,
            ),
            Center(
              child: Container(
                width: screenWidth * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: screenWidth * 0.2,
                          width: screenWidth * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xFF03A400),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth * 0.04),
                              child: Image.asset(
                                "assets/dashboard/privacy.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "PRIVACY",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: screenWidth * 0.03,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: screenWidth * 0.2,
                          width: screenWidth * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xFF03A400),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth * 0.04),
                              child: Image.asset(
                                "assets/dashboard/share.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "SHARE",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: screenWidth * 0.03,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          height: screenWidth * 0.2,
                          width: screenWidth * 0.2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color(0xFF03A400),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Padding(
                              padding: EdgeInsets.all(screenWidth * 0.04),
                              child: Image.asset(
                                "assets/dashboard/like.png",
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          "RATE US",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: screenWidth * 0.03,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
