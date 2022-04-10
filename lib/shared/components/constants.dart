import 'dart:io';

import 'package:social_media/shared/network/local/cache_helper.dart';



String ?token = '';
String ?uId = '';


void signOut(context) {

  CacheHelper.removeData(key:'uId');
  // uId = CacheHelper.getData(key: 'uId');
  // navigateAndFinish(
  //   context,
  //   SocialLoginScreen(),
  // );
  // SocialCubit.get(context).currentIndex=0;
  // SocialCubit.get(context).users=[];
  // SocialCubit.get(context).posts=[];
  // SocialCubit.get(context).postsId=[];
  // SocialCubit.get(context).likes=[];
}

String getOS(){
  return Platform.operatingSystem;
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  // ignore: avoid_print
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
