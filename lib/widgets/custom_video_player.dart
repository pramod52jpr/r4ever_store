import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pod_player/pod_player.dart';
import 'package:r4everstore/widgets/loading_widget.dart';

class CustomVideoPlayer extends StatefulWidget {
  final dynamic link;
  const CustomVideoPlayer({super.key, this.link});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  late PodPlayerController controller;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.link is File){
      controller = PodPlayerController(
          playVideoFrom: PlayVideoFrom.file(widget.link),
          podPlayerConfig: const PodPlayerConfig(
            autoPlay: false,
            // isLooping: false,
            // videoQualityPriority: [720, 360]
          )
      )..initialise().then((value) => setState(() {}));
    }else{
      controller = PodPlayerController(
        playVideoFrom: PlayVideoFrom.network(widget.link),
        podPlayerConfig: const PodPlayerConfig(
            autoPlay: false,
            // isLooping: false,
            // videoQualityPriority: [720, 360]
        )
      )..initialise().then((value) => setState(() {}));
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: controller.isInitialised ? null : 150,
      child: controller.isInitialised
          ? PodVideoPlayer(controller: controller, videoAspectRatio: controller.videoPlayerValue!.aspectRatio, frameAspectRatio: controller.videoPlayerValue!.aspectRatio)
          : const LoadingWidget(),
    );
  }
}
