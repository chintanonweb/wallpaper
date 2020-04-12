import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:wallpapers/screens/ViewCategory.dart';

class Category extends StatefulWidget {
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  final List<String> _category = [];
  final List<String> _categoryImage = [];
  final List<String> _categoryId = [];
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
              'Categories',
              style: TextStyle(
                  fontFamily: 'Sans',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 24),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: _category.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
                          height: _width - 50,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: FadeInImage(
                              image: NetworkImage(_categoryImage[index]),
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
                                builder: (context) => ViewCategory(
                                      id: _categoryId[index],
                                      name: _category[index],
                                    )));
                      },
                    ),
                    Text(
                      _category[index],
                      style: TextStyle(
                          fontFamily: 'Sans',
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 24),
                    ),
                  ],
                );
              },
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
    var results = await conn.query('select * from w_category');
    var list = results.toList();
    setState(() {
      for (var i = 0; i < list.length; i++) {
        _category.add(list[i]["wc_category"].toString());
        _categoryImage.add(list[i]["wc_img"].toString());
        _categoryId.add(list[i]["wc_id"].toString());
      }
    });
  }
}
