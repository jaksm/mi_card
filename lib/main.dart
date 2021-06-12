import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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

  final String name = 'Jakša Mališić';
  final String title = 'Mobile App Developer';
  final String phone = '+381604447002';
  final String email = 'jaksa.malisic@gmail.com';

  void _launchURL({required String scheme, required String path}) async {
    String url = Uri(
      scheme: scheme,
      path: path,
    ).toString();

    await canLaunch(url) ? await launch(url) : throw 'Cannot launch $url';
  }

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
              this.name,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Oi',
                fontSize: 32,
              ),
            ),
            Text(
              this.title,
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
              constraints: BoxConstraints(maxWidth: 500),
              child: Column(
                children: [
                  Card(
                    child: ListTile(
                      onTap: () => _launchURL(scheme: 'tel', path: this.phone),
                      leading: Icon(
                        Icons.phone_outlined,
                        color: Colors.white,
                      ),
                      title: Text(
                        this.phone,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      onTap: () =>
                          _launchURL(scheme: 'mailto', path: this.email),
                      leading: Icon(
                        Icons.mail_outline,
                        color: Colors.white,
                      ),
                      title: Text(
                        this.email,
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
