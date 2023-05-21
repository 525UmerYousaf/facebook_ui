// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:facebook_ui/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

import '../models/post_model.dart';

class PostContainer extends StatelessWidget {
  final Post post;
  const PostContainer({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.white,
      child: Column(
        //  With following property Column is stretched to
        //  all the width of the Container.
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _PostHeader(post: post),
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;
  const _PostHeader({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(imageUrl: post.user.imageUrl),
        const SizedBox(width: 8),
        Column(
          children: [
            Text(post.user.name),
            Row(
              children: [
                Text('${post.timeAgo}'),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
