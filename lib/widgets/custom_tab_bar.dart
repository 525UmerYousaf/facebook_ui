// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:facebook_ui/config/palette.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final void Function(int) onTap;
  const CustomTabBar({
    Key? key,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      //  With following property I'm forcing indicator
      //  to be at top instead of by-default bottom of
      //  each Icon.
      indicator: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Palette.facebookBlue,
            width: 3,
          ),
        ),
      ),
      //  In order to tell which Icon is selected (meaning changes it color
      //  to show it as an active icon). For this, I need to check index of
      //  which tab is pressed by user. To get that index I convert my list
      //  of icons to the map which gives me access to index and icon.
      tabs: icons
          .asMap()
          .map(
            //  Since I converted my list into an map So, I have to
            //  now return a "MapEntry"
            (index, icon) => MapEntry(
              index,
              Tab(
                icon: Icon(
                  icon,
                  color: index == selectedIndex
                      ? Palette.facebookBlue
                      : Colors.black45,
                  size: 30.0,
                ),
              ),
            ),
          )
          .values
          //  Above ".valuess" return "Tab" meaning value part of my Map
          //  which in the end again convert to list again.
          .toList(),
      onTap: onTap,
    );
  }
}
