// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:facebook_ui/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';

class UserCard extends StatelessWidget {
  final User user;
  const UserCard({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print('User Profile clicked'),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileAvatar(imageUrl: user.imageUrl),
          const SizedBox(width: 6),
          Text(
            user.name,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
