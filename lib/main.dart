import 'package:flutter/material.dart';
import 'package:animation_page_transition/secondScreen.dart';

main() => runApp(MaterialApp(home: FirstScreen()));

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: RaisedButton(
          child: Text('Go to the second screen'),
          onPressed: () {
            Navigator.of(context).push(_createRoute());
          },
        )
      )
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => SecondPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end);
      var curvedTween = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        child: child,
        position: tween.animate(curvedTween),
      );
    }
  );
}

