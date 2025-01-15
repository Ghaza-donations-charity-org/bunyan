import 'package:flutter/material.dart';
class ListTileWidget extends StatelessWidget {
  final EdgeInsets? contentPadding;
  final String title;
  final String? subtitle;
  final Function()? onTap;
  final Widget? leading;
  final Widget? trailing;
  const ListTileWidget({super.key, this.contentPadding, required this.title, this.subtitle, this.onTap, this.leading, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), child:ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: contentPadding?? const EdgeInsets.symmetric(horizontal: 20),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      leading: leading,
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios),
      onTap: () {
       onTap?.call();
      },),
    );
  }
}
