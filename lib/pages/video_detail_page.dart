import 'package:flutter/material.dart';
import 'package:tf10p_0033_you_app/models/video_model.dart';
import 'package:tf10p_0033_you_app/services/api_service.dart';
import 'package:tf10p_0033_you_app/ui/general/colors.dart';
import 'package:tf10p_0033_you_app/ui/widgets/item_video_detail_widget.dart';
import 'package:tf10p_0033_you_app/ui/widgets/item_video_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoDetailPage extends StatefulWidget {
  String videoId;

  VideoDetailPage({required this.videoId});

  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  final ApiService _apiSercice = ApiService();
  List<VideoModel> videos = [];
  late YoutubePlayerController _playerController;

  @override
  void initState() {
    super.initState();
    getData();
    _playerController = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        hideControls: false,
      ),
    );
  }

  getData() {
    _apiSercice.getVideos().then((value) {
      videos = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    _apiSercice.getVideos();
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kBrandPrimaryColor,
      body: Column(
        children: [
          SizedBox(
            height: height * 0.35,
            child: YoutubePlayer(
              controller: _playerController,
              progressColors: ProgressBarColors(
                playedColor: Colors.red,
                handleColor: Colors.red,
                bufferedColor: Colors.white54,
                backgroundColor: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          ListTile(
            title: Text(
              "Lorem dsasd asd as  sadasd as d asd sad as d as d sadasdasdasd asd asdas d asd Lorem dsasd asd as  sadasd as d asd sad as d as d sadasdasdasd asd asdas d asd Lorem dsasd asd as  sadasd as d asd sad as d as d sadasdasdasd asd asdas d asd Lorem dsasd asd as  sadasd as d asd sad as d as d sadasdasdasd asd asdas d asd Lorem dsasd asd as  sadasd as d asd sad as d as d sadasdasdasd asd asdas d asd",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                height: 1.3,
                fontSize: 14,
              ),
            ),
            subtitle: Text(
              "6.5 M de vistas · hace 2 años",
              style: TextStyle(
                color: Colors.white54,
                fontSize: 14,
              ),
            ),
            trailing: Icon(
              Icons.keyboard_arrow_down,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ItemVideoDetailWidget(
                            text: "53 K",
                            icon: Icons.thumb_up_alt_outlined,
                          ),
                          ItemVideoDetailWidget(
                            text: "No me gusta",
                            icon: Icons.thumb_down_alt_outlined,
                          ),
                          ItemVideoDetailWidget(
                            text: "Compartir",
                            icon: Icons.share,
                          ),
                          ItemVideoDetailWidget(
                            text: "Crear",
                            icon: Icons.play_arrow_rounded,
                          ),
                          ItemVideoDetailWidget(
                            text: "Descargar",
                            icon: Icons.download_done_rounded,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white24,
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white24,
                      backgroundImage: NetworkImage(
                          "https://images.pexels.com/photos/598917/pexels-photo-598917.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
                    ),
                    title: Text(
                      "dsfsdf dsfsdfsd sdfsdfsdf dsfsdf",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    subtitle: Text(
                      "1.43 M de suscriptores",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Suscrito",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Icon(
                          Icons.notifications_none,
                          color: Colors.white70,
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.white24,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: videos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemVideoWidget(
                        videoModel: videos[index],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
