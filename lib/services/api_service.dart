import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tf10p_0033_you_app/models/video_model.dart';


class ApiService{

 Future<List<VideoModel>> getVideos() async{
    List<VideoModel> videosModel = [];
    String _path = "https://youtube.googleapis.com/youtube/v3/search?part=snippet&key=AIzaSyDfJybqtNsrg-wMpc64w2Kd4_g_5SzwSpw&maxResults=50&regionCode=PE";
    Uri _uri = Uri.parse(_path);

    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> myMap = json.decode(response.body);
      List videos = myMap["items"];
      videosModel = videos.map((e) => VideoModel.fromJson(e)).toList();
      print(videosModel);
    }
    return videosModel;
  }

}