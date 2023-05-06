import 'dart:async';

import 'package:flutter/cupertino.dart';
import"package:flutter/material.dart";
 
class homepage extends StatefulWidget {


  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  late Stopwatch stopwatch;

  late Timer t;

  void handlestartstop(){
    if(stopwatch.isRunning) {
        stopwatch.stop();
      }
    else{
      stopwatch.start();
    }
  }

  String formattedtextreturn(){
    var milli=stopwatch.elapsed.inMilliseconds;

    String milliseconds=(milli%1000).toString().padLeft(3,"0");
    String seconds=((milli~/1000)%60).toString().padLeft(2,"0");
    String minutes=((milli~/1000)~/60).toString().padLeft(2,"0");

    return "$minutes:$seconds:$milliseconds";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stopwatch=Stopwatch();

    t=Timer.periodic(Duration(milliseconds: 30), (timer) {
      setState((){});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
    body: SafeArea(
      child: Center(
        child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CupertinoButton(
              onPressed: (){
                handlestartstop();
              },
              padding: EdgeInsets.all(0),
              child: Container(

                height: 250,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                   color: Colors.blueGrey,
                    width: 4,
                  )
                ),
                child: Text(formattedtextreturn(),
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),),
              ),
            ),
           SizedBox(height: 10,),
           CupertinoButton(
             onPressed: (){
             stopwatch.reset();
             },
             padding: EdgeInsets.all(0),
             child: Text('RESET',
             style: TextStyle(
               color: Colors.black87,
               fontSize: 20,
               fontWeight: FontWeight.bold,
             ),),

           ),
          ],
        ),
      ),
    ),
    );
  }
}
