// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../models/story_model.dart';
import '../models/user_model.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;
  const Stories({
    Key? key,
    required this.currentUser,
    required this.stories,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.purple,
      child: ListView.builder(
        //  Reason for below line of code is if one checkout the
        //  stories section then first story is create a story
        //  button for user to create an story
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + stories.length,
        itemBuilder: (BuildContext context, int index) {
          final Story story = stories[index - 1];
          return (index == 0)
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: _StoryCard(
                    //  Below property will help me to know whether I have to
                    //  show plus button or user profile to whom story belongs to
                    isAddStory: true,
                    currentUser: currentUser,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: _StoryCard(story: story),
                );
        },
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;
  final User currentUser;
  final Story story;
  const _StoryCard({
    Key? key,
    this.isAddStory = false,
    this.currentUser = const User(imageUrl: '', name: ''),
    this.story = const Story(
        imageUrl: '', user: User(imageUrl: '', name: ''), isViewed: false),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack();
  }
}
