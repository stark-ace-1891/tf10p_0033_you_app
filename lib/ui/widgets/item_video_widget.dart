import 'package:flutter/material.dart';
import 'package:tf10p_0033_you_app/models/channel_model.dart';
import 'package:tf10p_0033_you_app/models/video_model.dart';
import 'package:tf10p_0033_you_app/pages/video_detail_page.dart';
import 'package:tf10p_0033_you_app/services/api_service.dart';

class ItemVideoWidget extends StatefulWidget {
  VideoModel videoModel;

  ItemVideoWidget({
    required this.videoModel,
  });

  @override
  State<ItemVideoWidget> createState() => _ItemVideoWidgetState();
}

class _ItemVideoWidgetState extends State<ItemVideoWidget> {
  ChannelModel? channel;
  final ApiService _apiService = ApiService();

  @override
  initState() {
    super.initState();
    getData(widget.videoModel);
    setState(() {});
  }

  getData(VideoModel videoModel) {
    _apiService.getChannel(videoModel.snippet.channelId).then((value) {
      channel = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoDetailPage(videoId: widget.videoModel.id.videoId),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          bottom: 10,
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Image.network(
                  widget.videoModel.snippet.thumbnails.high.url,
                  width: double.infinity,
                  height: height * 0.3,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 5,
                      vertical: 2,
                    ),
                    margin: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 10,
                    ),
                    color: Colors.black.withOpacity(0.7),
                    child: Text(
                      "23.22",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                widget.videoModel.snippet.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
              subtitle: Text(
                "${widget.videoModel.snippet.channelTitle} · 6.5 M de vistas · hace 2 años",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 13,
                ),
              ),
              leading: channel != null
                  ? CircleAvatar(
                      backgroundColor: Colors.white12,
                      backgroundImage:
                          NetworkImage(channel!.snippet.thumbnails.high.url),
                    )
                  : CircularProgressIndicator(),
              trailing: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      top: 4,
                    ),
                    child: Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
