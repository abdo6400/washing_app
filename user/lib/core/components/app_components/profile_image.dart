import 'package:avatar_glow/avatar_glow.dart';
import 'package:car_washing/core/utils/app_values.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String imageUrl;
  final double radius;
  final double elevation;
  const ProfileImage(
      {super.key,
      required this.imageUrl,
      required this.radius,
      this.elevation = 0});

  @override
  Widget build(BuildContext context) {
    return AvatarGlow(
      glowCount: 1,
      child: Material(
        elevation: elevation,
        shape: const CircleBorder(),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: AppValues.radius * radius,
          backgroundImage: NetworkImage(
            imageUrl,
          ),
        ),
      ),
    );
  }
}
