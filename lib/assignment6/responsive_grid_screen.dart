import 'package:flutter/material.dart';

/// Assignment 6 - Displays a responsive grid that adapts to orientation.
class ResponsiveGridScreen extends StatelessWidget {
  const ResponsiveGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Assignment 6 - Grid')),
      body: OrientationBuilder(
        builder: (context, orientation) {
          final width = MediaQuery.of(context).size.width;
          final crossAxisCount = orientation == Orientation.portrait
              ? (width ~/ 200).clamp(2, 3)
              : (width ~/ 200).clamp(3, 6);
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 3 / 4,
            ),
            itemCount: _items.length,
            itemBuilder: (context, index) => _GridItem(_items[index]),
          );
        },
      ),
    );
  }
}

class _GridItem extends StatelessWidget {
  const _GridItem(this.data);

  final _GridItemData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: data.color,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(data.icon, size: 40, color: Colors.white),
          const SizedBox(height: 12),
          Text(
            data.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            data.description,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _GridItemData {
  const _GridItemData(this.icon, this.title, this.description, this.color);

  final IconData icon;
  final String title;
  final String description;
  final Color color;
}

const List<_GridItemData> _items = [
  _GridItemData(Icons.phone, 'Phone', 'Make calls', Colors.blue),
  _GridItemData(Icons.message, 'Messages', 'Chat with friends', Colors.deepPurple),
  _GridItemData(Icons.map, 'Maps', 'Find locations', Colors.teal),
  _GridItemData(Icons.camera_alt, 'Camera', 'Take photos', Colors.indigo),
  _GridItemData(Icons.music_note, 'Music', 'Listen to songs', Colors.pink),
  _GridItemData(Icons.shopping_cart, 'Shop', 'Buy products', Colors.orange),
  _GridItemData(Icons.calendar_today, 'Calendar', 'Plan events', Colors.green),
  _GridItemData(Icons.settings, 'Settings', 'Configure app', Colors.red),
];
