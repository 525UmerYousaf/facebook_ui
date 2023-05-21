// ignore_for_file: public_member_api_docs, sort_constructors_first, sized_box_for_whitespace, avoid_print
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/palette.dart';
import '../models/user_model.dart';
import 'widgets.dart';

class CustomAppBar extends StatelessWidget {
  final User currentUser;
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  const CustomAppBar({
    Key? key,
    required this.currentUser,
    required this.icons,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Text(
              'facebook',
              style: TextStyle(
                color: Palette.facebookBlue,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                //  Below property is used to set the spaces between letters of text
                letterSpacing: -1.2,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: 600,
            child: CustomTabBar(
              icons: icons,
              selectedIndex: selectedIndex,
              onTap: onTap,
              isBottomIndicator: true,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                UserCard(
                  user: currentUser,
                ),
                const SizedBox(width: 12),
                CircleButton(
                  icon: Icons.search,
                  iconSize: 30,
                  onPressed: () => print('Search'),
                ),
                CircleButton(
                  icon: MdiIcons.facebookMessenger,
                  iconSize: 30,
                  onPressed: () => print('Messenger'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
