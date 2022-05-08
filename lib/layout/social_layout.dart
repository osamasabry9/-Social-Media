import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/layout/cubit/cubit_app.dart';
import 'package:social_media/layout/cubit/states_app.dart';
import 'package:social_media/shared/adaptive/adaptive_indicator.dart';
import 'package:social_media/shared/components/components.dart';
import 'package:social_media/shared/components/constants.dart';
import 'package:social_media/shared/styles/icon_broken.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppCubit, SocialAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SocialAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("Home"),
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
              cubit.model != null
                  ? InkWell(
                      onTap: () {
                        //navigateTo(context, EditProfileScreen());
                      },
                      child: CircleAvatar(
                        radius: 18,
                        child: CircleAvatar(
                          radius: 17,
                          backgroundImage: NetworkImage(cubit.model!.image),
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
          body: cubit.model != null?  Column(
            children: [
              if(!FirebaseAuth.instance.currentUser!.emailVerified)
                  Container(
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
                                  ?.sendEmailVerification().then((value) {
                                    showToast(text: 'check your email', state: ToastStates.SUCCESS);
                              }).catchError((error){});
                            },
                          ),
                        ],
                      ),
                    ),
            ],
          ) : const CircularProgressIndicator(),
        );
      },
    );
  }
}
