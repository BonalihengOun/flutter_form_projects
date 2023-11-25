import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubePlay extends StatefulWidget {
  const YouTubePlay({super.key});

  @override
  State<YouTubePlay> createState() => _YouTubePlayState();
}

class _YouTubePlayState extends State<YouTubePlay> {
  final videoURL = 'https://youtu.be/lHhRhPV--G0?si=Inm-QSfhaWEmDPK3';
  final videoURL1 = 'https://youtu.be/NrO0CJCbYLA?si=XhaFGhS3pC86hbg5';
  late YoutubePlayerController _controller;
  late YoutubePlayerController controller;
  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoURL);
    _controller = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: YoutubePlayerFlags(autoPlay: false),
    );
    final videoID1 = YoutubePlayer.convertUrlToId(videoURL1);
    controller = YoutubePlayerController(
      initialVideoId: videoID1!,
      flags: YoutubePlayerFlags(autoPlay: false),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.15,
                    color: Colors.amber,
                    child: YoutubePlayer(
                      controller: _controller,
                      showVideoProgressIndicator: true,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.15,
                    color: Colors.black,
                    child: YoutubePlayer(
                      controller: controller,
                      showVideoProgressIndicator: true,
                      bottomActions: [
                        CurrentPosition(),
                        ProgressBar(
                          isExpanded: true,
                          colors: ProgressBarColors(
                            playedColor: Colors.amber,
                            handleColor: Colors.black,
                          ),
                        ),
                        PlaybackSpeedButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.1,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.42,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 2, color: Color(0xffDBBA44)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Center(
                            child: Text(
                              "Add New",
                              style: TextStyle(
                                fontFamily: "Niradei",
                                color: Color(0xffDBBA44),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.42,
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                              color: Color(0xffDBBA44),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12))),
                          child: Center(
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  fontFamily: "Niradei", color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
