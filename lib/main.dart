import 'package:flutter/material.dart';
import 'assignment1/profile_card_screen.dart';
import 'assignment2/home_screen.dart';
import 'assignment3/login_screen.dart';
import 'assignment4/todo_list_screen.dart';
import 'assignment5/user_list_screen.dart';
import 'assignment6/responsive_grid_screen.dart';
import 'assignment7/todo_list_screen.dart';

void main() => runApp(const AssignmentsApp());

/// Root app that provides navigation to all assignments.
class AssignmentsApp extends StatelessWidget {
  const AssignmentsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Assignments',
      theme: ThemeData(
        colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

/// Main menu screen listing all assignments.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Assignments')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfileCardScreen()),
              );
            },
            child: const Text('Assignment 1 - Profile Card'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Assignment2HomeScreen()),
              );
            },
            child: const Text('Assignment 2 - Data Passing'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LoginScreen()),
              );
            },
            child: const Text('Assignment 3 - Login Form'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const TodoListScreen()),
              );
            },
            child: const Text('Assignment 4 - To-Do List'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const UserListScreen()),
              );
            },
            child: const Text('Assignment 5 - Users'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ResponsiveGridScreen()),
              );
            },
            child: const Text('Assignment 6 - Responsive Grid'),
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => const TodoListProviderScreen()),
              );
            },
            child: const Text('Assignment 7 - To-Do with Provider'),
            
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const DWLoginScreen()),
              );
            },
            child: const Text('DailyWellness App'),
          ),
        ],
      ),
    );
  }
}
