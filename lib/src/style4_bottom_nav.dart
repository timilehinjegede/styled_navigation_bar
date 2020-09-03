import 'package:flutter/material.dart';

class Style4BottomNav extends StatefulWidget {
  final int currentIndex;
  final List<Style4Item> items;
  final ValueChanged onTap;
  final bool switchItems;
  final bool iconFirst;

  Style4BottomNav({
    this.currentIndex,
    this.items,
    this.onTap,
    this.iconFirst = true,
    this.switchItems = false,
  });

  @override
  _Style4BottomNavState createState() => _Style4BottomNavState();
}

class _Style4BottomNavState extends State<Style4BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 8,
      child: Container(
        height: 80,
        color: Colors.white,
        width: double.infinity,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: widget.items.map((item) {
              var index = widget.items.indexOf(item);
              return GestureDetector(
                onTap: () => widget.onTap(index),
                child: _ItemWidget(
                  item: item,
                  isSelected: index == widget.currentIndex,
                  iconFirst: widget.iconFirst,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final Style4Item item;
  final bool isSelected;
  final Duration duration;
  final bool iconFirst;

  _ItemWidget({this.isSelected, this.duration, this.item,this.iconFirst});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
                 (item.activeIcon == null && item.activeIcon == null )? item.text : item.text == null ? (isSelected  ? item.activeIcon : item.inactiveIcon) : AnimatedSwitcher(
                    duration: Duration(milliseconds: 300,),
                    transitionBuilder: (child, animation){
                      return ScaleTransition(child: child, scale: animation);
                    },
                    child: iconFirst ? isSelected ? item.activeIcon : item.text : isSelected ? item.text : item.activeIcon,
                  ),
        SizedBox(height: 2),
        isSelected
            ? Container(
                height: 5,
                width: 5,
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              )
            : SizedBox.shrink()
      ],
    );
  }
}

class Style4Item {
  final Icon activeIcon;
  final Icon inactiveIcon;
  final Text text;

  Style4Item({this.activeIcon, this.inactiveIcon, this.text});
}
