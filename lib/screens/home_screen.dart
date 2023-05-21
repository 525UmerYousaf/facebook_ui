// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../config/palette.dart';
import '../data/data.dart';
import '../models/post_model.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //  Below Controller is used to keep my home-screen custom
  //  scroll views in sync, reason for adding it is bcz if
  //  user is scrolling inside Desktop view and minimize view
  //  to mobile one then user's scroll would not be set back to
  //  starting point again.
  //  Without it problem is when on Desktop I scroll on any one
  //  of custom scroll view and then I resize my app to load the
  //  mobile UI (or vice versa). I'm actually re-rendering the
  //  whole entire custom scroll view.
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();
  //  Above one help to keep track of custom scroll views.

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          mobile:
              _HomeScreenMobile(scrollController: _trackingScrollController),
          desktop:
              _HomeScreenDesktop(scrollController: _trackingScrollController),
        ),
      ),
    );
  }
}

class _HomeScreenMobile extends StatelessWidget {
  final TrackingScrollController scrollController;
  const _HomeScreenMobile({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  Reason for providng body "CustomScrollView" is bcz I
    //  know Facebook AppBar is Sliver as it disappears everytime
    //  user scroll below and reappear when user scrolls above
    return CustomScrollView(
      controller: scrollController,
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
        SliverList(
          //  This widget is similar to "ListView.builder" widget
          //  for Sliver.
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final Post post = posts[index];
              return PostContainer(post: post);
            },
            childCount: posts.length,
          ),
        ),
      ],
    );
  }
}

class _HomeScreenDesktop extends StatelessWidget {
  final TrackingScrollController scrollController;
  const _HomeScreenDesktop({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: MoreOptionsList(currentUser: currentUser),
            ),
          ),
        ),
        const Spacer(),
        Container(
          //  Width is calculated by help of customTabBar.
          width: 600,
          child: CustomScrollView(
            controller: scrollController,
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                sliver: SliverToBoxAdapter(
                  child: Stories(currentUser: currentUser, stories: stories),
                ),
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

              SliverList(
                //  This widget is similar to "ListView.builder" widget
                //  for Sliver.
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final Post post = posts[index];
                    return PostContainer(post: post);
                  },
                  childCount: posts.length,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Flexible(
          flex: 2,
          child: Align(
            alignment: Alignment.centerRight,
            //  With wrapping my "Padding" widget inside "Align" widget
            //  I'm making sure that my contacts are aligned to right
            //  of screen.
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: ContactList(users: onlineUsers),
            ),
          ),
        ),
      ],
    );
  }
}
