import 'package:flutter/material.dart';

class AppChoice extends StatefulWidget {
  final Widget image;
  const AppChoice({Key? key, required this.image}) : super(key: key);

  @override
  State<AppChoice> createState() => _AppChoiceState();
}

class _AppChoiceState extends State<AppChoice> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Escolha do App:",
            style: TextStyle(color: Colors.black87, fontSize: 25),
          ),
        ),
        widget.image
      ],
    );
  }
}
