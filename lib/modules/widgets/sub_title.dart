import 'package:flutter/material.dart';

import '../../shared/config/app_styles.dart';


class SubTitle extends StatelessWidget {

  final String title;
  // ignore: use_key_in_widget_constructors
  const SubTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(title,style: AppStyles.description,textAlign: TextAlign.center,);
  }

}