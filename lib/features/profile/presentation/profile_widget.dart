import 'package:flutter/material.dart';
import 'package:seed_together/features/profile/presentation/profile_image.dart';
import 'package:seed_together/features/profile/presentation/username_widget.dart';
import 'package:seed_together/features/profile/presentation/edit_button.dart';
import 'package:seed_together/features/profile/presentation/follower_stat.dart';
import 'package:seed_together/features/profile/presentation/following_stat.dart';
import 'package:seed_together/features/profile/presentation/message_button.dart';

/// **ProfileWidget** - Kombiniert Profilbild, Name und Stats
class ProfileWidget extends StatelessWidget {
  final String username;
  final String profileImageUrl;
  final int followers;
  final int following;
  final VoidCallback onEdit;
  final VoidCallback onMessage;

  const ProfileWidget({
    Key? key,
    required this.username,
    required this.profileImageUrl,
    required this.followers,
    required this.following,
    required this.onEdit,
    required this.onMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12).copyWith(top: 50),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileImage(imageUrl: profileImageUrl),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UsernameWidget(username: username, onEdit: onEdit),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FollowerStat(count: followers),
                        FollowingStat(count: following),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 35.0),
                          child: MessageButton(onPressed: onMessage),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
