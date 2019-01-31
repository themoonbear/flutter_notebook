import 'package:flutter/material.dart';

class HeroAnimationTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero Animation"),),
      body: Container(
        alignment: Alignment.topCenter,
        child: InkWell(
          child: Hero(
            tag: 'avatar',
            child: ClipOval(
              child: Image.asset("assets/images/umbrella.jpg", width: 50.0),
            ),
          ),
          onTap: () {
            Navigator.push(context, PageRouteBuilder(
              pageBuilder: (BuildContext context, 
              Animation animation, 
              Animation secondaryAnimation) {
                return FadeTransition(
                  opacity: animation,
                  child: Scaffold(
                    body: _HeroAnimationRouteB(),
                  ),
                );
              }
            ));
          },
        ),
      ),
    );
  }
}

class _HeroAnimationRouteB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "avatar",
        child: Image.asset("assets/images/umbrella.jpg"),
      ),
    );
  }
}