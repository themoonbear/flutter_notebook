import 'package:flutter/material.dart';
import 'model/no_todo_item.dart';
import 'util/database_client.dart';
import 'util/date_formatter.dart';

class NoTodoScreen extends StatefulWidget {
  _NoTodoScreenState createState() => _NoTodoScreenState();
}

class _NoTodoScreenState extends State<NoTodoScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  var db = DatabaseHelper();
  final List<NoTodoItem> _itemList = <NoTodoItem>[];

  @override
  void initState() {
    super.initState();
    _readNoTodoList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.black87,
       body: Column(
         children: <Widget>[
           Flexible(
             child: ListView.builder(
               padding: EdgeInsets.all(2.0),
               reverse: false,
               itemCount: _itemList.length,
               itemBuilder: (_, int index){
                 return Card(
                   color: Colors.white10,
                   child: ListTile(
                     title: _itemList[index],
                     onLongPress: () => _updateItem(_itemList[index], index),
                     trailing: Listener(
                       key: Key(_itemList[index].itemName),
                       child: Icon(Icons.remove_circle, color: Colors.redAccent),
                       onPointerDown: (pointerEvent) => _deleteNoTodo(_itemList[index].id, index),
                     ),
                   ),
                 );
               },
             ),
           ),
           Divider(height: 1.0)
         ],
       ),
       floatingActionButton: FloatingActionButton(
         tooltip: 'Add Item',
         backgroundColor: Colors.redAccent,
         child: ListTile(
           title: Icon(Icons.add),
         ),
         onPressed: _showFormDialog,
       ),
    );
  }
  void _showFormDialog(){
    var alert = AlertDialog(
      content: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textEditingController,
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Item",
                hintText: "eg. Don't buy stuff",
                icon: Icon(Icons.note_add)
              ),
            ),
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: (){
            _handleSubmit(_textEditingController.text);
            _textEditingController.clear();
            Navigator.of(context).pop();
          },
          child: Text("Save"),
        ),
        FlatButton(
          onPressed: () {
            _textEditingController.clear();
            Navigator.of(context).pop();
          },
          child: Text("Cancel"),
        )
      ],
    );
    showDialog(context: context, builder: (_) {
      return alert;
    });
  }

  _readNoTodoList() async {
    List items = await db.getItems();
    items.forEach((item){
      setState(() {
        _itemList.add(NoTodoItem.map(item));
      });
    });
  }

  void _handleSubmit(String text) async{
    _textEditingController.clear();
    if(text == null)return;
    NoTodoItem noTodoItem = NoTodoItem(text, dateFormatted());
    int savedItemId = await db.saveItem(noTodoItem);
    NoTodoItem addedItem = await db.getItem(savedItemId);
    setState(() {
      _itemList.insert(0, addedItem);      
    });
  }  

  _deleteNoTodo(int id,int index) async{
    await db.deleteItem(id);
    setState(() {
      _itemList.removeAt(index);     
    });
  }

  _updateItem(NoTodoItem item, int index){
    var alert = AlertDialog(
      title: Text("Update Item"),
      content: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textEditingController,
              autofocus: true,
              decoration: InputDecoration(
                labelText: "Item",
                hintText: item.itemName,
                icon: Icon(Icons.update)
              ),
            ),
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () async {
            NoTodoItem newItemUpdated = NoTodoItem.fromMap({
              "itemName": _textEditingController.text,
              "dateCreated": dateFormatted(),
              "id": item.id
            });
            _handleSubmittedUpdate(index, newItemUpdated);
            _textEditingController.clear();
            Navigator.of(context).pop();
          },
          child: Text("Update")
        ),
        FlatButton(
          onPressed: () {
            _textEditingController.clear();
            Navigator.of(context).pop();
          },
          child: Text("Cancel")
        )
      ],
    );
    showDialog(context: context, builder: (_){return alert;});
  }

  void _handleSubmittedUpdate(int index, NoTodoItem item) async{
    _textEditingController.clear();    
    await db.updateItem(item);
    setState(() {
      _itemList[index] = item;
    });   
  }
}