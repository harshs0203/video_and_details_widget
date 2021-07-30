import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  final VideoPlayerController videoPlayerController;

  const Video({Key? key, required this.videoPlayerController})
      : super(key: key);

  @override
  _VideoState createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late ChewieController _chewieController;

  @override
  void initState() {
    _chewieController = ChewieController(
      materialProgressColors: ChewieProgressColors(
        backgroundColor: Colors.purple,
        bufferedColor: Colors.purple,
        handleColor: Colors.purple,
        playedColor: Colors.purple,
      ),
        videoPlayerController: widget.videoPlayerController,
        aspectRatio: 1 / 1,
        autoInitialize: true,
        autoPlay: true,
        looping: true,
        errorBuilder: (context, error) {
          return Center(
            child: Text(error),
          );
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Chewie(controller: _chewieController)),
    );
  }

  @override
  void dispose() {
    _chewieController.dispose();
    super.dispose();
  }
}
