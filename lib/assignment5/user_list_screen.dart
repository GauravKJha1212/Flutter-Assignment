import 'package:flutter/material.dart';

import 'user_model.dart';
import 'user_service.dart';

/// Assignment 5 - Fetches a list of users from a mock API and displays them.
class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late final Future<List<User>> _usersFuture;
  final UserService _service = UserService();

  @override
  void initState() {
    super.initState();
    _usersFuture = _service.fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Assignment 5 - Users')),
      body: FutureBuilder<List<User>>(
        future: _usersFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No users found.'));
          }

          final users = snapshot.data!;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.image),
                  onBackgroundImageError: (_, __) {},
                  child: user.image.isEmpty
                      ? const Icon(Icons.person)
                      : null,
                ),
                title: Text(user.fullName),
                subtitle: Text(user.email),
              );
            },
          );
        },
      ),
    );
  }
}

