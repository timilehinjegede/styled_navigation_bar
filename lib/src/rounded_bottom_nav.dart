import 'package:flutter/material.dart';

class RoundedBottomNavigationBar extends StatefulWidget {
  RoundedBottomNavigationBar(
      {this.iconData,
      this.decoration,
      this.duration,
      this.iconSize,
      this.currentIndex,
      this.itemHeight,
      this.borderRadius,
      this.onTap
      });

  final IconData iconData;
  final Duration duration;
  final int currentIndex;
  final double iconSize;
  final Decoration decoration;
  final double borderRadius;
  final double itemHeight;
  final VoidCallback onTap;

  @override
  _RoundedBottomNavigationBarState createState() =>
      _RoundedBottomNavigationBarState();
}

class _RoundedBottomNavigationBarState
    extends State<RoundedBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: <Widget>[
          InkResponse(
            onTap: widget.onTap,
            child: AnimatedContainer(
              duration: widget.duration,
              height: widget.itemHeight,
              width: widget.itemHeight,
            ),
          ),
        ],
      ),
    );
  }
}
