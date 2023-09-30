import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FirstDesign extends StatefulWidget {
  const FirstDesign({Key? key}) : super(key: key);

  @override
  State<FirstDesign> createState() => _FirstDesignState();
}

class _FirstDesignState extends State<FirstDesign> {
  final String txt =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Praesent volutpat risus a nisl efficitur, vel vestibulum elit iaculis.Suspendisse potenti. Fusce vel justo vel libero eleifend laoreet.";
  final String text =
      "Lorem ipsum dolor sit amet,vel justo vel libero eleifend laoreet  a nisl efficitur, vel vestibulum";
  double blurSigmaX = 0.0;
  double textOpacity = 1.0;
  ScrollController scrollController = ScrollController();
  List<String> imageList = [
    "assets/tour/5.jpg",
    "assets/tour/6.jpg",
    "assets/tour/6.jpeg",
    "assets/tour/7.jpg",
    "assets/tour/1.jpg",
    "assets/tour/2.jpg",
    "assets/tour/3.jpg",
    "assets/tour/4.jpg",
  ];

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      setState(() {
        blurSigmaX = scrollController.offset / 10;
        if (scrollController.offset > 100) {
          textOpacity = 0.0;
        } else {
          textOpacity = 1.0;
        }
      });
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  String? videoId;
  @override
  Widget build(BuildContext context) {
    videoId = YoutubePlayer.convertUrlToId("https://youtu.be/es4x5R-rV9s?si=22tub1iN5mby_eQC");
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.75,
            floating: false,
            pinned: true,
            flexibleSpace: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.80,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/img/paris.jpg"),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        color: Colors.black12,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AnimatedOpacity(
                                opacity: textOpacity,
                                duration: const Duration(milliseconds: 300),
                                child: Container(
                                  height: 30,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    color: Colors.green[500],
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "ON SALE",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 13),
                                    ),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      AnimatedOpacity(
                                        opacity: textOpacity,
                                        duration: const Duration(milliseconds: 300),
                                        child: const Text(
                                          "Effil Tower",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      AnimatedOpacity(
                                        opacity: textOpacity,
                                        duration: const Duration(milliseconds: 300),
                                        child: const Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Icon(Icons.location_on,
                                                size: 16, color: Colors.white),
                                            Text(
                                              "Paris, France",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  AnimatedOpacity(
                                    opacity: textOpacity,
                                    duration: const Duration(milliseconds: 300),
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.blueGrey[700],
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Colors.white)),
                                      child: const Center(
                                        child: Icon(Icons.flight_takeoff,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: blurSigmaX, sigmaY: 0.0),
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(CupertinoIcons.arrow_down,
                        color: Colors.white)),
                IconButton(
                    onPressed: () {},
                    icon:
                        const Icon(CupertinoIcons.heart, color: Colors.white)),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      Container(
                        height: 5,
                        width: 50,
                        color: Colors.black54,
                      ),
                      const SizedBox(height: 15),
                      SizedBox(
                        height: 130,
                        child: ListView.builder(
                            itemCount: imageList.length,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: slider(imageUrl: imageList[index]),
                              );
                            }),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(txt,
                                style: const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black54)),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Read More...",
                                style: TextStyle(
                                    color: Colors.blueGrey[700],
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Container(
                          height: 130,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: YoutubePlayer(
                            controller: YoutubePlayerController(
                              initialVideoId: videoId
                                  .toString(), // Replace with your YouTube video ID
                              flags: const YoutubePlayerFlags(
                                autoPlay: false,
                                mute: false,
                              ),
                            ),
                            showVideoProgressIndicator: true,
                            progressIndicatorColor: Colors.red,
                            progressColors: const ProgressBarColors(
                              playedColor: Colors.red,
                              handleColor: Colors.redAccent,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Top Sight",
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                                color: Colors.blueGrey[700]),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width * 0.50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                      filterQuality: FilterQuality.low,
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/tour/4.jpg"))),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "About Travel",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black26,
                                    ),
                                  ),
                                  Text(
                                    text,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.blueGrey[700],
                            borderRadius: BorderRadius.circular(25)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.flight_takeoff,
                                  color: Colors.white),
                              const Text("Search Flight",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white)),
                              Container(
                                height: 30,
                                width: 90,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Center(
                                  child: Text("ON SALE",style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget slider({required String imageUrl}) {
    return Container(
      height: 120,
      width: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black12,
        border: Border.all(color: Colors.black12),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(imageUrl),
        ),
      ),
    );
  }
}

class TopRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    const cornerRadius = 20.0;

    path.moveTo(0, cornerRadius);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, cornerRadius);
    path.arcToPoint(
      Offset(size.width, 0),
      radius: const Radius.circular(cornerRadius),
      clockwise: false,
    );

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
