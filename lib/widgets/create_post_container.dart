// ignore_for_file: sized_box_for_whitespace, avoid_print
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';
import 'widgets.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;
  const CreatePostContainer({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl: currentUser.imageUrl),
              const SizedBox(width: 8),
              const Expanded(
                //  Reason for wraping my TextField inside Expanded widget
                //  is bcz without it my TextField does not know how much
                //  space it can occupy, with this Field would take all
                //  the available space.
                child: TextField(
                  //  Reason for using ".collapsed" is bcz I want to remove
                  //  the line underneath of the TextField.
                  decoration: InputDecoration.collapsed(
                    hintText: 'What\'s on your mind?',
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 10, thickness: 0.5),
          Container(
            height: 40,
            //  Reason for wrapping "Row" widget inside Container
            //  is bcz my "TextButton" are taking un-necessary
            //  space which I want to avoid therefore I do this.
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () => print('Live'),
                  icon: const Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  label: const Text('Live'),
                ),
                const VerticalDivider(width: 8),
                TextButton.icon(
                  onPressed: () => print('Photo'),
                  icon: const Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  label: const Text('Photo'),
                ),
                const VerticalDivider(width: 8),
                TextButton.icon(
                  onPressed: () => print('Room'),
                  icon: const Icon(
                    Icons.video_call,
                    color: Colors.purpleAccent,
                  ),
                  label: const Text('Room'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
