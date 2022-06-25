import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/layout/cubit/cubit_app.dart';
import 'package:social_media/layout/cubit/states_app.dart';
import 'package:social_media/models/user_model.dart';
import 'package:social_media/modules/pages/05_chat_details/chat_details_screen.dart';
import 'package:social_media/shared/components/components.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialAppCubit, SocialAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SocialAppCubit.get(context).users.isNotEmpty
            ? ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildChatItem(
                    SocialAppCubit.get(context).users[index], context),
                separatorBuilder: (context, index) => myDivider(),
                itemCount: SocialAppCubit.get(context).users.length,
              )
            : const Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget buildChatItem(SocialUserModel user, BuildContext context) {
    return InkWell(
      onTap: () {
        navigateTo(
          context,
          ChatDetailsScreen(userModel: user),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(user.image),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              user.name,
              style:
                  Theme.of(context).textTheme.subtitle1!.copyWith(height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}
