import 'package:flutter/material.dart';

/// Screen displaying a profile card with an image, name and description.
class ProfileCardScreen extends StatelessWidget {
  const ProfileCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: const Center(
        child: ProfileCard(
          name: 'Gaurav Kumar Jha',
          description:
              'QA Engineer • Software & Mobile Testing • API & Performance '
              'Testing (K6) • SDLC | Agile | Jira | eCommerce & Media domains',
          imagePath: 'assets/images/profile_picture.png',
        ),
      ),
    );
  }
}

/// Reusable card widget with internal "Follow" state.
class ProfileCard extends StatefulWidget {
  const ProfileCard({
    super.key,
    required this.name,
    required this.description,
    required this.imagePath,
  });

  final String name;
  final String description;
  final String imagePath;

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  bool _isFollowing = false;

  void _toggleFollow() => setState(() => _isFollowing = !_isFollowing);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 48,
              backgroundImage: AssetImage(widget.imagePath),
            ),
            const SizedBox(height: 16),
            Text(
              widget.name,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),
            FilledButton(
              onPressed: _toggleFollow,
              child: Text(_isFollowing ? 'Following' : 'Follow'),
            ),
          ],
        ),
      ),
    );
  }
}
