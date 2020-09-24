import 'package:flutter/material.dart';

class DotWidget extends StatelessWidget {
  final double width;

  const DotWidget({Key key, this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: width,
      decoration: BoxDecoration(
        color: Color(0xFFBB6BD9),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
