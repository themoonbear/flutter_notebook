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
        ],
      )
    );
  }
}
