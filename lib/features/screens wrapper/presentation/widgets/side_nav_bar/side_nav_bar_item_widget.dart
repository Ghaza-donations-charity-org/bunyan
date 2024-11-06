import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghaza_donations_app/core/theme/app_colors.dart';
import '../../../domain/repository/nav_bar_item.dart';

class SideNavigatorBarItemWidget extends StatefulWidget {
  final BottomNavigatorBarItem bottomNavigatorBarItem;
  const SideNavigatorBarItemWidget({super.key, required this.bottomNavigatorBarItem});

  @override
  State<SideNavigatorBarItemWidget> createState() => _SideNavigatorBarItemWidgetState();
}

class _SideNavigatorBarItemWidgetState extends State<SideNavigatorBarItemWidget> {
  Color color = Colors.black;
  @override
  void initState() {
    if (widget.bottomNavigatorBarItem.selected == true) {
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
          if (widget.bottomNavigatorBarItem.selected == true) {
            color = Colors.green;
          }
          else
          {
            color = AppColors.gold;
          }
        });
      },
      child: Container(
        child: Row(
          children: [
            Icon(widget.bottomNavigatorBarItem.icon, color: color,),
            SizedBox(width: 10,),
            MediaQuery.of(context).size.width> 800 ?
            Text(widget.bottomNavigatorBarItem.title, style: TextStyle(color : color),)
            : Container()
          ],
        ),
      ),
    );
  }
}
