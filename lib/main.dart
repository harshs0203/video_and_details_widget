import 'package:flutter/material.dart';
import 'package:video_and_details_widget/images.dart';
import 'package:video_player/video_player.dart';
import 'videoplayer.dart';
import 'package:flutter/services.dart' show rootBundle;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Video Detail Widget',
      home: VideoWidget(),
    );
  }
}

class VideoWidget extends StatefulWidget {
  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  String product = 'watch';
  String data = '';
  VideoPlayerController videoPlayerController =
      VideoPlayerController.asset('video/apple.mp4');

  @override
  void initState() {
    fetchingProduct();
    fetchFileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1c2834),
      body: Column(
        children: [
          VideoPlayer(videoPlayerController: videoPlayerController),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.05,
          // ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 15.0,
                ),
                child: Column(
                  children: [
                    ImageSlider(product: product),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.center,
                              colors: [Color(0xffFF2E0680), Color(0xff1c2834)])),
                      child: Column(
                        children: [
                          Text(
                            'APPLE ' + product.toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.025,
                          ),
                          Text(
                            data,
                            style: TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }

  fetchingProduct() {
    videoPlayerController.addListener(() {
      setState(() {
        if (videoPlayerController.value.position.inMinutes < 1) {
          product = 'watch';
          fetchFileData();
        } else if (videoPlayerController.value.position.inMinutes < 2) {
          product = 'ipad';
          fetchFileData();
        } else {
          product = 'macbook';
          fetchFileData();
        }
      });
    });
  }

  fetchFileData() async {
    String responseText;
    if (product == 'ipad') {
      responseText = await rootBundle.loadString('details/ipad.txt');
      setState(() {
        data = responseText;
      });
    } else if (product == 'watch') {
      responseText = await rootBundle.loadString('details/watch.txt');
      setState(() {
        data = responseText;
      });
    } else if (product == 'macbook') {
      responseText = await rootBundle.loadString('details/macbook.txt');
      setState(() {
        data = responseText;
      });
    }
  }

}

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({
    Key? key,
    required this.videoPlayerController,
  }) : super(key: key);

  final VideoPlayerController videoPlayerController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      child: Video(videoPlayerController: videoPlayerController),
    );
  }
}
