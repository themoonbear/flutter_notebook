import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class TurnBox extends StatefulWidget {
  const TurnBox({
    Key key,
    this.turns = .0,
    this.speed = 200,
    this.child
  }):super(key: key);

  final double turns;
  final int speed;
  final Widget child;

  @override
  _TurnBoxState createState() => new _TurnBoxState();
}

class _TurnBoxState extends State<TurnBox> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      lowerBound: -double.infinity,
      upperBound: double.infinity
    );
    _controller.value = widget.turns;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: widget.child,
    );
  }

  @override
  void didUpdateWidget(TurnBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.turns != widget.turns) {
      _controller.animateTo(
        widget.turns,
        duration: Duration(microseconds: widget.speed ?? 200),
        curve: Curves.easeOut
      );
    }
  }
}

class TurnBoxRoute extends StatefulWidget {
  _TurnBoxRouteState createState() => _TurnBoxRouteState();
}

class _TurnBoxRouteState extends State<TurnBoxRoute> {
  double _turns = .0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Turn Button")),
      body: Center(
       child: Column(
         children: <Widget>[
           TurnBox(
             turns: _turns,
             speed: 500,
             child: Icon(Icons.refresh, size: 50),
           ),
           TurnBox(
             turns: _turns,
             speed: 1000,
             child: Icon(Icons.refresh, size: 150.0),
           ),
           RaisedButton(
             child: Text("顺时针旋转1/5圈"),
             onPressed: () {
               setState(() {
                 _turns += .2;
               });
             },
           ),
           RaisedButton(
             child: Text("逆时针旋转1/5圈"),
             onPressed: () {
               setState(() {
                 _turns -= .2;
               });
             },
           )           
         ],
       ),
    ));
  }
}