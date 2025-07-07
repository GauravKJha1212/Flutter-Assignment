import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/activity_provider.dart';
import '../services/quote_service.dart';
import 'add_activity_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.userEmail});

  final String userEmail;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String? _quote;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadQuote();
  }

  Future<void> _loadQuote() async {
    try {
      _quote = await QuoteService().fetchQuote();
    } catch (_) {
      _quote = 'Failed to load quote';
    }
    if (mounted) {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final activities = context.watch<ActivityProvider>().activities;
    final now = DateTime.now();
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello, ${widget.userEmail}',
                style: Theme.of(context).textTheme.headlineSmall),
            Text('${now.toLocal()}'),
            const SizedBox(height: 16),
            _loading
                ? const CircularProgressIndicator()
                : Text(_quote ?? ''),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  final act = activities[index];
                  return ListTile(
                    title: Text(act.name),
                    subtitle: act.notes != null ? Text(act.notes!) : null,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const AddActivityScreen()),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}
