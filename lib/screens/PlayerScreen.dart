import 'package:flutter/material.dart';
import 'package:mediatation_app/Widgets/categorytile.dart';
import 'package:mediatation_app/data/VideoList.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Player extends StatefulWidget {
  final String id;
  final String cname;
  Player({Key? key, required this.id, required this.cname}) : super(key: key);
  @override
  _Player createState() => _Player();
}

class _Player extends State<Player> {
  late YoutubePlayerController _controller;
  VideoList videos = VideoList();

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: this.widget.id,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    );
    //   SystemChrome.setEnabledSystemUIOverlays([]);
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    // SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(children: [
              YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: _controller,
                  ),
                  builder: (context, player) {
                    return player;
                  }),
                Container(
                     decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/back2.jpg'),
                  fit: BoxFit.cover,
                )),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      itemCount: videos.videomap[this.widget.cname]!.length,
                      itemBuilder: (BuildContext context, int index) {
                        String id = videos.videomap[this.widget.cname][index];
                        if (id != this.widget.id) {
                          return InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Player(
                                              id: videos.videomap[this.widget.cname]
                                                  [index],
                                              cname: this.widget.cname,
                                            )));
                              },
                              child: CategoryTile(
                                  url: videos.photomap[id],
                                  name: videos.video_name_map[id]));
                        } else {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              color: Colors.red,
                              child: GridTile(
                                child: Image.network(
                                  videos.photomap[id],
                                  fit: BoxFit.cover,
                                ),
                                footer: Container(
                                  color: Colors.black.withOpacity(0.5),
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            videos.video_name_map[id],
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        ),
                                        Image.asset(
                                          'assets/images/loader.gif',
                                          height: 20,
                                          width: 30,
                                        ),
                                      ]),
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ]),
        ));
  }
}
// flutter run -d chrome --web-renderer html
