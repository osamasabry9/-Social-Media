import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/layout/cubit/cubit_app.dart';
import 'package:social_media/layout/cubit/states_app.dart';
import 'package:social_media/models/post_model.dart';

import '../../../shared/styles/icon_broken.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppCubit, SocialAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SocialAppCubit.get(context).posts.isNotEmpty &&
                SocialAppCubit.get(context).userModel != null
            ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => buildCardPost(
                          SocialAppCubit.get(context).posts[index],
                          index,
                          context),
                      itemCount: SocialAppCubit.get(context).posts.length,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget buildCardPost(PostModel model, index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //image and name and date
              Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(model.image),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  model.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1!
                                      .copyWith(height: 1.4),
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                const Icon(
                                  Icons.check_circle,
                                  color: Colors.blue,
                                  size: 16,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              model.dateTime,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(height: 1.4),
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                          padding: EdgeInsets.zero,
                          icon: const Icon(
                            IconBroken.More_Square,
                            size: 20,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // drawing line  between post and info about user and post
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              ),
              // The body of a text post
              Text(
                model.text,
                style: Theme.of(context).textTheme.subtitle1,
              ),

// The body of a text post (hashtag)
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 8.0),
              //   child: SizedBox(
              //     width: double.infinity,
              //     child: Wrap(
              //       spacing: 5,
              //       children: [
              //         SizedBox(
              //           height: 25,
              //           child: MaterialButton(
              //             onPressed: () {},
              //             child: Text(
              //               '#Software',
              //               style:
              //                   Theme.of(context).textTheme.caption!.copyWith(
              //                         color: Colors.blue,
              //                       ),
              //             ),
              //             minWidth: 1,
              //             height: 25,
              //             padding: EdgeInsets.zero,
              //           ),
              //         ),
              //         SizedBox(
              //           height: 25,
              //           child: MaterialButton(
              //             onPressed: () {},
              //             child: Text(
              //               '#Software',
              //               style:
              //                   Theme.of(context).textTheme.caption!.copyWith(
              //                         color: Colors.blue,
              //                       ),
              //             ),
              //             minWidth: 1,
              //             height: 25,
              //             padding: EdgeInsets.zero,
              //           ),
              //         ),
              //         SizedBox(
              //           height: 25,
              //           child: MaterialButton(
              //             onPressed: () {},
              //             child: Text(
              //               '#Software',
              //               style:
              //                   Theme.of(context).textTheme.caption!.copyWith(
              //                         color: Colors.blue,
              //                       ),
              //             ),
              //             minWidth: 1,
              //             height: 25,
              //             padding: EdgeInsets.zero,
              //           ),
              //         ),
              //         SizedBox(
              //           height: 25,
              //           child: MaterialButton(
              //             onPressed: () {},
              //             child: Text(
              //               '#Software',
              //               style:
              //                   Theme.of(context).textTheme.caption!.copyWith(
              //                         color: Colors.blue,
              //                       ),
              //             ),
              //             minWidth: 1,
              //             height: 25,
              //             padding: EdgeInsets.zero,
              //           ),
              //         ),
              //         SizedBox(
              //           height: 25,
              //           child: MaterialButton(
              //             onPressed: () {},
              //             child: Text(
              //               '#Software_development',
              //               style:
              //                   Theme.of(context).textTheme.caption!.copyWith(
              //                         color: Colors.blue,
              //                       ),
              //             ),
              //             minWidth: 1,
              //             height: 25,
              //             padding: EdgeInsets.zero,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              if (model.postImage != '')
                // The body of a image post
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: DecorationImage(
                          image: NetworkImage(
                            model.postImage,
                          ),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
              // shapes and numbers of likes and comments
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          SocialAppCubit.get(context).likePost(
                              SocialAppCubit.get(context).postsId[index]);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            children: [
                              const Icon(
                                IconBroken.Heart,
                                size: 16,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '${SocialAppCubit.get(context).likes[index]}',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(
                                IconBroken.Chat,
                                size: 16,
                                color: Colors.amberAccent,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '0 Comment',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // drawing line
              Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
              // add comment and like and share
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 18,
                              backgroundImage: NetworkImage(
                                  SocialAppCubit.get(context).userModel!.image),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Write a comment ...',
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(height: 1.4),
                            ),
                          ],
                        ),
                        onTap: () {},
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              const Icon(
                                IconBroken.Heart,
                                size: 16,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Like',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(
                                IconBroken.Chat,
                                size: 16,
                                color: Colors.green,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Share',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
