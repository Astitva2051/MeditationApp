import 'package:flutter/material.dart';
import 'package:mediatation_app/Widgets/categorytile.dart';
import 'package:mediatation_app/data/VideoList.dart';
import 'package:mediatation_app/screens/PlayerScreen.dart';

class Category extends StatelessWidget {
  final String cname;
  Category({Key? key, required this.cname}) : super(key: key);

  final VideoList videos = VideoList();
  static String bgpath = "assets/images/back2.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          cname,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
       backgroundColor: Colors.blue.shade900,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(bgpath),
            fit: BoxFit.cover,
          )),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Choose your video",style: TextStyle(color: Colors.yellow,fontSize: 22))),
                SizedBox(
                  height: 20,
                ),
                 GridView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 1.0,
                    ),
                    itemCount: videos.videomap[cname]!.length,
                    itemBuilder: (BuildContext context, int index) {
                      String id = videos.videomap[cname][index];
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Player(
                                          id: id,
                                          cname: this.cname,
                                        )));
                          },
                          child: CategoryTile(
                              url: videos.photomap[id],
                              name: videos.video_name_map[id]));
                    },
                  ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}


// flutter run -d chrome --web-renderer html
