import 'package:flutter/material.dart';
import 'package:video_and_details_widget/ipad.dart';
import 'package:video_and_details_widget/macbook.dart';
import 'package:video_and_details_widget/watch.dart';
import 'package:video_player/video_player.dart';
import 'videoplayer.dart';

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

  final controller = PageController(initialPage: 0);

  @override
  void initState() {
    //fetchFileData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1c2834),
      body: Column(
        children: [
          VideoPlayer(videoPlayerController: videoPlayerController),
          Expanded(
            child: PageView(
              onPageChanged: (itemIndex){
                fetchingProduct(itemIndex);
              },
              controller: controller,
              children: [
                Watch(),
                Ipad(),
                Macbook(),
              ],
            )
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

  seekingPosition(){
    if(product == 'watch'){
      videoPlayerController.seekTo(Duration(minutes:  0));
    }else if(product == 'ipad'){
      videoPlayerController.seekTo(Duration(minutes:  1));
    }else if(product == 'macbook'){
      videoPlayerController.seekTo(Duration(minutes:  2));
    }
  }

  fetchingProduct(int itemIndex){
    if(itemIndex == 0){
      setState(() {
        product = 'watch';
        seekingPosition();
      });
    }else if(itemIndex == 1){
      setState(() {
        product = 'ipad';
        seekingPosition();
      });
    }else if(itemIndex == 2){
      setState(() {
        product = 'macbook';
        seekingPosition();
      });
    }
  }

  // fetchingProduct() {
  //   videoPlayerController.addListener(() {
  //     setState(() {
  //       if (videoPlayerController.value.position.inMinutes < 1) {
  //         product = 'watch';
  //         fetchFileData();
  //       } else if (videoPlayerController.value.position.inMinutes < 2) {
  //         product = 'ipad';
  //         fetchFileData();
  //       } else {
  //         product = 'macbook';
  //         fetchFileData();
  //       }
  //     });
  //   });
  // }

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
