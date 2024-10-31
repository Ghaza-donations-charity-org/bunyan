import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../domain/repository/nav_bar_item.dart';

class BottomNavigationbarItemWidget extends StatefulWidget {
  final BottomNavigatorBarItem bottomNavigatorBarItem;
  const BottomNavigationbarItemWidget({super.key, required this.bottomNavigatorBarItem});

  @override
  State<BottomNavigationbarItemWidget> createState() => _BottomNavigationbarItemWidgetState();
}

class _BottomNavigationbarItemWidgetState extends State<BottomNavigationbarItemWidget> {
  Color color = Colors.black;
  @override
  void initState() {
    if (widget.bottomNavigatorBarItem.selected == true) {
      color = Colors.green;
    }
    else
    {
      color = Colors.black;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          widget.bottomNavigatorBarItem.selected = !widget.bottomNavigatorBarItem.selected;
          if (widget.bottomNavigatorBarItem.selected == true) {
            color = Colors.green;
          }
          else
            {
              color = Colors.black;
            }
        });
      },
      child: Container(
        child: Column(
          children: [
            Icon(widget.bottomNavigatorBarItem.icon, color: color,),
            Text(widget.bottomNavigatorBarItem.title, style: TextStyle(color : color),),
          ],
        ),
      ),
    );
  }
}
