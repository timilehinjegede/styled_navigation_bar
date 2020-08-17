import 'dart:async';

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
    this.indicatorColor = Colors.white,
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
  MediaQueryData _mediaQueryData;

  @override
  void initState() {
    super.initState();
  }

  // double screenWidth;

  double _getLeft(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    double screenWidth = _mediaQueryData.size.width;

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
    // SizeConfig(context).init(context);
    _mediaQueryData = MediaQuery.of(context);

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
                    child: Style5ItemWidget(
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
              curve: Curves.easeInOutBack,
              bottom: 0,
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

class Style5ItemWidget extends StatefulWidget {
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
  _Style5ItemWidgetState createState() => _Style5ItemWidgetState();
}

class _Style5ItemWidgetState extends State<Style5ItemWidget>
    with TickerProviderStateMixin {
  Animation<double> iconAnimation;
  Animation<double> titleAnimation;

  AnimationController iconController;
  AnimationController titleController;

  Tween<double> iconTween = Tween(begin: 0, end: -70);
  Tween<double> titleTween = Tween();

  bool selected;

  @override
  void initState() {
    super.initState();
    iconController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    // titleController = AnimationController(
    //   vsync: this,
    //   duration: Duration(milliseconds: 300),
    // );

    final Animation iconCurve =
        CurvedAnimation(parent: iconController, curve: Curves.elasticInOut);

    iconAnimation = iconTween.animate(iconCurve);

    // titleAnimation = titleTween.animate(titleController);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isSelected) {
      iconController.forward();
    } else {
      iconController.reverse();
    }
    return Container(
      height: 300,
      width: 60,
      child: AnimatedBuilder(
        animation: iconAnimation,
        builder: (context, snapshot) {
          return Transform.translate(
            offset: Offset(0, iconAnimation.value),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    child: widget.isSelected
                        ? widget.item.activeIcon
                        : widget.item.inactiveIcon,
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, 40),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: widget.item.title,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Style5NavItem {
  /// active icon of the [Style5NavItem]
  final Icon activeIcon;

  /// inactive icon of the [Style5NavItem]
  final Icon inactiveIcon;

  /// title of the [style5NavItem]
  final Text title;

  Style5NavItem({
    @required this.activeIcon,
    @required this.inactiveIcon,
    @required this.title,
  })  : assert(activeIcon != null),
        assert(inactiveIcon != null),
        assert(title != null);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Style5NavItem &&
        o.activeIcon == activeIcon &&
        o.inactiveIcon == inactiveIcon &&
        o.title == title;
  }

  @override
  int get hashCode {
    return activeIcon.hashCode ^ inactiveIcon.hashCode ^ title.hashCode;
  }
}
