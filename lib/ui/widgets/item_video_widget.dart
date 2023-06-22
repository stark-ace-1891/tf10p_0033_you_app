import 'package:flutter/material.dart';
import 'package:tf10p_0033_you_app/models/video_model.dart';

class ItemVideoWidget extends StatelessWidget {
  VideoModel videoModel;

  ItemVideoWidget({
    required this.videoModel,
  });

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(
                videoModel.snippet.thumbnails.high.url,
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
              videoModel.snippet.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            subtitle: Text(
              "${videoModel.snippet.channelTitle} · 6.5 M de vistas · hace 2 años",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white54,
                fontSize: 13,
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.white12,
              backgroundImage: NetworkImage(
                  "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"),
            ),
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
    );
  }
}
