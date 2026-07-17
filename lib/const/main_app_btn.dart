
import 'package:flutter/material.dart';
import 'package:scraapy_pro/const/app_colors.dart';

class MainAppBtn extends StatelessWidget {
  final String title;
  final TextStyle? titleStyle;
  final Color? btnColor;
  final double? width;
  final bool? haveGradient;
  final EdgeInsetsGeometry? padding;
  final BoxBorder? border;
  final void Function()? onTap;

  const MainAppBtn({super.key, required this.title,
     this.titleStyle,  this.btnColor, this.padding, this.width, this.onTap, this.haveGradient = true, this.border});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 46,
        width: width,
        decoration: BoxDecoration(
          color:btnColor?? AppColors.primary,
            gradient: haveGradient == true ?LinearGradient(
              colors: [
                AppColors.primary,
                AppColors.terquaz,
                // end color
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ):null,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          border: border
        ),
        child: Padding(
          padding: padding??EdgeInsets.all(0),
          child: Center(child: Text(this.title,style:titleStyle??TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.white),)),
        ),
      ),
    );
  }

}
