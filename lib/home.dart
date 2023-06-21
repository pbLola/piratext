import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  //app bar
  final appBar = AppBar(
    elevation: .5,
    leading: IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {},
    ),
    title: Text('Piratex'),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.search),
        onPressed: () {},
      )
    ],
  );

  ///create book tile hero
  createTile(Book book) => Hero(
        tag: book.title,
        child: Material(
          elevation: 15.0,
          shadowColor: Colors.yellow.shade900,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, 'detail/${book.title}');
            },
            child: Image(
              image: AssetImage(book.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

  ///create book grid tiles
  final grid = CustomScrollView(
    primary: false,
    slivers: <Widget>[
      SliverPadding(
        padding: EdgeInsets.all(16.0),
        sliver: SliverGrid.count(
          childAspectRatio: 2 / 3,
          crossAxisCount: 3,
          mainAxisSpacing: 20.0,
          crossAxisSpacing: 20.0,
          children: books.map((book) => createTile(book)).toList(),
        ),
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: appBar,
      body: grid,
    );
  }
}
