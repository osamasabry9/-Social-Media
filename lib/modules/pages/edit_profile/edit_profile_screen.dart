import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/layout/cubit/cubit_app.dart';
import 'package:social_media/layout/cubit/states_app.dart';
import 'package:social_media/shared/components/components.dart';
import 'package:social_media/shared/styles/icon_broken.dart';

class EditProfileScreen extends StatelessWidget {
  TextEditingController controllerName = TextEditingController();
  TextEditingController controllerBio = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();

  EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppCubit, SocialAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var userModel = SocialAppCubit.get(context).userModel;
        var profileImage = SocialAppCubit.get(context).profileImage;
        var coverImage = SocialAppCubit.get(context).coverImage;
        controllerName.text = userModel!.name;
        controllerBio.text = userModel.bio;
        controllerPhone.text = userModel.phone;

        return Scaffold(
          appBar:
              defaultAppBar(context: context, title: 'Edit Profile', actions: [
            defaultTextButton(
                function: () {
                  SocialAppCubit.get(context).updateUser(
                      name: controllerName.text,
                      bio: controllerBio.text,
                      phone: controllerPhone.text);
                },
                text: 'Update'),
            const SizedBox(
              width: 15.0,
            ),
          ]),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if (state is SocialAppUserUploadLoadingState)
                    const LinearProgressIndicator(),
                  if (state is SocialAppUserUploadLoadingState)
                    const SizedBox(
                      height: 10,
                    ),
                  // images caver and profile
                  SizedBox(
                    height: 190,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        //  image cover
                        Align(
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: 140,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(4),
                                      topRight: Radius.circular(4),
                                    ),
                                    image: DecorationImage(
                                      image: coverImage == null
                                          ? NetworkImage(
                                              userModel.cover,
                                            )
                                          : FileImage(coverImage)
                                              as ImageProvider,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              IconButton(
                                onPressed: () {
                                  SocialAppCubit.get(context).getCoverImage();
                                },
                                icon: const CircleAvatar(
                                  radius: 20.0,
                                  child: Icon(
                                    IconBroken.Camera,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          alignment: AlignmentDirectional.topCenter,
                        ),
                        //  image profile
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 63,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: profileImage == null
                                    ? NetworkImage(
                                        userModel.image,
                                      )
                                    : FileImage(profileImage) as ImageProvider,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                SocialAppCubit.get(context).getProfileImage();
                              },
                              icon: const CircleAvatar(
                                radius: 20.0,
                                child: Icon(
                                  IconBroken.Camera,
                                  size: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  if (profileImage != null || coverImage != null)
                    const SizedBox(
                      height: 15,
                    ),
                  if (profileImage != null || coverImage != null)
                    Row(
                      children: [
                        if (profileImage != null)
                          Expanded(
                              child: Column(
                            children: [
                              defaultButton(
                                  function: () {
                                    SocialAppCubit.get(context)
                                        .uploadProfileImage(
                                      name: controllerName.text,
                                      bio: controllerBio.text,
                                      phone: controllerPhone.text,
                                    );
                                  },
                                  text: 'Update Profile'),
                              const SizedBox(
                                height: 5,
                              ),
                              if (state is SocialAppUserUploadLoadingState)
                                const LinearProgressIndicator(),
                            ],
                          )),
                        if (profileImage != null)
                          const SizedBox(
                            width: 5,
                          ),
                        if (coverImage != null)
                          Expanded(
                              child: Column(
                            children: [
                              defaultButton(
                                  function: () {
                                    SocialAppCubit.get(context)
                                        .uploadCoverImage(
                                      name: controllerName.text,
                                      bio: controllerBio.text,
                                      phone: controllerPhone.text,
                                    );
                                  },
                                  text: 'Update Cover'),
                              const SizedBox(
                                height: 5,
                              ),
                              if (state is SocialAppUserUploadLoadingState)
                                const LinearProgressIndicator(),
                            ],
                          )),
                      ],
                    ),
                  const SizedBox(
                    height: 15,
                  ),
                  defaultFormField(
                    controller: controllerName,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'name must not be empty';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    label: 'Name',
                    prefix: IconBroken.User,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  defaultFormField(
                    controller: controllerBio,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'bio must not be empty';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.text,
                    label: 'Bio',
                    prefix: IconBroken.Info_Circle,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  defaultFormField(
                    controller: controllerPhone,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'Phone must not be empty';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                    label: 'Phone',
                    prefix: IconBroken.Call,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
