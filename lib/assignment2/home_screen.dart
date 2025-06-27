import 'package:flutter/material.dart';
import 'details_screen.dart';

class Assignment2HomeScreen extends StatefulWidget {
  const Assignment2HomeScreen({super.key});

  @override
  State<Assignment2HomeScreen> createState() => _Assignment2HomeScreenState();
}

class _Assignment2HomeScreenState extends State<Assignment2HomeScreen> {
  final TextEditingController _controller = TextEditingController();
  String _returnedData = '';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _openDetails() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(initialData: _controller.text),
      ),
    );
    if (result != null && result is String) {
      setState(() => _returnedData = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Assignment 2 - Home')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Enter data to send'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _openDetails,
              child: const Text('Go to Details'),
            ),
            const SizedBox(height: 16),
            Text('Returned: ' + _returnedData),
          ],
        ),
      ),
    );
  }
}

