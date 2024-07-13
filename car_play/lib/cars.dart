import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'connectType.dart';
import 'dashboard.dart';

class Cars extends StatefulWidget {
  const Cars({Key? key}) : super(key: key);

  @override
  _CarsState createState() => _CarsState();
}

class _CarsState extends State<Cars> {
  List<Map<String, String>> carList = [
    {"name": "Audi", "image": "assets/cars/audi.png"},
    {"name": "BMW", "image": "assets/cars/bmw.png"},
    {"name": "Ferrari", "image": "assets/cars/ferrari.png"},
    {"name": "Camaro", "image": "assets/cars/camaro.png"},
    {"name": "Ford", "image": "assets/cars/ford.png"},
    {"name": "Hilux", "image": "assets/cars/hilux.png"},
    {"name": "Lamborghini", "image": "assets/cars/lamborghini.png"},
    {"name": "Lexus", "image": "assets/cars/lexus.png"},
    {"name": "Mercedes", "image": "assets/cars/mercedes.png"},
    {"name": "Nissan", "image": "assets/cars/nissan.png"},
    {"name": "Porsche", "image": "assets/cars/porsche.png"},
    {"name": "Vitara", "image": "assets/cars/vitara.png"},
  ];

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
                              MaterialPageRoute(builder: (context) => Dashboard()),
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
                        "Select Car",
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
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: screenHeight * 0.25,
                    crossAxisSpacing: screenWidth * 0.05,
                    mainAxisSpacing: screenHeight * 0.02,
                  ),
                  itemCount: carList.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => ConnectType()),
                        );
                      },
                      child: Card(
                        child: Column(
                          children: [
                            SizedBox(height: screenHeight * 0.02),
                            Container(
                              width: screenWidth * 0.3,
                              height: screenWidth * 0.3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(screenWidth * 0.1),
                                color: Colors.white,
                              ),
                              child: Image.asset(carList[index]["image"]!),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            Container(
                              alignment: Alignment.center,
                              width: screenWidth * 0.35,
                              decoration: BoxDecoration(
                                color: Color(0xFF03A400),
                                borderRadius: BorderRadius.circular(screenWidth * 0.5),
                              ),
                              child: Text(
                                carList[index]["name"]!,
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
            ],
          ),
        ),
      ),
    );
  }
}
