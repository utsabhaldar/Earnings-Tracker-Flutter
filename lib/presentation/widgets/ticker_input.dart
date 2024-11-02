import 'package:flutter/material.dart';

class TickerInput extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;

  TickerInput({required this.controller, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: InputDecoration(labelText: 'Enter ticker symbol'),
          ),
        ),
        IconButton(
          icon: Icon(Icons.search),
          onPressed: onSearch,
        ),
      ],
    );
  }
}
