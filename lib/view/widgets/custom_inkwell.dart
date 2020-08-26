import 'package:flutter/material.dart';

class CustomInkwell extends StatelessWidget {
  final double radius;
  final Function onTap;
  final Widget child;

  const CustomInkwell({
    Key key,
    this.radius = 0.0,
    @required this.onTap,
    @required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
