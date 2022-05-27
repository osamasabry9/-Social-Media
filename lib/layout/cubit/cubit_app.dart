import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media/layout/cubit/states_app.dart';
import 'package:social_media/models/user_model.dart';
import 'package:social_media/modules/pages/02_feeds/feeds_screen.dart';
import 'package:social_media/modules/pages/04_chats/chats_screen.dart';
import 'package:social_media/modules/pages/06_settings/settings_screen.dart';
import 'package:social_media/modules/pages/07_users/users_screen.dart';
import 'package:social_media/modules/pages/10_new_post/new_post_screen.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../shared/components/constants.dart';

class SocialAppCubit extends Cubit<SocialAppStates> {
  SocialAppCubit() : super(SocialAppInitialState());

  static SocialAppCubit get(context) => BlocProvider.of(context);

  SocialUserModel? model;

  void getUserData() {
    emit(SocialAppGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      model = SocialUserModel.fromJson(value.data()!);
      emit(SocialAppGetUserSuccessState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(SocialAppGetUserErrorState(error.toString()));
    });
  }

  int currentIndex = 0;
  List<Widget> screens = const [
    FeedsScreen(),
    ChatsScreen(),
    NewPostScreen(),
    UsersScreen(),
    SettingsScreen(),
  ];

  void changeBottomNav(int index) {
    if (index == 2) {
      emit(SocialNewPostState());
    } else {
      currentIndex = index;
      emit(SocialChangeBottomNavState());
    }
  }

  List<String> titles = ['Home', 'Chats', 'New Post', 'Users', 'Settings'];

  File? profileImage;
  final picker = ImagePicker();

  Future getProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(SocialProfileImagePackerSuccessState());
    } else {
      print('No Image selected');
      emit(SocialProfileImagePackerErrorState('No Image selected'));
    }
  }

  File? coverImage;

  Future getCoverImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(SocialCoverImagePackerSuccessState());
    } else {
      print('No Image selected');
      emit(SocialCoverImagePackerErrorState('No Image selected'));
    }
  }

  void uploadProfileImage({
    required String name,
    required String bio,
    required String phone,
  }) {
    emit(SocialAppUserUploadLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //emit(SocialUploadProfileImageSuccessState());
        print(value);
        updateUser(name: name, bio: bio, phone: phone, profileImage: value);
      }).catchError((onError) {
        emit(SocialUploadProfileImageErrorState(onError));
      });
    }).catchError((error) {
      emit(SocialUploadProfileImageErrorState(error));
    });
  }

  void uploadCoverImage({
    required String name,
    required String bio,
    required String phone,
  }) {
    emit(SocialAppUserUploadLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        //emit(SocialUploadCoverImageSuccessState());
        print(value);
        updateUser(name: name, bio: bio, phone: phone, coverImage: value);
      }).catchError((onError) {
        emit(SocialUploadCoverImageErrorState(onError));
      });
    }).catchError((error) {
      emit(SocialUploadCoverImageErrorState(error));
    });
  }

  void updateUser({
    required String name,
    required String bio,
    required String phone,
    String? coverImage,
    String? profileImage,
  }) {
    SocialUserModel modelUpdate = SocialUserModel(
      name: name,
      phone: phone,
      email: model!.email,
      cover: coverImage ?? model!.cover,
      image: profileImage ?? model!.image,
      uId: model!.uId,
      bio: bio,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(model!.uId)
        .update(modelUpdate.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(SocialUserUploadErrorState(error.toString()));
      print(error.toString());
    });
  }
}
