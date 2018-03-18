import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Support App ZKTeco DEMO',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.green,
      ),
      home: new MyHomePage(title: 'Chat Support App ZKTeco - DEMO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _controllerFirstName = new TextEditingController();
  final TextEditingController _controllerLasttName = new TextEditingController();
  final TextEditingController _controllerEmail = new TextEditingController();
  final TextEditingController _controllerPhone = new TextEditingController();
  final TextEditingController _controllerDescription = new TextEditingController();

  void _incrementCounter() async{
    var url = 'http://httpbin.org/post';
    http.post(url, body: JSON.encode(
       {'agent': 'ZK_Center',
         'intfVer':'1.0.0',
         'lang':'zh-CN',
         'plataform':'zkweb',
         'sessionId':'b5f3262f-804b-4580-946e-4d984480ebcf',
         'sys':'ZK_Center',
         'tz':'+8:00',
         'payload':{
          'params' : {
            'id':'',
            'name':_controllerFirstName.text,
            'lastName':_controllerLasttName.text,
            'email':_controllerEmail.text,
            'phone':_controllerPhone.text,
            'countryName':'Argentina',
            'supplier':'ZKteco',
            'category':'SDK',
            'serialNumber':'',
            'software':'',
            'questTitle':'SDK doc',
            'problemDesc':_controllerDescription.text,
          }
         }
       })).then((response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");
      if(response.statusCode == 200) {
        showDialog(
          context: context,
          child: new AlertDialog(
            content: new Text("Message sent successfully"),
          ),
        );
      }else{
        showDialog(
          context: context,
          child: new AlertDialog(
            content: new Text("There was a error, please try latter."),
          ),
        );
      }
    });
//    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
//    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Container(
        padding: new EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new ListTile(
              leading: const Icon(Icons.person),
              title: new TextField(
                  controller: _controllerFirstName,
                  decoration: new InputDecoration(
                  hintText: "First Name",
                ),
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.person),
              title: new TextField(
                controller: _controllerLasttName,
                  decoration: new InputDecoration(
                  hintText: "Last Name",
                ),
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.email),
              title: new TextField(
                controller: _controllerEmail,
                decoration: new InputDecoration(
                  hintText: "E-Mail",
                ),
              ),
            ),
            new ListTile(
              leading: const Icon(Icons.phone),
              title: new TextField(
                controller: _controllerPhone,
                decoration: new InputDecoration(
                    hintText: "Phone Number",
                ),
              ),
            ),
//            new ListTile(
//              leading: const Icon(Icons.flag),
//              title: new DropdownButton<String>(
//                  value:'Argentina',
//                  hint: new Text('Select a country'),
//                  items: <String>['Argentina', 'Brazil', 'Republica Dominicana', 'Chile', 'Uruguay', 'Mexico'].map((String value) {
//                    return new DropdownMenuItem<String>(
//                      value: value,
//                      child: new Text(value),
//                    );
//                  }).toList(),
//                  onChanged: (_) {}
//              ),
//            ),
//            new ListTile(
//              leading: const Icon(Icons.business),
//              title: new TextField(
//                decoration: new InputDecoration(
//                  hintText: "Provider",
//                ),
//              ),
//            ),
//            new ListTile(
//              leading: const Icon(Icons.assignment),
//              title: new DropdownButton<String>(
//                  value:'Attendace software',
//                  hint: new Text('Select a reason'),
//                  items: <String>['Hardware', 'Firmware', 'Attendace software'].map((String value) {
//                    return new DropdownMenuItem<String>(
//                      value: value,
//                      child: new Text(value),
//                    );
//                  }).toList(),
//                  onChanged: (_) {}
//              ),
//            ),
            new ListTile(
              leading: const Icon(Icons.text_fields),
              title: new TextField(
                  controller: _controllerDescription,
                  maxLines: 5,
                  decoration: new InputDecoration(
                  hintText: "Description",
                ),
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'New Question',
        child: new Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}