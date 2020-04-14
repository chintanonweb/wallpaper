import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

void main() => runApp(Setting());

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      saveThemesOnChange: true,
      loadThemeOnInit: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ThemeConsumer(
          child: SettingPage(),
        ),
      ),
    );
  }
}

class SettingPage extends StatefulWidget {
  SettingPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: Container(
            child: ListView(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 2.5,
              child: InkWell(
                child: ListTile(
                  leading: Icon(
                    Icons.palette,
                    size: 36.0,
                  ),
                  title: Text(
                    'Theme',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('Select the way you app looks.'),
                ),
                onTap: () {
                  setState(() {
                    showDialog(
                        context: context,
                        builder: (_) => ThemeConsumer(child: ThemeDialog()));
                  });
                },
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 2.5,
              child: InkWell(
                child: ListTile(
                  leading: Icon(
                    Icons.info,
                    size: 36.0,
                  ),
                  title: Text(
                    'About',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    child: new AlertDialog(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.0))),
                      title: new Text("About"),
                      content: Text(
                        "This Application is an initiative by Shree hari Infotech in order to provide best high quality Wallpaper. The wallpapers displayed in this application are provided by some other platform.",
                      ),
                      actions: <Widget>[
                        new FlatButton(
                          child: new Text('Close'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        )),
      ),
    );
  }
}
