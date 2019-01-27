import 'package:flutter/material.dart';

class FormTestRoute extends StatefulWidget {
  _FormTestRouteState createState() => _FormTestRouteState();
}

class _FormTestRouteState extends State<FormTestRoute> {
  TextEditingController _unameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Form Test")),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Form(
          key: _formKey,
          autovalidate: false,
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: _unameController,
                decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    icon: Icon(Icons.person)),
                validator: (v) {
                  return v.trim().length > 0 ? null : "用户名不能为空";
                },
              ),
              TextFormField(
                controller: _pwdController,
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登陆密码",
                    icon: Icon(Icons.lock)),
                obscureText: true,
                validator: (v) {
                  return v.trim().length > 5 ? null : "密码不能少于6位";
                },
              ),
              Builder(builder: (context) {
                return RaisedButton(
                  child: Text("登录"),
                  onPressed: () {
                    if (Form.of(context).validate()) {
                      print("提交成功");
                    }
                  },
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
