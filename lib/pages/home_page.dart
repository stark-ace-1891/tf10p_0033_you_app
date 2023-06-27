import 'package:flutter/material.dart';
import 'package:tf10p_0033_you_app/models/video_model.dart';
import 'package:tf10p_0033_you_app/services/api_service.dart';
import 'package:tf10p_0033_you_app/ui/general/colors.dart';
import 'package:tf10p_0033_you_app/ui/widgets/item_filter_widget.dart';
import 'package:tf10p_0033_you_app/ui/widgets/item_video_widget.dart';

class HomPage extends StatefulWidget {
  @override
  State<HomPage> createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {
  final ApiService _apiSercice = ApiService();
  List<VideoModel> videos = [];

  @override
  initState() {
    super.initState();
    getData();
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

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 0,
        ),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: kBrandSecondaryColor,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(Icons.explore_outlined),
                    label: Text("Explorar"),
                  ),
                  SizedBox(
                    height: 32,
                    child: VerticalDivider(
                      color: Colors.white30,
                      thickness: 1,
                    ),
                  ),
                  ItemFilterWidget(
                    text: "Todos",
                    isSelected: true,
                  ),
                  ItemFilterWidget(
                    text: "Mixes",
                    isSelected: false,
                  ),
                  ItemFilterWidget(
                    text: "Música",
                    isSelected: false,
                  ),
                  ItemFilterWidget(
                    text: "Programación",
                    isSelected: false,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: videos.length,
              itemBuilder: (BuildContext context, int index){
                return ItemVideoWidget(videoModel: videos[index],);
              },
            ),
          ],
        ),
      ),
    );
  }
}
