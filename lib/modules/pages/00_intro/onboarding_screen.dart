import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social_media/modules/pages/01_account/login_screen.dart';
import 'package:social_media/shared/components/componets.dart';
import 'package:social_media/shared/config/app_colors.dart';
import 'package:social_media/shared/config/app_data.dart';
import 'package:social_media/shared/network/local/cache_helper.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController onboardController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 35,
        actions: [
          TextButton(
              onPressed: () {
                CacheHelper.saveData(key: 'ShowOnBoard', value: false)
                    .then((value) {
                  if (value) navigateAndFinish(context, const LoginPage());
                });
              },
              child: const Text(
                'Skip',
                style: TextStyle(letterSpacing: 1),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                controller: onboardController,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => AppData.introPages[index],
                onPageChanged: (index) {
                  if (index == AppData.introPages.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemCount: AppData.introPages.length,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SmoothPageIndicator(
                  controller: onboardController,
                  effect:  ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: AppColors.MAINTOW,
                    expansionFactor: 4,
                    dotHeight: 10,
                    dotWidth: 20,
                    spacing: 10,
                  ),
                  count: AppData.introPages.length,
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      CacheHelper.saveData(key: 'ShowOnBoard', value: false)
                          .then((value) {
                        if (value) {
                          navigateAndFinish(context, const LoginPage());
                        }
                      });
                    } else {
                      onboardController.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: const Icon(Icons.arrow_forward_ios_rounded),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
