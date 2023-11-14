import 'dart:async';

import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final String name;

  DetailsScreen(
    this.name,
  );

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  PageController _pageController = PageController();
  int _currentPageIndex = 0;
  int _secondsRemaining = 30; // Initial seconds for the timer
  late Timer _timer; // Timer object for the countdown
  Map<String, List<String>> recommendedMap = {
    "Back": [
      "assets/images/back.gif",
      "assets/images/back2.gif",
      "assets/images/back3.gif",
      "assets/images/back4.gif",
      "assets/images/backk1.gif",
    ],
    "Shoulder": [
      "assets/images/sho1.gif",
      "assets/images/sho2.gif",
      "assets/images/sho3.gif",
      "assets/images/sho4.gif",
      "assets/images/sho5.gif"
    ],
    "Biceps": [
      "assets/images/bice1.gif",
      "assets/images/bice2.gif",
      "assets/images/bice3.gif"
    ],
    "Triceps": [
      "assets/images/tric1.gif",
      "assets/images/tric2.gif",
      "assets/images/tric3.gif",
      "assets/images/tric4.gif",
      "assets/images/tric5.gif",
      "assets/images/tric6.gif"
    ],
    "Leg": [
      "assets/images/leg1.gif",
      "assets/images/leg2.gif",
      "assets/images/leg3.gif",
      "assets/images/leg4.gif"
    ],
    "Cheast": [
      "assets/images/che1.gif",
      "assets/images/che2.gif",
      "assets/images/che3.gif",
      "assets/images/che4.gif",
      "assets/images/che5.gif"
    ],
  };

  List freshList = [
    {"image": "assets/images/back.webp", "name": "Back"},
    {"image": "assets/images/bi.jpg", "name": "Biceps"},
    {"image": "assets/images/chest.jpeg", "name": "Cheast"},
    {"image": "assets/images/shol.webp", "name": "Shoulder"},
    {"image": "assets/images/tr.webp", "name": "Triceps"},
    {"image": "assets/images/leg.jpeg", "name": "Leg"},
  ];
  List descList = [
    {"name": "Back", "dis": " Back is", "time": "4 min", "price": "For Men's"},
    {"name": "Shoulder", "time": "3 min", "price": "For Men's"},
    {"name": "Cheast", "time": "5 min", "price": "For Men's"},
    {"name": "Leg", "time": "4 min", "price": "For Men's"},
    {"name": "Triceps", "time": "3 min", "price": " For Men's"},
    {"name": "Biceps", "time": "4 min", "price": "For Men's"},

    // ... other items in the list
  ];
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the screen is disposed
    super.dispose();
  }

  void moveToNextPage() {
    if (_currentPageIndex < recommendedMap[widget.name]!.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer.cancel();
          moveToNextPage();
          // You might want to implement what happens after the timer reaches 0
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> imagePaths = recommendedMap[widget.name] ?? [];

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          height: 58,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 32.0, vertical: 5),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 95, 90, 84),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28.0),
              topRight: Radius.circular(28.0),
            ),
          ),
          child: Text(
            "Back",
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: PageView.builder(
          controller: _pageController,
          itemCount: imagePaths.length,
          onPageChanged: (index) {
            setState(() {
              _currentPageIndex = index;
              _secondsRemaining = 30;
              _timer?.cancel(); // Reset the timer when the page changes
              startTimer(); // Start the timer again
            });
          },
          itemBuilder: (context, index) {
            final imagePath = imagePaths[index];
            final descriptionItem = descList.firstWhere(
              (item) => item["name"] == widget.name,
              orElse: () => null,
            );
            Row(
              children: [
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    color: Colors.grey,
                  ),
                )
              ],
            );

            return Container(
              margin: EdgeInsets.only(
                top: 50.0,
                left: 28.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 95, 90, 84),
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.only(right: 15),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.accessibility_rounded,
                            color: Colors.white,
                            size: 20,
                          ),
                        )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 34, 32, 32),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                        text: "\$",
                        style: TextStyle(fontSize: 16, color: Colors.orange),
                      ),
                      TextSpan(
                          text: _getPrice(widget.name),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange)),
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Row(children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 4.6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Type",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Gym, Home",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 36,
                              ),
                              Text(
                                "Time",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                _getTime(widget.name),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 26,
                              ),
                              Text(
                                "Time Left",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "$_secondsRemaining seconds",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Image.asset(
                          imagePath,
                          height: 250.0,
                          width: 280.0,
                          fit: BoxFit.fill,
                        ),
                      ])),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: CircularProgressIndicator(
                          value: _secondsRemaining / 30,
                          // Calculate the progress
                          strokeWidth: 20,

                          backgroundColor: Colors.orange,
                          color: Color.fromARGB(255, 94, 92, 92),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        onPressed: () {
                          if (_currentPageIndex > 0) {
                            _pageController.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                      ),
                      SizedBox(width: 20),
                      IconButton(
                          icon: Icon(Icons.arrow_forward),
                          onPressed: () {
                            if (_currentPageIndex < recommendedMap.length - 1) {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                          }),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }

  String _getDescription(String imageName) {
    var description = "";
    for (var item in descList) {
      if (item["name"] == imageName) {
        description = item["dis"];
        break;
      }
    }
    return description;
  }

  String _getTime(String imageName) {
    var time = "";

    for (var item in descList) {
      if (item["name"] == imageName) {
        time = item["time"];

        break;
      }
    }
    return time;
  }

  String _getPrice(String imageName) {
    var price = "";

    for (var item in descList) {
      if (item["name"] == imageName) {
        price = item["price"];

        break;
      }
    }
    return price;
  }
}
