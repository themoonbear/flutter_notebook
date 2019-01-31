import 'package:flutter/material.dart';

class InheriteWidgetTest extends StatefulWidget {
  _InheriteWidgetTestState createState() => _InheriteWidgetTestState();
}

class _InheriteWidgetTestState extends State<InheriteWidgetTest> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inherited Test")),
      body: Center(
        child: SharedDataWidget(
          data: count,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: _TestWidget(),
              ),
              RaisedButton(
                child: Text("Increment"),
                onPressed: () => setState(() => ++count),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SharedDataWidget extends InheritedWidget {
  
  SharedDataWidget({
    Key key, 
    @required this.data,
    this.child}) : super(key: key, child: child);

  final Widget child;
  final int data;  

  static SharedDataWidget of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(SharedDataWidget)as SharedDataWidget);
  }

  @override
  bool updateShouldNotify( SharedDataWidget oldWidget) {
    return oldWidget.data != data;
  }
}

class _TestWidget extends StatefulWidget {
  __TestWidgetState createState() => __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(SharedDataWidget.of(context).data.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Dependencies change");
  }
}