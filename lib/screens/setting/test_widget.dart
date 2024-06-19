import 'package:flutter/material.dart';

class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<TestWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
          onPressed: () async {
            
          },
          child: Text('signIn'),
        ),
        OutlinedButton(
          onPressed: () async {
            
          },
          child: Text('getProfile'),
        )
      ],
    );
  }
}