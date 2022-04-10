import 'package:flutter/material.dart';

import '../../shared/config/app_colors.dart';
import '../../shared/config/app_styles.dart';

class MainButton extends StatelessWidget {
  final String title;
  final Color color;
  final bool isLoding;
  final IconData? icon;
  final void Function()? onTap;

  // ignore: use_key_in_widget_constructors
  const MainButton({this.title = "", this.color = AppColors.MAIN, this.onTap, this.icon, this.isLoding = false});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 50,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(15)),
        child: isLoding ? const CircularProgressIndicator() :  Text(
          title,
          style: AppStyles.paragraph1,
        ),
      ),
    );
  }
}
