import 'package:flutter/material.dart';

class Style2BottomNav extends StatefulWidget {
  final int currentIndex;
  final List<Style2Item> items;
  final ValueChanged onTap;
  final Color indicatorColor;

  Style2BottomNav({
    this.currentIndex,
    this.items,
    this.onTap,
    this.indicatorColor,
  });

  @override
  _Style2BottomNavState createState() => _Style2BottomNavState();
}

class _Style2BottomNavState extends State<Style2BottomNav> {
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
                child: _Style2ItemWidget(
                  item: item,
                  isSelected: index == widget.currentIndex,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _Style2ItemWidget extends StatefulWidget {
  final Style2Item item;
  final bool isSelected;

  _Style2ItemWidget({this.item, this.isSelected});

  @override
  __Style2ItemWidgetState createState() => __Style2ItemWidgetState();
}

class __Style2ItemWidgetState extends State<_Style2ItemWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 40,
      duration: Duration(
        milliseconds: 400,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          8.0,
        ),
        color: widget.isSelected ? Colors.blue : Colors.transparent,
      ),
      child: Row(
        children: [
          widget.item.icon,
          SizedBox(
            width: 10,
          ),
          AnimatedSize(
            duration: Duration(
              milliseconds: 500,
            ),
            curve: Curves.easeInOut,
            vsync: this,
            child: widget.isSelected ? widget.item.text : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class Style2Item {
  final Icon icon;
  final Text text;

  Style2Item({this.icon, this.text});
}
