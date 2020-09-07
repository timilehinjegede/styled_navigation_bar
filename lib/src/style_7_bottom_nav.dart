import 'package:flutter/material.dart';

class Style7BottomNav extends StatefulWidget {

  final int currentIndex;
  final List<Style7Item> items;
  final ValueChanged onTap;
  final Color indicatorCOlor;

  const Style7BottomNav({Key key, this.currentIndex, this.items, this.onTap, this.indicatorCOlor}) : super(key: key);
  
  @override
  _Style7BottomNavState createState() => _Style7BottomNavState();
}

class _Style7BottomNavState extends State<Style7BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 8,
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                20.0,
              ),
              topRight: Radius.circular(
                20.0,
              ),
            )),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: widget.items.map((item) {
              var index = widget.items.indexOf(item);
              return GestureDetector(
                onTap: () => widget.onTap(index),
                child: _Style7ItemWidget(
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

class _Style7ItemWidget extends StatefulWidget {

  final Style7Item item;
  final bool isSelected;

  const _Style7ItemWidget({Key key, this.item, this.isSelected}) : super(key: key);

  @override
  _Style7ItemWidgetState createState() => _Style7ItemWidgetState();
}

class _Style7ItemWidgetState extends State<_Style7ItemWidget> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return  AnimatedContainer(
      height: 40,
      duration: Duration(
        milliseconds: 400,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        color: widget.isSelected ? Colors.green : Colors.transparent,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
      ),
      child: Row(
        children: [
          widget.item.icon,
          widget.isSelected
              ? SizedBox(
                  width: 10,
                )
              : SizedBox.shrink(),
          AnimatedSize(
            duration: Duration(
              milliseconds: 400,
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

class Style7Item {
  final Icon icon;
  final Text text;

  Style7Item({this.icon, this.text});

}