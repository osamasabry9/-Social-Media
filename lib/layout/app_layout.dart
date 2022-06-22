import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/layout/cubit/cubit_app.dart';
import 'package:social_media/layout/cubit/states_app.dart';
import 'package:social_media/modules/pages/10_new_post/new_post_screen.dart';
import 'package:social_media/shared/adaptive/adaptive_indicator.dart';
import 'package:social_media/shared/components/components.dart';
import 'package:social_media/shared/components/constants.dart';
import 'package:social_media/shared/styles/icon_broken.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppCubit, SocialAppStates>(
      listener: (context, state) {
        if (state is SocialNewPostState) {
          navigateTo(context, NewPostScreen());
        }
      },
      builder: (context, state) {
        var cubit = SocialAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
            actions: [
              IconButton(
                icon: const Icon(IconBroken.Notification),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(IconBroken.Search),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(IconBroken.Logout),
                onPressed: () {
                  // signOut(context);
                  //cubit.logOut(context);
                },
              ),
              cubit.userModel != null
                  ? InkWell(
                      onTap: () {
                        //navigateTo(context, EditProfileScreen());
                      },
                      child: CircleAvatar(
                        radius: 18,
                        child: CircleAvatar(
                          radius: 17,
                          backgroundImage: NetworkImage(cubit.userModel!.image),
                        ),
                      ),
                    )
                  : Center(
                      child: AdaptiveIndicator(
                        os: getOS(),
                      ),
                    ),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
          body: cubit.userModel != null
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      if (!FirebaseAuth.instance.currentUser!.emailVerified)
                        buildContainerEmailVerified(),
                      cubit.screens[cubit.currentIndex],
                    ],
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Home,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Chat,
                ),
                label: 'Chats',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Paper_Upload,
                ),
                label: 'Post',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Location,
                ),
                label: 'Users',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  IconBroken.Setting,
                ),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }

  Container buildContainerEmailVerified() {
    return Container(
      color: Colors.amberAccent.withOpacity(0.6),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        children: [
          const Icon(IconBroken.Danger),
          const SizedBox(
            width: 15,
          ),
          const Expanded(
              child: Text(
            'Please verify your email',
            // style: TextStyle(color: Colors.red),
          )),
          const SizedBox(
            width: 20,
          ),
          defaultTextButton(
            text: ' send ',
            function: () {
              FirebaseAuth.instance.currentUser
                  ?.sendEmailVerification()
                  .then((value) {
                showToast(text: 'check your email', state: ToastStates.SUCCESS);
              }).catchError((error) {});
            },
          ),
        ],
      ),
    );
  }
}
