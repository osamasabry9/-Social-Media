
import 'package:social_media/modules/widgets/intro_page.dart';

import 'app_images.dart';

class AppData {
  static const List<IntroPage> introPages = [
    IntroPage(
        image: AppImages.INTRO_3,
        headline: "Create your profile",
        description: "Get new offers and great deals every day every hour"),
    IntroPage(
        image: AppImages.INTRO_1,
        headline: "Upload photos & videos",
        description: "Get new offers and great deals every day every hour"),
    IntroPage(
        image: AppImages.INTRO_2,
        headline: "Connect with friends",
        description: "Get new offers and great deals every day every hour"),
  ];
}
