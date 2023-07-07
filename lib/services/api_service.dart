import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tf10p_0033_you_app/models/channel_model.dart';
import 'package:tf10p_0033_you_app/models/video_model.dart';
import 'package:tf10p_0033_you_app/utils/constants.dart';

class ApiService {
  Future<List<VideoModel>> getVideos() async {
    List<VideoModel> videosModel = [];
    String _path =
        "$pathProduction/search?part=snippet&key=$apiKey&maxResults=10&regionCode=PE";
    Uri _uri = Uri.parse(_path);

    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      List videos = myMap["items"];
      videosModel = videos.map((e) => VideoModel.fromJson(e)).toList();
    }
    return videosModel;
  }

  Future<ChannelModel> getChannel(id) async {
    late ChannelModel channelModel;
    String _path =
        "$pathProduction/channels?part=snippet&key=$apiKey&maxResults=50&regionCode=PE&id=$id";
    Uri _uri = Uri.parse(_path);

    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      channelModel = ChannelModel.fromJson(myMap["items"][0]);
    }
    return channelModel;
  }
}
