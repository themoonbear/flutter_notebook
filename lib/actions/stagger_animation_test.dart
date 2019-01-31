import 'package:flutter/material.dart';

class _StaggerAnimation extends StatelessWidget {
  
  _StaggerAnimation({Key key, this.controller}):super(key: key){
    height = Tween<double>(begin: .0, end: 300.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.0, 0.6, curve: Curves.ease))
    );
    color = ColorTween(begin: Colors.green, end: Colors.red).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.0, 0.6, curve: Curves.ease))
    );
    padding = Tween<EdgeInsets>(
      begin: EdgeInsets.only(left: .0),
      end: EdgeInsets.only(left: 100.0)).animate(
        CurvedAnimation(parent: controller, curve: Interval(0.6, 1.0, curve: Curves.ease))
      );
  }
  final Animation<double> controller;

  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  Widget _buildAnimation(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: padding.value,
      child: Container(
        color: color.value,
        width: 50.0,
        height: height.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: _buildAnimation,
      animation: controller,
    );
  }
}

class StaggerDemo extends StatefulWidget {
  _StaggerDemoState createState() => _StaggerDemoState();
}

class _StaggerDemoState extends State<StaggerDemo> with TickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync:this
    );
  }

  Future<Null> _playAnimation() async {
    try{
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled{

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stagger")),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _playAnimation();
        },
        child: Center(
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color: Colors.black.withOpacity(0.5)
              )
            ),
            child: _StaggerAnimation(
              controller: _controller,
            ),
          ),
        ),
      ),
    );
  }
}