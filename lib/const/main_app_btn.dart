
import 'package:flutter/material.dart';

class MainAppBtn extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final Color btnColor;
  final EdgeInsetsGeometry? padding;

  const MainAppBtn({super.key, required this.title,
    required this.titleStyle, required this.btnColor, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color:btnColor,
        borderRadius: BorderRadius.all(Radius.circular(4))
      ),
      child: Padding(
        padding: padding??EdgeInsets.all(0),
        child: Text(this.title,style:titleStyle??TextStyle(fontSize: 8,fontWeight: FontWeight.w500),),
      ),
    );
  }

}
