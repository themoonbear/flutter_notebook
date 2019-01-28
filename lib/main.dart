import 'package:flutter/material.dart';
import 'bottom_navigation_widget.dart';
import 'bottom_appBar_demo.dart';
import 'pages.dart';
import 'frosted_glass_demo.dart';
import 'keep_alive_demo.dart';
import 'search_bar_demo.dart';
import 'wrap_demo.dart';
import 'expansion_tile_demo.dart';
import 'expansion_panel_list_demo.dart';
import 'custom_clipper_demo.dart';
import 'splish_screen_demo.dart';
import 'right_back_deom.dart';
import 'tool_tips_demo.dart';
import 'draggable_demo.dart';

import 'notodo/no_todo_app.dart';
import 'klimatic/weather.dart';
import 'actions/focus_test_route.dart';
import 'actions/form_test_route.dart';
import 'actions/flex_layout_test.dart';
import 'actions/flow_layout_test.dart';
import 'actions/infinite_listview.dart';
import 'actions/infinite_gridview.dart';
import 'actions/custom_scrollview_test.dart';

void main() {
  runApp(MaterialApp(
    title:'JSpang Demo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.blue
    ),
    home: MainScreen()
  ));
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('JSpang Demo')),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Custom ScrollView Test'),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CustomScrollViewTest()));
            },
          ),           
          ListTile(
            title: Text('Infinite GrideView Test'),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>InfiniteGridView()));
            },
          ),          
          ListTile(
            title: Text('Infinite ListView Test'),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>InfiniteListView()));
            },
          ),           
          ListTile(
            title: Text('FlowLayout Test'),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FlowLayoutTest()));
            },
          ),          
          ListTile(
            title: Text('FlexLayout Test'),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FlexLayoutTestRoute()));
            },
          ),          
          ListTile(
            title: Text('Form Test'),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FormTestRoute()));
            },
          ),
          ListTile(
            title: Text('Focus Test'),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FocusTestRoute()));
            },
          ),                      
          ListTile(
            title: Text('BottomNavigationWidget'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => BottomNavigationWidget()
              ));
            },
          ),
          ListTile(
            title: Text('BottomAppBarDemo'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => BottomAppBarDemo()
              ));
            },
          ),
          ListTile(
            title: Text('pages demo'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => FirstPage()
              ));
            },
          ),
          ListTile(
            title: Text('frosted glass'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => FrostedGlassDemo()
              ));
            },
          ),
          ListTile(
            title: Text('keep alive'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => KeepAliveDemo()
              ));
            },
          ),
          ListTile(
            title: Text('search bar'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => SearchBarDemo()
              ));
            },
          ),
          ListTile(
            title: Text('wrap demo'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => WrapDemo()
              ));
            },
          ),
          ListTile(
            title: Text('expansion tile demo'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ExpansionTileDemo()
              ));
            },
          ),
          ListTile(
            title: Text('expansion panel list demo'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ExpansionPanelListDemo()
              ));
            },
          ),
          ListTile(
            title: Text('custom clipper demo'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => CustomClipperDemo()
              ));
            },
          ),                                                                                              
          ListTile(
            title: Text('splash screen  demo'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => SplashScreenDemo()
              ));
            },
          ), 
          ListTile(
            title: Text('right back demo'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => RightBackDemo()
              ));
            },
          ),
          ListTile(
            title: Text('tool tips demo'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ToolTipsDemo()
              ));
            },
          ), 
          ListTile(
            title: Text('draggable demo'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => DraggableDemo()
              ));
            },
          ),
          ListTile(
            title: Text('No-Todo app'),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NoTodoApp()));
            },
          ),
          ListTile(
            title: Text('Weather app'),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Klimatic()));
            },
          )                                                                                                                                                
        ],
      )
    );
  }
}
