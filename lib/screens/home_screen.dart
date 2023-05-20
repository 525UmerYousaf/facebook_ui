import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../widgets/widgets.dart';
import '../config/palette.dart';
import '../data/data.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  Rease for providng body "CustomScrollView" is bcz I
      //  know Facebook AppBar is Sliver as it disappears everytime
      //  user scroll below and reappear when user scrolls above
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle.light,
            backgroundColor: Colors.white,
            title: Text(
              'facebook',
              style: const TextStyle(
                color: Palette.facebookBlue,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                //  Below property is used to set the spaces between letters of text
                letterSpacing: -1.2,
              ),
            ),
            centerTitle: false,
            //  Below property to show appbar as soon as user scroll a little
            //  bit above so user doesn't has to scroll to the top above of page.
            floating: true,
            actions: [
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
          //  I want user post container right below the sliver
          //  appBar I created above so for this below "SliverAppBar"
          //  I define my Container but bcz we're inside "Sliver" I
          //  can't pass Container directly inside it otherwise I would
          //  get an error therefore, I wrap my Container inside
          //  "SliverToBoxAdapter". Various other slivers I can pass
          //  inside Slivers lis are given below as:
          //    (1)  SliverPadding(),
          //    (2)  SliverList(),
          //    (3)  SliverGrid(),
          SliverToBoxAdapter(
            child: CreatePostContainer(
              currentUser: currentUser,
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Rooms(onlineUsers: onlineUsers),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Stories(currentUser: currentUser, stories: stories),
            ),
          ),
        ],
      ),
    );
  }
}
