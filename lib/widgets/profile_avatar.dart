// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui/config/palette.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;
  const ProfileAvatar({
    Key? key,
    required this.imageUrl,
    this.isActive = false,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          //  This "CircleAvatar" is used to show blue border
          //  inside my profile circle avatar on story.
          radius: 20,
          backgroundColor: Palette.facebookBlue,
          child: CircleAvatar(
            //  Below check work in such a way that if "ProfileAvatar" is
            //  not inside Story then the size of Profile circle is equal
            //  to border circle size so border blue hides on screen.
            radius: hasBorder ? 17 : 20,
            backgroundColor: Colors.grey[200],
            backgroundImage: CachedNetworkImageProvider(imageUrl),
          ),
        ),
        isActive
            ? Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: Palette.online,
                    shape: BoxShape.circle,
                    border: Border.all(width: 2, color: Colors.white),
                  ),
                ),
              )
            : const SizedBox.shrink(),
        //  Above property means that if isActive is false then I'm returning
        //  a SizedBox whose size is shrunk so it will not appear on screen.
      ],
    );
  }
}
