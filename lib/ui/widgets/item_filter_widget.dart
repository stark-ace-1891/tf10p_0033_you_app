import 'package:flutter/material.dart';
import 'package:tf10p_0033_you_app/ui/general/colors.dart';

class ItemFilterWidget extends StatelessWidget {
  String text;
  bool isSelected;

  ItemFilterWidget({
    required this.text,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 10,
      ),
      child: Chip(
        backgroundColor: isSelected ? Colors.white : kBrandSecondaryColor,
        label: Text(
          text,
          style: TextStyle(
            color: isSelected ? kBrandPrimaryColor : Colors.white,
          ),
        ),
      ),
    );
  }
}
