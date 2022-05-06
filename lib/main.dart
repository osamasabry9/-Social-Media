import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:social_media/modules/pages/00_intro/onboarding_screen.dart';
import 'package:social_media/shared/bloc_observer.dart';
import 'package:social_media/shared/cubit/cubit.dart';
import 'package:social_media/shared/cubit/states.dart';
import 'package:social_media/shared/styles/themes.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'shared/network/local/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');
  Widget? widget = const OnboardingScreen();

  BlocOverrides.runZoned(
    () {
      runApp(MyApp(
        isDark: isDark,
        startWidget: widget,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget? startWidget;

  // ignore: use_key_in_widget_constructors
  const MyApp({
    this.isDark,
    this.startWidget,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => AppCubit()
              ..changeAppMode(
                   fromShared: isDark!,
                  ),
          ),
          // BlocProvider(
          //   create: (BuildContext context) => SocialCubit()
          //     ..getUserData()
          //     ..getPosts(),
          // ),
        ],
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: AppCubit.get(context).isDark!
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: SplashScreenView(
                navigateRoute: startWidget,
                duration: 5000,
                imageSize: 130,
                imageSrc: "assets/images/s.png",
                text: "Social App",
                textType: TextType.ColorizeAnimationText,
                textStyle: const TextStyle(
                  fontSize: 40.0,
                ),
                colors: const [
                  Colors.red,
                  Colors.deepOrange,
                  Colors.yellow,
                  Colors.redAccent,
                ],
                backgroundColor: AppCubit.get(context).isDark!
                    ? HexColor('333739')
                    : Colors.white,
              ),
            );
          },
        ));
  }
}
