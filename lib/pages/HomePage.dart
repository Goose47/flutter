import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/home_page_background.jpg')
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/game'
                  );
                },
                style: const ButtonStyle(
                ),
                child: Stack(
                  children: <Widget>[
                    Text(
                      'Play',
                      style: TextStyle(
                        fontSize: 60,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 6
                          ..color = Colors.black87,
                      ),
                    ),
                    // Solid text as fill.
                    Text(
                      'Play',
                      style: TextStyle(
                        fontSize: 60,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}