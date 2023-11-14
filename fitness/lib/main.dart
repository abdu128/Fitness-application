import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fitness/homeScreen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fir',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen(),
        debugShowCheckedModeBanner: false);
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true; // Set initially to true

  @override
  void initState() {
    super.initState();
    // Simulate some initialization process, like loading data or assets
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading =
            false; // Update loading state when initialization is complete
      });

      // After the splash screen duration, navigate to the main screen
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand, // Ensure the stack covers the entire screen
        children: [
          Image.asset(
            'assets/images/sho4.gif', // Use your splash image
          ),
          if (_isLoading)
            Align(
              alignment: Alignment
                  .bottomCenter, // Position the indicator at the bottom center
              child: CircularProgressIndicator(color: Colors.orange),
            ),
        ],
      ),
    );
  }
}
