import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mediatation_app/Widgets/Topic.dart';
import 'package:mediatation_app/screens/CategoryScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/back1.jpeg'),
          fit: BoxFit.cover,
        )),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            Text(
              'Welcome',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color:Colors.white,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'choose a topic to focus on:',
              style: TextStyle(
                fontSize: 17,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
                child: StaggeredGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              physics: ScrollPhysics(),
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Category(
                                  cname: 'Reduce Stress',
                                )));
                  },
                  child: Topic(
                    text: "Reduce Stress",
                    color: Color(0xFF8C9EFF),
                    textColor: Color(0xFFFFFFFF),
                    url: 'assets/images/img 1.png',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Category(
                                  cname: 'Improve Performance',
                                )));
                  },
                  child: Topic(
                    text: "Improve Performance",
                    color: Color(0xFFFF8A65),
                    textColor: Color(0xFFFFFFFF),
                    url: 'assets/images/img 2.png',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Category(
                                  cname: 'Reduce Anxiety',
                                )));
                  },
                  child: Topic(
                    text: "Reduce Anxiety",
                    color: Color(0xFFFFD180),
                    textColor: Color(0xFF000000),
                    url: 'assets/images/img 4.png',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Category(
                                  cname: 'Increase Happiness',
                                )));
                  },
                  child: Topic(
                      text: "Increase Happiness",
                      color: Color(0xFFFF9E80),
                      textColor: Color(0xFF000000),
                      url: 'assets/images/img 3.png'),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Category(
                                  cname: 'Personal Growth',
                                )));
                  },
                  child: Topic(
                    text: "Personal \nGrowth",
                    color: Color(0xFFA5D6A7),
                    textColor: Color(0xFF000000),
                    url: 'assets/images/img 5.png',
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Category(
                                  cname: 'Better Sleep',
                                )));
                  },
                  child: Topic(
                    text: "Better Sleep",
                    color: Color(0xFF263238),
                    textColor: Color(0xFFFFFFFF),
                    url: 'assets/images/img 6.png',
                  ),
                ),
              ],
              staggeredTiles: [
                StaggeredTile.extent(1, 150),
                StaggeredTile.extent(1, 130),
                StaggeredTile.extent(1, 150),
                StaggeredTile.extent(1, 130),
                StaggeredTile.extent(1, 150),
                StaggeredTile.extent(1, 130),
              ],
            )),
          ],
        ),
      ),
    ])));
  }
}

// flutter run -d chrome --web-renderer html