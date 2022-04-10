import 'package:flutter/material.dart';
import 'package:social_media/shared/config/app_styles.dart';


class Header extends StatelessWidget {
  final String title;
  final Widget? skip;
  final bool showBack;
  final bool showSkip;

  // ignore: use_key_in_widget_constructors
  const Header(
      {this.title = "",
      this.showBack = true,
      this.showSkip = false,
      this.skip});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      height: 50,
      decoration: const BoxDecoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          showBack
              ? GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: Colors.white,
                  ),
                )
              : const Text(""),
          Text(title, style: AppStyles.hdr),
          showSkip ? skip! : const Text("")
          //const Text("Skip", style: AppStyles.paragraph1)
        ],
      ),
    );
  }
}
