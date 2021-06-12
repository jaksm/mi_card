import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jaksm MiCard',
      theme: ThemeData(
          primarySwatch: Colors.teal,
          fontFamily: 'JetBrainsMono',
          cardColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          cardTheme: CardTheme(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: Colors.white,
                  width: 2,
                )),
          )),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.maxFinite,
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background.jpeg'),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Colors.amber.withOpacity(0.4),
                  Colors.red.withOpacity(0.9),
                ])),
          ),
          Content(),
        ],
      ),
    );
  }
}

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 64,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/jaksa.jpeg'),
                backgroundColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Jakša Mališić',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Oi',
                fontSize: 32,
              ),
            ),
            Text(
              'Mobile App Developer',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 64,
              child: Divider(
                height: 48,
                thickness: 2,
                color: Colors.white,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 32),
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.phone_outlined,
                        color: Colors.white,
                      ),
                      title: Text(
                        '+381604447002',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.mail_outline,
                        color: Colors.white,
                      ),
                      title: Text(
                        'jaksa.malisic@gmail.com',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
