import 'package:flutter/material.dart';

import '../../../shared/styles/icon_broken.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => buildCardPost(context),
            itemCount: 10,
          ),
          const SizedBox(height: 8,),
        ],
      ),
    );
  }

  Widget buildCardPost(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
                                  'Osama Sabry',
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
                              'May 8, 2022 at 7:05 AM',
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              ),
              Text(
                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English.",
                style: Theme.of(context).textTheme.subtitle1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    spacing: 5,
                    children: [
                      SizedBox(
                        height: 25,
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text(
                            '#Software',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.blue,
                                    ),
                          ),
                          minWidth: 1,
                          height: 25,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text(
                            '#Software',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.blue,
                                    ),
                          ),
                          minWidth: 1,
                          height: 25,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text(
                            '#Software',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.blue,
                                    ),
                          ),
                          minWidth: 1,
                          height: 25,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text(
                            '#Software',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.blue,
                                    ),
                          ),
                          minWidth: 1,
                          height: 25,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                      SizedBox(
                        height: 25,
                        child: MaterialButton(
                          onPressed: () {},
                          child: Text(
                            '#Software_development',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.blue,
                                    ),
                          ),
                          minWidth: 1,
                          height: 25,
                          padding: EdgeInsets.zero,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://img.freepik.com/free-photo/showing-tablet-s-blank-screen_155003-21288.jpg?size=626&ext=jpg',
                      ),
                      fit: BoxFit.cover,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
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
                                '1026',
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
                                '132 Comment',
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
              Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 18,
                              backgroundImage: NetworkImage(
                                  'https://img.freepik.com/free-photo/looking-side-young-handsome-male-student-wearing-back-bag-holding-books-speaks-loudspeaker_141793-96480.jpg?t=st=1651983279~exp=1651983879~hmac=7e0673dd0d2815c120448236275e07680541c715d7c1962103e4e225f4819973&w=740'),
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
