import 'package:fitness/DetailsScreen.dart';
import 'package:fitness/about.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, List<String>> recommendedMap = {
    "Back": [
      "assets/images/back.gif",
      "assets/images/back2.gif",
      "assets/images/back3.gif",
      "assets/images/back4.gif",
      "assets/images/backk1.gif",
    ],
    "Shoulder": [
      "assets/images/sho.gif",
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
    {"image": "assets/images/chest.jpeg", "name": "Cheast"},
    {"image": "assets/images/shol.webp", "name": "Shoulder"},
    {"image": "assets/images/tr.webp", "name": "Triceps"},
    {"image": "assets/images/leg.jpeg", "name": "Leg"},
    {"image": "assets/images/back.webp", "name": "Back"},
    {"image": "assets/images/bi.jpg", "name": "Biceps"},
  ];
  List<Map<String, dynamic>> filteredList = [];
  List<bool> _isFavoriteList = [];

  // Declare as empty list
  @override
  void initState() {
    super.initState();
    _isFavoriteList = List.generate(recommendedMap.length, (_) => false);
    // Initialize _isFavoriteList with false for each item
  }

  // New list to store filtered recipes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Home Exercise",
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 15, 15, 15),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 15, 15, 15),
              ),
              child: Text(
                "Menu",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text("Home",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
                // Handle home navigation here
              },
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 1,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Detail",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          freshList[index]["name"],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            ListTile(
              title: Text(
                "About",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => about(),
                  ),
                );
                // Handle about section navigation here
              },
            ),
            SizedBox(
              height: 300,
            ),
            Align(alignment: Alignment.bottomCenter, child: Text("Version 1.0"))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: 24.0,
            left: 16.0,
            right: 16.0,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 3,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Dream Big\nWork Hard, Make it Happen...",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 23.0,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Workouts",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print('see more exercises'),
                    child: Text(
                      "see All",
                      style: TextStyle(
                        fontSize: 17,
                        color: const Color.fromARGB(255, 77, 73, 73),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: recommendedMap.length * 136.0, // Adjust this value
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(), // Disable scrolling
                  itemCount: recommendedMap.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            freshList[index]["name"],
                          ),
                        ),
                      ),
                      child: Container(
                        height: 120,
                        margin: EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 242, 245, 245),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              freshList[index]["image"],
                              height: 180,
                              width: 120,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 25,
                                  vertical: 10,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      freshList[index]["name"],
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: List.generate(
                                        5,
                                        (index) => Icon(
                                          Icons.star,
                                          color: Colors.orangeAccent,
                                          size: 16,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              color: Colors.black87,
                                              size: 10,
                                            ),
                                            Text(
                                              "5 mins",
                                              style: TextStyle(fontSize: 13),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 75,
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.sports_gymnastics_sharp,
                                              size: 17,
                                            ),
                                            Text(
                                              "30 Seconds each",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                  height: 18,
                                  width: 36,
                                  child: IconButton(
                                      icon: _isFavoriteList[index]
                                          ? Icon(Icons.favorite,
                                              color: Colors
                                                  .black) // Filled red icon when favorited
                                          : Icon(Icons.favorite_border),
                                      onPressed: () {
                                        setState(() {
                                          _isFavoriteList[index] = !_isFavoriteList[
                                              index]; // Toggle the favorite state
                                        });
                                      })),
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
