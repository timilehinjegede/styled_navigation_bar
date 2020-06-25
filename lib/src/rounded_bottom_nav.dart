import 'package:flutter/material.dart';

/// ![A scaffold with a bottom navigation bar containing three bottom navigation
/// bar items. The first one is selected.]
/// ```dart
/// int _selectedIndex = 0;
/// static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
/// static const List<Widget> _widgetOptions = <Widget>[
///   Text(
///     'Index 0: Home',
///     style: optionStyle,
///   ),
///   Text(
///      'Index 1: Business',
///      style: optionStyle,
///   ),
///   Text(
///      'Index 2: School',
///      style: optionStyle,
///   ),
/// ];
///
/// void _onItemTapped(int index) {
///   setState(() {
///     _selectedIndex = index;
///   });
/// }
///
/// @override
/// Widget build(BuildContext context) {
///   return Scaffold(
///     appBar: AppBar(
///       title: const Text('RoundedBottomNavigationBar Sample'),
///     ),
///     body: Center(
///       child: _widgetOptions.elementAt(_selectedIndex),
///     ),
///     bottomNavigationBar: RoundedBottomNavigationBar(
///       items: const <RoundedBottomNavItem>[
///         RoundedBottomNavItem(
///           activeIcon: Icon(Icons.home, color: Colors.white),
///           inactiveIcon: Icon(Icons.dashboard, color: Colors.blue),
///         ),
///         RoundedBottomNavItem(
///           activeIcon: Icon(Icons.business, color: Colors.white),
///           inactiveIcon: Icon(Icons.business_center, color: Colors.blue),
///         ),
///         RoundedBottomNavItem(
///           activeIcon: Icon(Icons.school, color: Colors.white),
///           inactiveIcon: Icon(Icons.book, color: Colors.blue),
///         ),
///       ],
///        navBarDecoration: BoxDecoration(
///           color: Colors.white,
///           borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30),),
///        ),
///       currentIndex: _selectedIndex,
///       onTap: _onItemTapped,
///     ),
///   );
/// }
/// ```

class RoundedBottomNavigationBar extends StatefulWidget {
  /// creates a bottom navigation bar with an indicator which can be customized to be a circle or rectangle using the [navBarItemDecoration] property
  ///
  /// The length of [items] must be at least two and each item's active icon and inactive icon must not be null.
  ///
  ///
  /// The [elevation], [indicatorRadius] and [navBarHeight] arguments must be non-null and non-negative.
  ///
  RoundedBottomNavigationBar({
    this.navBarHeight = 80,
    @required this.items,
    this.currentIndex = 0,
    this.elevation = 8,
    this.indicatorRadius = 20,
    this.navBarDecoration = const BoxDecoration(
      color: Colors.white,
    ),
    this.navBarItemColor = Colors.blue,
    this.onTap,
    this.duration = const Duration(milliseconds: 300),
  })  : assert(items != null),
        assert(items.length >= 2),
        assert(
          items.every(
                  (RoundedBottomNavItem item) => (item.inactiveIcon) != null) ==
              true,
          'Every item must have a non-null inactive icon',
        ),
        assert(
          items.every(
                  (RoundedBottomNavItem item) => (item.activeIcon) != null) ==
              true,
          'Every item must have a non-null active icon',
        ),
        assert(0 <= currentIndex && currentIndex < items.length),
        assert(elevation != null || elevation >= 0.0),
        assert(
          indicatorRadius != null && indicatorRadius > 0.0,
          'Indicator radius must not be null and must be greater than zero',
        ),
        assert(
          navBarHeight != null && navBarHeight > 0.0,
          'The navigation bar height must not be null and must be greater than zero',
        );

  /// this is the height of the bottom navigation bar
  final double navBarHeight;

  /// Defines the appearance of the button items that are arrayed within the bottom navigation bar.
  final List<RoundedBottomNavItem> items;

  /// elevation of the bottom navigation bar, if not given, defaults to 8.0
  final double elevation;

  /// The index into [items] for the current active [RoundedBottomNavigationBar].
  final int currentIndex;

  /// decoration of the [RoundedBottomNavigationBar] bottom navigation bar item
  final Decoration navBarDecoration;

  /// color of the selected [RoundedBottomNavItem]  items in the [RoundedBottomNavigationBar]
  final Color navBarItemColor;

  /// radius of the bottom nav bar item indicator, if not given, defaults to `20.0`
  final double indicatorRadius;

  /// Called when one of the [items] is tapped.
  ///
  /// The stateful widget that creates the bottom navigation bar needs to keep
  /// track of the index of the selected [RoundedBottomNavItem] and call
  /// `setState` to rebuild the bottom navigation bar with the new [currentIndex].
  final ValueChanged<int> onTap;

  /// duration of the animation of the [RoundedBottomNavigationBar], if not given, defaults to `Duration(milliseconds: 300)`
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
      color: Colors.transparent,
      elevation: widget.elevation,
      child: Container(
        height: widget.navBarHeight,
        width: double.infinity,
        decoration: widget.navBarDecoration,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: widget.items.map((item) {
            var index = widget.items.indexOf(item);
            return GestureDetector(
              onTap: () => widget.onTap(index),
              child: ItemWidget(
                item: item,
                duration: widget.duration,
                radius: widget.indicatorRadius,
                color: widget.navBarItemColor,
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
  final Color color;

  ItemWidget({
    this.item,
    this.isSelected,
    this.duration,
    this.radius,
    this.color,
  })  : assert(item != null),
        assert(isSelected != null),
        assert(duration != null),
        assert(radius != null),
        assert(color != null);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: isSelected ? radius * 2 : (radius * 2) - 5,
      width: isSelected ? radius * 2 : (radius * 2) - 5,
      duration: duration,
      margin: EdgeInsets.symmetric(horizontal: isSelected ? 5 : 0),
      decoration: BoxDecoration(
        color: isSelected ? color : Colors.white,
        shape: BoxShape.circle,
      ),
      child: isSelected ? item.activeIcon : item.inactiveIcon,
    );
  }
}

class RoundedBottomNavItem {
  /// active icon of the [RoundedBottomNavItem]
  final Icon activeIcon;

  /// inactive icon of the [RoundedBottomNavItem]
  final Icon inactiveIcon;

  RoundedBottomNavItem({
    @required this.activeIcon,
    @required this.inactiveIcon,
  })  : assert(activeIcon != null),
        assert(inactiveIcon != null);
}
