import 'package:flutter/material.dart';

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
        borderRadius: BorderRadius.circular(20),
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
              CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey[300],
                backgroundImage: NetworkImage(profileImageUrl),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          username,
                          style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.edit, size: 18),
                          onPressed: onEdit,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _StatItem(icon: Icons.person, label: "Follower", count: followers),
                        _StatItem(icon: Icons.person_add, label: "Following", count: following),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 35.0),
                          child: IconButton(
                            icon: const Icon(Icons.message, color: Colors.blue, size: 28),
                            onPressed: onMessage,
                          ),
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

class _StatItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int count;

  const _StatItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.count,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 22),
        const SizedBox(height: 4),
        Text("$count", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ],
    );
  }
}
