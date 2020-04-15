import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:wallpapers/screens/ViewWallpaper.dart';
import 'package:wallpapers/screens/ViewCategory.dart';
import 'package:mysql1/mysql1.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _category = [];
  final List<String> _categoryImage = [];
  final List<String> _categoryId = [];
  final List<String> _wallpaper = [];
  final List<String> _wallpaperImage = [];
  void initState() {
    super.initState();
    getdb();
  }

  Widget build(BuildContext context) {
    var _width = MediaQuery.of(context).size.width / 2;

    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: Container(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Text(
                  'Categories',
                  style: TextStyle(
                      fontFamily: 'Sans',
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                new Container(
                  height: 200.0,
                  child: ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: _category.length,
                      itemBuilder: (context, index) {
                        return Container(
                          width: 250.0,
                          child: new GestureDetector(
                            child: Card(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15.0),
                                child: FadeInImage(
                                  image: NetworkImage(_categoryImage[index]),
                                  fit: BoxFit.cover,
                                  placeholder:
                                      AssetImage('assets/images/loading-1.gif'),
                                ),
                              ),
                              elevation: 2.5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ThemeConsumer(
                                        child: ViewCategory(
                                      id: _categoryId[index],
                                      name: _category[index],
                                    )),
                                  ));
                            },
                          ),
                        );
                      }),
                ),
                Text(
                  'Wallpaper',
                  style: TextStyle(
                      fontFamily: 'Sans',
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: _wallpaper.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Column(
                      children: <Widget>[
                        new GestureDetector(
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Container(
                              width: _width,
                              height: _width - 15,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: FadeInImage(
                                  image: NetworkImage(_wallpaperImage[index]),
                                  fit: BoxFit.cover,
                                  placeholder:
                                      AssetImage('assets/images/loading.gif'),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ThemeConsumer(
                                      child: ViewWallpaper(
                                    name: _wallpaper[index],
                                    url: _wallpaperImage[index],
                                  )),
                                ));
                          },
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future getdb() async {
    var settings = new ConnectionSettings(
        host: 'remotemysql.com',
        port: 3306,
        user: 'dGvHHrKOPT',
        password: 'FANjLTqbHT',
        db: 'dGvHHrKOPT');
    var conn = await MySqlConnection.connect(settings);
    var results = await conn.query('select * from w_category');
    var result1 = await conn.query('select * from w_wallpaper');
    var list = results.toList();
    var list1 = result1.toList();
    if (!mounted) return;
    setState(() {
      for (var i = 0; i < list.length; i++) {
        _category.add(list[i]["wc_category"].toString());
        _categoryImage.add(list[i]["wc_img"].toString());
        _categoryId.add(list[i]["wc_id"].toString());
      }
      for (var i = 0; i < list1.length; i++) {
        _wallpaper.add(list1[i]["ww_name"].toString());
        _wallpaperImage.add(list1[i]["ww_img"].toString());
      }
    });
  }
}
