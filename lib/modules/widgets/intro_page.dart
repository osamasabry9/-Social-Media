import 'package:flutter/material.dart';
import 'package:social_media/modules/widgets/main_title.dart';
import 'package:social_media/modules/widgets/sub_title.dart';




class IntroPage extends StatelessWidget {
  final String image;
  final String headline;
  final String description;

  // ignore: use_key_in_widget_constructors
  const IntroPage({required this.image,required this.headline,required this.description});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Center(
          child: SingleChildScrollView(
        child: Column(
          children: [
              Image.asset(image,width:size.width * 0.7 ,),
            const SizedBox(height: 40),
            MainTitle(headline),
            const SizedBox(height: 15),
            SubTitle(description),
          ],
        ),
      )),
    );
  }
}
