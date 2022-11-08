import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled8/widget/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../const.dart';

class DetailsScreen extends StatefulWidget {
   DetailsScreen({Key? key,required this.id,required this.imagePath,required this.name,required this.overView}) : super(key: key);
   String imagePath;
   String name;
   String overView;
   String id;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}
//https://www.youtube.com/watch?v=2qz5BG9xtlc
class _DetailsScreenState extends State<DetailsScreen> {
  YoutubePlayerController? _youtubePlayerController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //PLl99DlL6b4
    _youtubePlayerController=YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=${widget.id}")!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        isLive: false,
        loop: false,
        mute: false,
      ),
    );
  }
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    _youtubePlayerController!.pause();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _youtubePlayerController!.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double height =MediaQuery.of(context).size.height;
    double width =MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:backgroundColor ,
        title: CustomText(txt: "Movies",),
        centerTitle: true,
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          children: [
            Image.network(
              "${widget.imagePath}",
              height: double.infinity,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3,sigmaY: 3),
                child: Container(
                  color:backgroundColor.withOpacity(.5),
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Container(
                    height:height*.34 ,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadiusDirectional.circular(20)
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: CustomText(txt: "Watch Trailer"),
                        ),
                        YoutubePlayer(
                            controller: _youtubePlayerController!,
                            onReady: (){
                              _youtubePlayerController!.play();
                            },
                        )

                      ],
                    ),
                  ),
                  SizedBox(height: height*.03,),
                  CustomText(txt: widget.name),
                  SizedBox(height: height*.03,),
                  CustomText(txt: widget.overView)
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: primaryColor,
          onPressed: (){
            launchUrl(Uri.parse("https://cima4u.cloud/search/${widget.name}"));
          },
          label: CustomText(txt: "watch on cima4u",)
      ),
    );
  }
}
