import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:wallpapers/screens/ViewWallpaper.dart';

class ViewCategory extends StatefulWidget {
  final String id;
  final String name;

  ViewCategory({@required this.id, this.name});
  _ViewCategoryState createState() => _ViewCategoryState();
}

class _ViewCategoryState extends State<ViewCategory> {
  final List<String> _wallpaper = [];
  final List<String> _wallpaperImage = [];
  void initState() {
    getdb();
    super.initState();
  }

  @override
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
                widget.name,
                style: TextStyle(
                    fontFamily: 'Sans',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 24),
              ),
              Container(
                child: GridView.builder(
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
                              height: _width - 10,
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
                                    builder: (context) => ViewWallpaper(
                                          name: _wallpaper[index],
                                          url: _wallpaperImage[index],
                                        )));
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }

  Future getdb() async {
    var settings = new ConnectionSettings(
        host: '192.168.43.24',
        port: 3306,
        user: 'shi',
        password: 'shi',
        db: 'wallpaper');
    var conn = await MySqlConnection.connect(settings);
    var catid = widget.id;
    var results =
        await conn.query('SELECT * FROM w_wallpaper WHERE wc_id= ?', [catid]);
    var list = results.toList();
    setState(() {
      for (var i = 0; i < list.length; i++) {
        _wallpaper.add(list[i]["ww_name"].toString());
        _wallpaperImage.add(list[i]["ww_img"].toString());
      }
    });
  }
}
