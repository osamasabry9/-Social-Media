import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/layout/cubit/cubit_app.dart';
import 'package:social_media/layout/cubit/states_app.dart';
import 'package:social_media/shared/components/components.dart';
import 'package:social_media/shared/styles/icon_broken.dart';

import '../../../models/user_model.dart';
import '../edit_profile/edit_profile_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppCubit, SocialAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = SocialAppCubit.get(context).userModel;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // images caver and profile
              firstBarProfile(userModel, context),
              const SizedBox(
                height: 5,
              ),
              Text(
                userModel!.name,
                style: Theme.of(context).textTheme.bodyText1!,
              ),
              Text(
                userModel.bio,
                style: Theme.of(context).textTheme.caption!,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '120',
                              style: Theme.of(context).textTheme.subtitle2!,
                            ),
                            Text(
                              'Posts',
                              style: Theme.of(context).textTheme.caption!,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '230',
                              style: Theme.of(context).textTheme.subtitle2!,
                            ),
                            Text(
                              'Photos',
                              style: Theme.of(context).textTheme.caption!,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '15K',
                              style: Theme.of(context).textTheme.subtitle2!,
                            ),
                            Text(
                              'Followers',
                              style: Theme.of(context).textTheme.caption!,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '93',
                              style: Theme.of(context).textTheme.subtitle2!,
                            ),
                            Text(
                              'Followings',
                              style: Theme.of(context).textTheme.caption!,
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Add Photos'),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      navigateTo(context, EditProfileScreen());
                    },
                    child: const Icon(
                      IconBroken.Edit,
                      size: 16,
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget firstBarProfile(SocialUserModel? userdata, context) {
    return SizedBox(
      height: 190,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          //  image cover
          Align(
            child: Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      userdata!.cover,
                    ),
                    fit: BoxFit.cover,
                  )),
            ),
            alignment: AlignmentDirectional.topCenter,
          ),
          //  image profile
          CircleAvatar(
            radius: 63,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            child: CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                userdata.image,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
