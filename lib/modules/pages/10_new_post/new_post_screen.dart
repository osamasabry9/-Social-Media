import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/layout/cubit/cubit_app.dart';
import 'package:social_media/layout/cubit/states_app.dart';
import 'package:social_media/shared/components/components.dart';
import 'package:social_media/shared/styles/icon_broken.dart';

class NewPostScreen extends StatelessWidget {
  NewPostScreen({Key? key}) : super(key: key);
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppCubit, SocialAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: defaultAppBar(
            context: context,
            title: 'Create Post',
            actions: [
              defaultTextButton(
                  function: () {
                    DateTime selectedDate = DateTime.now();
                    if (SocialAppCubit.get(context).postImage == null) {
                      SocialAppCubit.get(context).createPost(
                          dateTime: selectedDate.toString(),
                          text: textController.text);
                    } else {
                      SocialAppCubit.get(context).uploadPostImage(
                          dateTime: selectedDate.toString(),
                          text: textController.text);
                    }
                  },
                  text: 'Post')
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if (state is SocialAppCreatePostLoadingState)
                  const LinearProgressIndicator(),
                if (state is SocialAppCreatePostLoadingState)
                  const SizedBox(
                    height: 10,
                  ),
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-photo/looking-side-young-handsome-male-student-wearing-back-bag-holding-books-speaks-loudspeaker_141793-96480.jpg?t=st=1651983279~exp=1651983879~hmac=7e0673dd0d2815c120448236275e07680541c715d7c1962103e4e225f4819973&w=740'),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: Text(
                        'Osama Sabry',
                        style: Theme.of(context)
                            .textTheme
                            .subtitle1!
                            .copyWith(height: 1.4),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: const InputDecoration(
                      hintText: 'What\'s on your mind?',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                if (SocialAppCubit.get(context).postImage != null)
                  const SizedBox(
                    height: 10,
                  ),
                if (SocialAppCubit.get(context).postImage != null)
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    children: [
                      Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              4,
                            ),
                            image: DecorationImage(
                              image: FileImage(
                                  SocialAppCubit.get(context).postImage!),
                              fit: BoxFit.cover,
                            )),
                      ),
                      IconButton(
                        onPressed: () {
                          SocialAppCubit.get(context).removePostImage();
                        },
                        icon: const CircleAvatar(
                          radius: 20.0,
                          child: Icon(
                            Icons.close,
                            size: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {
                          SocialAppCubit.get(context).getPostImage();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(IconBroken.Image),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Add Photo'),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('# tags'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
