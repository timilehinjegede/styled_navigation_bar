import 'package:flutter/material.dart';
import 'package:stylednavigationbar/src/config/size_config.dart';
import 'package:stylednavigationbar/src/extensions/size_extension.dart';

class BottomNavStyle5 extends StatefulWidget {
  const BottomNavStyle5({
    this.navbarHeight = 80,
    this.items,
    this.elevation = 0,
    this.currentIndex = 0,
    this.decoration = const BoxDecoration(
      color: Colors.blue,
    ),
    this.onTap,
    this.duration = const Duration(
      milliseconds: 500,
    ),
    this.indicatorWidth = 40,
    this.indicatorHeight = 7,
    this.indicatorColor = Colors.black,
  });

  final double navbarHeight;
  final double indicatorWidth;
  final double indicatorHeight;
  final List items;
  final double elevation;
  final int currentIndex;
  final Decoration decoration;
  final ValueChanged<int> onTap;
  final Duration duration;
  final Color indicatorColor;

  @override
  _BottomNavStyle5State createState() => _BottomNavStyle5State();
}

class _BottomNavStyle5State extends State<BottomNavStyle5> {
  Animation _animation;
  AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Material(
      color: Colors.transparent,
      elevation: widget.elevation,
      child: CustomPaint(
        painter: BarPainter(),
      ),
    );
  }
}

class BarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class Style5ItemWidget extends StatelessWidget {
  final Style5NavItem item;
  final bool isSelected;
  final Duration duration;
  final Color color;

  Style5ItemWidget({
    this.item,
    this.isSelected,
    this.duration,
    this.color,
  })  : assert(item != null),
        assert(isSelected != null),
        assert(duration != null);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 30,
      width: 30,
      duration: duration,
      // margin: EdgeInsets.symmetric(horizontal: isSelected ? 5 : 0),
      child: isSelected ? item.activeIcon : item.inactiveIcon,
    );
  }
}

class Style5NavItem {
  /// active icon of the [Style5NavItem]
  final Icon activeIcon;

  /// inactive icon of the [Style5NavItem]
  final Icon inactiveIcon;

  Style5NavItem({
    @required this.activeIcon,
    @required this.inactiveIcon,
  })  : assert(activeIcon != null),
        assert(inactiveIcon != null);
}
