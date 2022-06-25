import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/layout/cubit/cubit_app.dart';
import 'package:social_media/layout/cubit/states_app.dart';
import 'package:social_media/models/user_model.dart';
import 'package:social_media/shared/styles/colors.dart';
import 'package:social_media/shared/styles/icon_broken.dart';

class ChatDetailsScreen extends StatelessWidget {
  SocialUserModel userModel;
  ChatDetailsScreen({Key? key, required this.userModel}) : super(key: key);
  var messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      SocialAppCubit.get(context).getMessage(receiverId: userModel.uId);
      return BlocConsumer<SocialAppCubit, SocialAppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              titleSpacing: 0.0,
              title: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(userModel.image),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    userModel.name,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1!
                        .copyWith(height: 1.4),
                  ),
                ],
              ),
            ),
            body: state is SocialAppGetMassageLoadingState
                ? const Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              if (userModel.uId !=
                                  SocialAppCubit.get(context)
                                      .messages[index]
                                      .senderId) {
                                return buildMessage(
                                  alignment: AlignmentDirectional.centerEnd,
                                  bottomEnd: 0.0,
                                  bottomStart: 10.0,
                                  color: defaultColor.withOpacity(0.2),
                                  message: SocialAppCubit.get(context)
                                      .messages[index]
                                      .text,
                                );
                              } else {
                                return buildMessage(
                                  alignment: AlignmentDirectional.centerStart,
                                  bottomEnd: 10.0,
                                  bottomStart: 0.0,
                                  color: Colors.grey[300]!,
                                  message: SocialAppCubit.get(context)
                                      .messages[index]
                                      .text,
                                );
                              }
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                              height: 15.0,
                            ),
                            itemCount:
                                SocialAppCubit.get(context).messages.length,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey[300]!,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Row(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: TextFormField(
                                    controller: messageController,
                                    decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText:
                                            'Type your message here .....'),
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                color: defaultColor,
                                child: MaterialButton(
                                  onPressed: () {
                                    SocialAppCubit.get(context).sendMessage(
                                      receiverId: userModel.uId,
                                      dateTime: DateTime.now().toString(),
                                      text: messageController.text,
                                    );
                                  },
                                  minWidth: 1.0,
                                  child: const Icon(
                                    IconBroken.Send,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
          );
        },
      );
    });
  }

  Align buildMessage({
    required AlignmentGeometry alignment,
    required double bottomEnd,
    required double bottomStart,
    required Color color,
    required String message,
  }) {
    return Align(
      alignment: alignment,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadiusDirectional.only(
            bottomEnd: Radius.circular(bottomEnd),
            bottomStart: Radius.circular(bottomStart),
            topEnd: const Radius.circular(10.0),
            topStart: const Radius.circular(10.0),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Text(message),
      ),
    );
  }
}
