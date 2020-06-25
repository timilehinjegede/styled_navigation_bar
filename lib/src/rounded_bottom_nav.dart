import 'package:flutter/material.dart';

class RoundedBottomNavigationBar extends StatefulWidget {
  RoundedBottomNavigationBar({
    this.navBarHeight = 80,
    @required this.items,
    this.currentIndex = 0,
    this.elevation = 8,
    this.radius,
    this.shape,
    this.navBarDecoration,
    this.navItemDecoration,
    this.onTap,
    this.duration,
  });

  /// this is the height of the bottom navigation bar
  final double navBarHeight;

  /// Defines the appearance of the button items that are arrayed within the
  /// bottom navigation bar.
  final List<RoundedBottomNavItem> items;

  /// elevation, if null, defaults to 8.0
  final double elevation;

  /// The index into [items] for the current active [BottomNavigationBarItem].
  final int currentIndex;

  /// background color of the bottom nav bar

  /// decoration of the bottom navigation bar item
  final Decoration navBarDecoration;
  final Decoration navItemDecoration;

  /// radius of the bottom nav bar item. if [shape] is given, [radius] must not be given
  final double radius;

  /// shape of the bottom nav bar item. if [radius] is given, [shape] must not be given
  final BoxShape shape;

  /// Called when one of the [items] is tapped.
  ///
  /// The stateful widget that creates the bottom navigation bar needs to keep
  /// track of the index of the selected [BottomNavigationBarItem] and call
  /// `setState` to rebuild the bottom navigation bar with the new [currentIndex].
  final ValueChanged<int> onTap;

  /// duration of the animation
  final Duration duration;

  @override
  _RoundedBottomNavigationBarState createState() =>
      _RoundedBottomNavigationBarState();
}

class _RoundedBottomNavigationBarState
    extends State<RoundedBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: widget.elevation,
      child: Container(
        height: widget.navBarHeight,
        width: double.infinity,
        decoration: widget.navBarDecoration,
        child: Row(
          children: widget.items.map((item) {
            var index = widget.items.indexOf(item);
            return GestureDetector(
              onTap: () => widget.onTap(index),
              child: ItemWidget(
                item: item,
                duration: widget.duration,
                radius: widget.radius,
                shape: widget.shape,
                decoration: widget.navItemDecoration,
                isSelected: index == widget.currentIndex,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final RoundedBottomNavItem item;
  final bool isSelected;
  final Duration duration;
  final double radius;
  final BoxShape shape;
  final Decoration decoration;

  ItemWidget(
      {this.item,
      this.isSelected,
      this.duration,
      this.radius,
      this.shape,
      this.decoration});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: isSelected ? radius * 2 : (radius * 2) - 5,
      width: isSelected ? radius * 2 : (radius * 2) - 5,
      duration: duration,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(horizontal: isSelected ? 5 : 0),
      decoration: decoration,
      child: isSelected ? item.activeIcon : item.inactiveIcon,
    );
  }
}

class RoundedBottomNavItem {
  /// active icon of the bottom navigation bar item
  final Icon activeIcon;

  /// inactive icon of the bottom navigation bar item
  final Icon inactiveIcon;

  RoundedBottomNavItem({@required this.activeIcon, @required this.inactiveIcon})
      : assert(activeIcon != null),
        assert(inactiveIcon != null);
}
