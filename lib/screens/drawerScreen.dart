import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';

//final MyDrawer _drawer = new MyDrawer();

class MyDrawer extends StatefulWidget {



  @override
  _MyDrawerState createState() => new _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
//user profile pic i will edit here later with the switch user function
  String mainProfilePicture = "images/drawer.jpg";

  _MyDrawerState();


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          // Padding(padding: EdgeInsets.only(top: 60)),
          new UserAccountsDrawerHeader(
            accountName: new Text(
              "",
              style: new TextStyle(
                color: Colors.black,
              ),
            ),
            accountEmail: new Text(
              "",
              style: new TextStyle(color: Colors.black),
            ),
            currentAccountPicture: new GestureDetector(
              onTap: () => print("This is the current user"),
              child: new CircleAvatar(
                backgroundImage: new AssetImage(mainProfilePicture),
              ),
            ),
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage("images/IMG-20180912-WA0012.jpg"))),
          ),
          new ListTile(
            title: new Text("Agencies"),
            trailing: new Icon(Icons.account_circle),
            onTap: () {
//              Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                      builder: (BuildContext context) => AgencyList(new_data)));
            },
          ),
//          new ListTile(
//            title: new Text("Favourite"),
//            trailing: new Icon(Icons.add_shopping_cart),
//            onTap: _pushSaved,
//          ),
          // the  signout side
          new Divider(),
          new ListTile(
              title: new Text("Logout"),
              trailing: new Icon(Icons.arrow_back),
              onTap: () async {
//                SharedPreferences prefs = await SharedPreferences.getInstance();
              //  prefs.remove('data');

//                Navigator.pushReplacement(context,
//                    MaterialPageRoute(builder: (context) => LoginPage()));
              }),
        ],
      ),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: null));
  }
}
