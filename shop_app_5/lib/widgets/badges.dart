import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Badges extends StatelessWidget {
  // const Badges({ Key? key }) : super(key: key);

  final Widget child;
  final String value;
  final Color color;

  Badges({required this.child, required this.color, required this.value});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        Positioned(
          top: 8,
          right: 8,
          child: Container(
            padding: EdgeInsets.all(2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10,
              ),
              color: color,
            ),
            constraints: BoxConstraints(minHeight: 16, minWidth: 16),
            child: Text(
              value,
              style: TextStyle(fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
