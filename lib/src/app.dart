import 'package:flutter/material.dart';
import 'package:flutter_crud_api_sample_app/src/ui/formadd/form_add_screen.dart';
import 'package:flutter_crud_api_sample_app/src/ui/home/home_screen.dart';

GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green[500],
        accentColor: Colors.redAccent[300],
      ),
      home: Scaffold(
        key: _scaffoldState,
        appBar: AppBar(
          title: Text(
            "Flutter CRUD Rest API",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          actions: <Widget>[
            GestureDetector(
              onTap: () async {
                var result = await Navigator.push(
                  _scaffoldState.currentContext,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return FormAddScreen();
                  }),
                );
                if (result != null) {
                  setState(() {});
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Container(
                  child:Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 40,

                  ),
                )
              ),
            ),
          ],
        ),
        body: HomeScreen(),
      ),
    );
  }
}
