import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double? heading = 0;

  @override
  void initState(){
    super.initState();
    FlutterCompass.events!.listen((event) {
      setState(() {
        heading = event.heading;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(centerTitle: true,backgroundColor: Colors.black,title: Text('Compass'.toUpperCase(),style:TextStyle(color: Colors.white),),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("${heading!.ceil()}",style: TextStyle(color: Colors.white,fontSize: 40),),
          SizedBox(height: 50,),
          Padding(padding: EdgeInsets.all(10),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset('assets/cadrant.png'),
                Transform.rotate(
                    angle: ((heading ?? 0 ) * (pi / 180) * -1),
                    child: Image.asset('assets/compass.png',scale: 1.1,)),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
