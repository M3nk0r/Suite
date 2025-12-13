import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final double size;
  final Widget icon;
  final Widget text;
  final Color? containerColor;
  final Function()? onTap;
  const CircleButton({super.key, required this.size, required this.icon, required this.text, this.onTap, this.containerColor});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox.fromSize(
      size: Size(size, size), // button width and height
      child: ClipOval(
        child: Material(
          shape: const CircleBorder(),
          shadowColor: theme.shadowColor,
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          color: containerColor,
          child: InkWell(
            onTap: onTap, // button pressed
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                icon,
                text
              ],
            ),
          ),
        ),
      ),
    );
  }
}
