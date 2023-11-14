import 'package:flutter/material.dart';

class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 53, 52, 50),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: Icon(
                  Icons.arrow_back_ios_new_sharp,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              " Developed By: Abdulaziz Nejib \n Email: abdulaziznejo1281@gmail.com \n Phone: +251963705341",
              style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 255, 255, 255)),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.telegram,
                  color: Colors.blue,
                ),
                Text(
                  "Abdi_Nejib",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
