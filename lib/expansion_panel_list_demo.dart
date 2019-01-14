import 'package:flutter/material.dart';

class ExpansionPanelListDemo extends StatefulWidget {
  _ExpansionPanelListDemoState createState() => _ExpansionPanelListDemoState();
}

class _ExpansionPanelListDemoState extends State<ExpansionPanelListDemo> {
  List<int> mList;
  List<ExpansionStateBean> expansionStateList;
  _ExpansionPanelListDemoState(){
    mList = List();
    expansionStateList = List();
    for(int i = 0 ; i < 10; i++){
      mList.add(i);
      expansionStateList.add(ExpansionStateBean(i, false));
    }
  }

  _setCurrentIndex(int index, isExpanded) {
    setState(() {
      expansionStateList.forEach((item){
        if(item.index == index){
          item.isOpen = !isExpanded;
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('expansion panel list')),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, bol){
            _setCurrentIndex(index, bol);
          },
          children: mList.map((index){
            return ExpansionPanel(
              headerBuilder: (context, isExpanded){
                return ListTile(
                  title: Text('This is No.$index'),
                );
              },
              body: ListTile(
                title: Text('This is body no.$index'),
              ),
              isExpanded: expansionStateList[index].isOpen
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ExpansionStateBean {
  var isOpen;
  var index;
  ExpansionStateBean(this.index, this.isOpen);
}