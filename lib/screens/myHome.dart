import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class IrentGH extends StatefulWidget {
  @override
  _IrentGHState createState() => _IrentGHState();
}
//@override
//void initState() {
//  super.initState();
//  Timer.run(() {
//    try {
//      InternetAddress.lookup('google.com').then((result) {
//        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//          print('connected');
//        } else {
//          _showDialog(); // show dialog
//        }
//      }).catchError((error) {
//        _showDialog(); // show dialog
//      });
//    } on SocketException catch (_) {
//      _showDialog();
//      print('not connected'); // show dialog
//    }
//  });
//}
//
//void _showDialog() {
//  // dialog implementation
//  showDialog(
//    context: context,
//    builder: (context) => AlertDialog(
//      title: Text("Internet needed!"),
//      content: Text("You may want to exit the app here"),
//      actions: <Widget>[FlatButton(child: Text("EXIT"), onPressed: () {})],
//    ),
//  );
//}

class _IrentGHState extends State<IrentGH> {

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
     appBar: PreferredSize(child: AppBar(
       backgroundColor: Colors.black87,
     ), preferredSize: Size.fromHeight(10)),
      url: "https://www.irentgh.com" ,
      hidden: true,
      initialChild: Container(
        child:  Center(
          child: SpinKitChasingDots(color: Colors.indigoAccent,
              //type: SpinKitWaveType.start,
          duration: Duration(seconds: 3),),
        ),
      ),
    );
  }
}

