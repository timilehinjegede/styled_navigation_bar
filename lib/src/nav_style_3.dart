import 'package:flutter/material.dart';
import 'package:stylednavigationbar/src/config/size_config.dart';
import 'package:stylednavigationbar/src/extensions/size_extension.dart';

class BottomNavStyle3 extends StatefulWidget {
  const BottomNavStyle3({
    this.navbarHeight = 80,
    this.items,
    this.elevation = 0,
    this.currentIndex = 0,
    this.decoration = const BoxDecoration(
      color: Colors.white,
    ),
    this.onTap,
    this.duration = const Duration(
      milliseconds: 500,
    ),
    this.indicatorWidth = 40,
    this.indicatorHeight = 7,
    this.indicatorColor = Colors.grey,
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
  _BottomNavStyle3State createState() => _BottomNavStyle3State();
}

class _BottomNavStyle3State extends State<BottomNavStyle3> {
  Animation _animation;
  AnimationController _controller;

  double leftPosition;
  double newLeftPosition;

  // icon size
  double _iconSize = 24.0;
  // width of the screen
  var _screenWidth;
  // size of indicator
  double _indicatorSize = 40;

  @override
  void initState() {
    super.initState();
  }

  double screenWidth;

  double _getLeft(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    // space between the items
    double spaceBetween = screenWidth / widget.items.length;
    // space before the items
    double spaceBefore =
        spaceBetween / 2; // OR [(_screenWidth / _numOfItems) / 2]

    // calculate left position of indicator
    double _leftPosition = spaceBefore +
        (spaceBetween * widget.currentIndex) -
        (widget.indicatorWidth / 2);

    return _leftPosition;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig(context).init(context);
    screenWidth = MediaQuery.of(context).size.width;
    return Material(
      color: Colors.transparent,
      elevation: widget.elevation,
      child: Container(
        height: widget.navbarHeight,
        width: double.infinity,
        decoration: widget.decoration,
        child: Stack(
          children: <Widget>[
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: widget.items.map((item) {
                  var index = widget.items.indexOf(item);
                  return GestureDetector(
                    onTap: () => widget.onTap(index),
                    child: Style3ItemWidget(
                      duration: Duration(
                        milliseconds: 300,
                      ),
                      isSelected: index == widget.currentIndex,
                      item: item,
                    ),
                  );
                }).toList(),
              ),
            ),
            AnimatedPositioned(
              bottom: 1.5.height,
              left: _getLeft(context),
              duration: widget.duration,
              child: Container(
                width: widget.indicatorWidth,
                height: widget.indicatorHeight,
                decoration: BoxDecoration(
                  color: widget.indicatorColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Style3ItemWidget extends StatelessWidget {
  final Style3NavItem item;
  final bool isSelected;
  final Duration duration;
  final Color color;

  Style3ItemWidget({
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

class Style3NavItem {
  /// active icon of the [Style3NavItem]
  final Icon activeIcon;

  /// inactive icon of the [Style3NavItem]
  final Icon inactiveIcon;

  Style3NavItem({
    @required this.activeIcon,
    @required this.inactiveIcon,
  })  : assert(activeIcon != null),
        assert(inactiveIcon != null);
}
