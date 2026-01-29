import 'package:flutter/material.dart';

class ExampleFeatureWidget extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const ExampleFeatureWidget({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
