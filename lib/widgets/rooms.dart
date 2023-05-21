// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;
  const Rooms({
    Key? key,
    required this.onlineUsers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        scrollDirection: Axis.horizontal,
        itemCount: 1 + onlineUsers.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: _CreateRoomButton(),
            );
          }
          //  With below line of code i'm neglecting the zero index
          //  widget bcz at first place the "Create Room" button is present.
          final User user = onlineUsers[index - 1];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ProfileAvatar(
              imageUrl: user.imageUrl,
              isActive: true,
            ),
          );
        },
      ),
    );
  }
}

class _CreateRoomButton extends StatelessWidget {
  const _CreateRoomButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => print('Create Room'),
      style: ElevatedButton.styleFrom(
        foregroundColor: Palette.facebookBlue,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        side: BorderSide(
          width: 3,
          color: Colors.blueAccent[100]!,
        ),
      ),
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (rect) =>
                Palette.createRoomGradient.createShader(rect),
            child: const Icon(Icons.video_call, size: 35, color: Colors.white),
          ),
          const SizedBox(width: 4),
          const Text('Create\nRoom'),
        ],
      ),
    );
  }
}
