import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/core/theme/app_colors.dart';
import '../../../domain/repository/nav_bar_item.dart';

class BottomNavigationbarItemWidget extends StatefulWidget {
  final BottomNavigatorBarItem bottomNavigatorBarItem;
  final Function (int index) onPress;
  int selectedIndex;
  BottomNavigationbarItemWidget({super.key, required this.bottomNavigatorBarItem, required this.selectedIndex, required this.onPress, });

  @override
  State<BottomNavigationbarItemWidget> createState() => _BottomNavigationbarItemWidgetState();
}

class _BottomNavigationbarItemWidgetState extends State<BottomNavigationbarItemWidget> {
  Color color = Colors.black;
  @override
  void initState() {
    if (widget.bottomNavigatorBarItem.index == widget.selectedIndex) {
      color = Colors.green;
    }
    else
    {
      color = AppColors.gold;
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          widget.bottomNavigatorBarItem.selected = !widget.bottomNavigatorBarItem.selected;
          if (widget.bottomNavigatorBarItem.index == widget.selectedIndex) {
            color = Colors.green;
          }
          else
            {
              color = AppColors.gold;
            }
          widget.onPress(widget.bottomNavigatorBarItem.index);
        }
        );
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
