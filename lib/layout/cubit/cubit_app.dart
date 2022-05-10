import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/layout/cubit/states_app.dart';
import 'package:social_media/models/user_model.dart';
import 'package:social_media/modules/pages/02_feeds/feeds_screen.dart';
import 'package:social_media/modules/pages/04_chats/chats_screen.dart';
import 'package:social_media/modules/pages/06_settings/settings_screen.dart';
import 'package:social_media/modules/pages/07_users/users_screen.dart';
import 'package:social_media/modules/pages/10_new_post/new_post_screen.dart';

import '../../shared/components/constants.dart';

class  SocialAppCubit extends Cubit<SocialAppStates>
{
  SocialAppCubit() : super(SocialAppInitialState());
  static SocialAppCubit get(context)=>BlocProvider.of(context);

  SocialUserModel? model;
 void getUserData()
 {
  emit(SocialAppGetUserLoadingState()) ;
  FirebaseFirestore.instance.collection('users').doc(uId).get().then((
      value) {
    model = SocialUserModel.fromJson(value.data()!);
    emit(SocialAppGetUserSuccessState());
  }).catchError((error){
    // ignore: avoid_print
    print(error.toString());
    emit(SocialAppGetUserErrorState(error.toString()));
  });
 }
int currentIndex = 0;
 List<Widget> screens = const[
   FeedsScreen(),
   ChatsScreen(),
   NewPostScreen(),
   UsersScreen(),
   SettingsScreen(),
 ];
 void changeBottomNav(int index)
 {
   if(index == 2)
     {
       emit(SocialNewPostState());
     }
   else {
     currentIndex = index;
     emit(SocialChangeBottomNavState());
   }
 }
List<String> titles = [
  'Home',
  'Chats',
  'New Post',
  'Users',
  'Settings'
];
}