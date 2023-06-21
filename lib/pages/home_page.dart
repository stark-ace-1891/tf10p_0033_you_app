import 'package:flutter/material.dart';
import 'package:tf10p_0033_you_app/ui/general/colors.dart';
import 'package:tf10p_0033_you_app/ui/widgets/item_filter_widget.dart';
import 'package:tf10p_0033_you_app/ui/widgets/item_vide_widget.dart';

class HomPage extends StatelessWidget {
  const HomPage({super.key});

  @override
  Widget build(BuildContext context) {
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
            ItemVideoWidget(),
            ItemVideoWidget(),
            ItemVideoWidget(),
          ],
        ),
      ),
    );
  }
}
