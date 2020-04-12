import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wallpaper/wallpaper.dart';

class ViewWallpaper extends StatefulWidget {
  final String name;
  final String url;

  ViewWallpaper({@required this.name, this.url});
  @override
  _ViewWallpaperState createState() => _ViewWallpaperState();
}

class _ViewWallpaperState extends State<ViewWallpaper> {
  String home = "Home Screen",
      lock = "Lock Screen",
      both = "Both Screen";

  Stream<String> progressString;
  String res;
  bool downloading = false;
  var result = "Waiting to set wallpaper";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          new Container(
            width: double.infinity,
            height: double.infinity,
            child: FadeInImage(
              image: NetworkImage(widget.url),
              fit: BoxFit.cover,
              placeholder: AssetImage(widget.url),
            ),
          ),
          new Positioned(
            top: 30,
            left: 10,
            child: FloatingActionButton(
              tooltip: 'Close',
              child: Icon(
                Icons.clear,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              heroTag: "Close",
              mini: true,
              backgroundColor: Colors.black.withOpacity(0.7),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.black.withOpacity(0.5),
              height: 50.0,
              width: double.infinity,
              child: Center(
                child: Text(
                  widget.name,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          ),
          new Positioned(
            right: 20.0,
            bottom: 20.0,
            child: FloatingActionButton(
              tooltip: 'Set as Wallpaper',
              backgroundColor: Colors.black,
              child: Icon(
                Icons.format_paint,
                color: Colors.white,
              ),
              heroTag: "set",
              onPressed: setWallpaperDialog,
            ),
          ),
          _showProgressDialog(),
        ],
      ),
    );
  }

  void setWallpaperDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Set a wallpaper',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Home Screen',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                onTap: () {
                  progressString = Wallpaper.ImageDownloadProgress(widget.url);
                  progressString.listen((data) {
                    setState(() {
                      res = data;
                      downloading = true;
                    });
                    print("DataReceived: " + data);
                  }, onDone: () async {
                    home = await Wallpaper.homeScreen();
                    setState(() {
                      downloading = false;
                      home = home;
                    });
                    _successDialog();
                  }, onError: (error) {
                    setState(() {
                      downloading = false;
                    });
                    print("Some Error");
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Lock Screen',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
                onTap: () {
                  progressString = Wallpaper.ImageDownloadProgress(widget.url);
                  progressString.listen((data) {
                    setState(() {
                      res = data;
                      downloading = true;
                    });
                    print("DataReceived: " + data);
                  }, onDone: () async {
                    lock = await Wallpaper.lockScreen();
                    setState(() {
                      downloading = false;
                      lock = lock;
                    });
                    _successDialog();
                  }, onError: (error) {
                    setState(() {
                      downloading = false;
                    });
                    print("Some Error");
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text(
                  'Both',
                  style: TextStyle(color: Colors.black),
                ),
                leading: Icon(
                  Icons.phone_android,
                  color: Colors.black,
                ),
                onTap: () {
                  progressString = Wallpaper.ImageDownloadProgress(widget.url);
                  progressString.listen((data) {
                    setState(() {
                      res = data;
                      downloading = true;
                    });
                    print("DataReceived: " + data);
                  }, onDone: () async {
                    both = await Wallpaper.bothScreen();
                    setState(() {
                      downloading = false;
                      both = both;
                    });
                    _successDialog();
                  }, onError: (error) {
                    setState(() {
                      downloading = false;
                    });
                    print("Some Error");
                  });
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _successDialog() async {
    return showDialog(
        context: context,
        builder: (context) {
          Future.delayed(Duration(seconds: 3), () {
            Navigator.of(context).pop(true);
          });
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            backgroundColor: Colors.grey.withOpacity(0.8),
            title: Text(
              'Set Wallpaper Successfully',
              style: TextStyle(color: Colors.white),
            ),
          );
        });
  }

  Widget _showProgressDialog() {
    return new Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          downloading
              ? Container(
                  height: 120.0,
                  width: 200.0,
                  child: Card(
                    color: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        SizedBox(height: 20.0),
                        Text(
                          "Downloading File : $res",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                )
              : Text(''),
        ],
      ),
    );
  }
}
