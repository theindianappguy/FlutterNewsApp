import 'package:flutter/material.dart';
import 'package:news_app_api/views/article_view.dart';

import '../views/categorie_news.dart';

Widget MyAppBar(  ){
  return AppBar(
    leading:actionButton(),
    actions: [IconButton(icon: Icon(Icons.add),)],
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Flutter",
          style:
          TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
        ),
        Text(
          "News",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
        )
      ],
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}


class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;

  NewsTile({this.imgUrl, this.desc, this.title, this.content, @required this.posturl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ArticleView(
              postUrl: posturl,
            )
        ));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(6),bottomLeft:  Radius.circular(6))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        imgUrl,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(height: 12,),
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    desc,
                    maxLines: 2,
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  )
                ],
              ),
            ),
          )),
    );
  }
}

Widget actionButton() => Builder(
  builder: (BuildContext context) {
    return  IconButton(
        icon: Icon(Icons.menu),
        color: Colors.grey,
        onPressed: (){
          Scaffold.of(context).openDrawer();
    } );
  }
);

Widget customDrawer(List<String> list) =>  Drawer(
  backgroundColor: Colors.white,
       child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return _drawerItem(list[index], context);
              },
       ),
);

Widget _drawerItem(String title, BuildContext context) => GestureDetector(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => CategoryNews(
      newsCategory: title.toLowerCase(),
    )));
  },
  child: ListTile(
    leading: Icon(Icons.category),
      title: Text(title)),
);
