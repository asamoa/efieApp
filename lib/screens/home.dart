import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Dialogs {
  static Future<void> showLoadingDialog(
      BuildContext context, GlobalKey key) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(
                  key: key,
                  backgroundColor: Colors.transparent,
                  children: <Widget>[
                    Center(
                      child: Column(children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 10,),
                        Text("Please Wait....",style: TextStyle(color: Colors.blueAccent),)
                      ]),
                    )
                  ]));
        });
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String url = "https://flutter.dev/";
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();

  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  StreamSubscription<WebViewStateChanged> _onchanged; // here we checked the url state if it loaded or start Load or abort Load

  @override
  void initState() {
    super.initState();
    _onchanged = flutterWebviewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      if (mounted) {
        if(state.type== WebViewState.finishLoad){
         // if the full website page loaded
          print("loaded...");
          Navigator.of(_keyLoader.currentContext,rootNavigator: true).pop();
        }else if (state.type== WebViewState.abortLoad){ // if there is a problem with loading the url
          print("there is a problem...");
        } else if(state.type== WebViewState.startLoad){ // if the url started loading
          print("start loading...");
          Dialogs.showLoadingDialog(context, _keyLoader);

        }
      }
    });



  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    flutterWebviewPlugin.dispose(); // disposing the webview widget
  }



  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
        url: url,
        withJavascript: false, // run javascript
        withZoom: false, // if you want the user zoom-in and zoom-out
        hidden: true , // put it true if you want to show CircularProgressIndicator while waiting for the page to load

        appBar: AppBar(
          title: Text("Flutter"),
          centerTitle: false,
          elevation: 1, // give the appbar shadows
          iconTheme: IconThemeData(color: Colors.white),
          actions: <Widget>[
            InkWell(
              child: Icon(Icons.refresh),
              onTap: (){
                flutterWebviewPlugin.reload();
                // flutterWebviewPlugin.reloadUrl(); // if you want to reloade another url
              },
            ),

            InkWell(
              child: Icon(Icons.stop),
              onTap: (){
                flutterWebviewPlugin.stopLoading(); // stop loading the url
              },
            ),

            InkWell(
              child: Icon(Icons.remove_red_eye),
              onTap: (){
                flutterWebviewPlugin.show(); // appear the webview widget
              },
            ),

            InkWell(
              child: Icon(Icons.close),
              onTap: (){
                flutterWebviewPlugin.hide(); // hide the webview widget
              },
            ),

            InkWell(
              child: Icon(Icons.arrow_back),
              onTap: (){
                flutterWebviewPlugin.goBack(); // for going back
              },
            ),

            InkWell(
              child: Icon(Icons.forward),
              onTap: (){
                flutterWebviewPlugin.goForward(); // for going forward
              },
            ),

          ],

        ),


        initialChild: Container( // but if you want to add your own waiting widget just add InitialChild
          color: Colors.white,
          child: const Center(
            child: Text('waiting...'),
          ),)


    );
  }

  loading(){
    Center(
      child: Container(
        child: SpinKitChasingDots(color: Colors.indigoAccent,
          //type: SpinKitWaveType.start,
          duration: Duration(seconds: 3),),
      ),
    );
  }
}