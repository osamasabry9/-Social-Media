import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media/layout/cubit/states_app.dart';
import 'package:social_media/models/comment_model.dart';
import 'package:social_media/models/message_model.dart';
import 'package:social_media/models/user_model.dart';
import 'package:social_media/modules/pages/02_feeds/feeds_screen.dart';
import 'package:social_media/modules/pages/04_chats/chats_screen.dart';
import 'package:social_media/modules/pages/06_settings/settings_screen.dart';
import 'package:social_media/modules/pages/07_users/users_screen.dart';
import 'package:social_media/modules/pages/10_new_post/new_post_screen.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import '../../models/post_model.dart';
import '../../shared/components/constants.dart';

class SocialAppCubit extends Cubit<SocialAppStates> {
  SocialAppCubit() : super(SocialAppInitialState());

  static SocialAppCubit get(context) => BlocProvider.of(context);

  SocialUserModel? userModel;

  void getUserData() {
    emit(SocialAppGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userModel = SocialUserModel.fromJson(value.data()!);
      emit(SocialAppGetUserSuccessState());
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(SocialAppGetUserErrorState(error.toString()));
    });
  }

  int currentIndex = 0;
  List<Widget> screens = [
    FeedsScreen(),
    const ChatsScreen(),
    NewPostScreen(),
    const UsersScreen(),
    const SettingsScreen(),
  ];

  void changeBottomNav(int index) {
    if (index == 1) getUsers();
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
      email: userModel!.email,
      cover: coverImage ?? userModel!.cover,
      image: profileImage ?? userModel!.image,
      uId: userModel!.uId,
      bio: bio,
      isEmailVerified: false,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .update(modelUpdate.toMap())
        .then((value) {
      getUserData();
    }).catchError((error) {
      emit(SocialUserUploadErrorState(error.toString()));
      print(error.toString());
    });
  }

// ---------------Create Post-----------------
  File? postImage;

  Future getPostImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(SocialPostImagePackerSuccessState());
    } else {
      print('No Image selected');
      emit(SocialPostImagePackerErrorState('No Image selected'));
    }
  }

  void removePostImage() {
    postImage = null;
    emit(SocialPostImageRemoveState());
  }

  void uploadPostImage({
    required String dateTime,
    required String text,
  }) {
    emit(SocialAppCreatePostLoadingState());
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child('users/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        print(value);
        createPost(dateTime: dateTime, text: text, postImage: value);
      }).catchError((onError) {
        emit(SocialAppCreatePostErrorState(onError));
      });
    }).catchError((error) {
      emit(SocialAppCreatePostErrorState(error));
    });
  }

  void createPost({
    required String dateTime,
    required String text,
    String? postImage,
  }) {
    emit(SocialAppCreatePostLoadingState());
    PostModel modelPost = PostModel(
      name: userModel!.name,
      uId: userModel!.uId,
      image: userModel!.image,
      dateTime: dateTime,
      text: text,
      postImage: postImage ?? '',
    );
    FirebaseFirestore.instance
        .collection('posts')
        .add(modelPost.toMap())
        .then((value) {
      emit(SocialAppCreatePostSuccessState());
    }).catchError((error) {
      emit(SocialAppCreatePostErrorState(error.toString()));
      print(error.toString());
    });
  }

  List<PostModel> posts = [];
  List<String> postsId = [];
  List<int> likes = [];

  void getPosts() {
    emit(SocialAppGetPostLoadingState());
    FirebaseFirestore.instance.collection('posts').orderBy('dateTime').get().then((value) {
      posts = [];
      value.docs.forEach(
        (element) {
          element.reference.collection('likes').get().then((value) {
            likes.add(value.docs.isEmpty ? 0 : value.docs.length);
            posts.add(PostModel.fromJson(element.data()));
            postsId.add(element.id);
          }).catchError((error) {
            //print(error.toString());
          });
        },
      );
      emit(SocialAppGetPostSuccessState());
    }).catchError((onError) {
      emit(SocialAppGetPostErrorState(onError.toString()));
    });
  }

  void likePost(String postId) {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('likes')
        .doc(userModel!.uId)
        .set({
      'like': true,
    }).then((value) {
      emit(SocialAppLikePostSuccessState());
    }).catchError((onError) {
      emit(SocialAppLikePostErrorState(onError.toString()));
    });
  }

  Future<void> handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(seconds: 3), () {
      completer.complete();
    });
    return completer.future.then<void>((_) {
      FirebaseFirestore.instance.collection('posts').orderBy('dateTime').get().then((value) {
        posts = [];
        value.docs.forEach((element) {
          element.reference.collection('likes').get().then((value) {
            likes.add(value.docs.length);
            postsId.add(element.id);
            posts.add(PostModel.fromJson(element.data()));
          }).catchError((error) {});
        });
        emit(SocialAppGetPostSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(SocialAppGetPostErrorState(error.toString()));
      });
    });
  }

  // create Comment

  void createComment({
    required String dateTime,
    required String text,
    String? postId,
  }) {
    emit(SocialAppCommentPostLoadingState());

    CommentModel model = CommentModel(
      name: userModel!.name,
      uId: userModel!.uId,
      dateTime: dateTime,
      text: text,
    );

    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('comment')
        .doc(userModel!.uId)
        .set(model.toMap())
        .then((value) {
      emit(SocialAppCommentPostSuccessState());
    }).catchError((error) {
      emit(SocialAppCommentPostErrorState(onError.toString()));
    });
  }

  List<SocialUserModel> users = [];
  void getUsers() {
    emit(SocialAppGetAllUsersLoadingState());
    if (users.isEmpty) {
      FirebaseFirestore.instance.collection('users').get().then((value) {
        value.docs.forEach((element) {
          if (element.data()['uId'] != userModel!.uId) {
            users.add(SocialUserModel.fromJson(element.data()));
          }
          //users.add(SocialUserModel.fromJson(element.data()));
        });
        emit(SocialAppGetAllUsersSuccessState());
      }).catchError((error) {
        //print(error.toString());
        emit(SocialAppGetAllUsersErrorState(error.toString()));
      });
    }
  }

  void sendMessage({
    required String receiverId,
    required String dateTime,
    required String text,
  }) {
    MessageModel model = MessageModel(
      senderId: userModel!.uId,
      receiverId: receiverId,
      dateTime: dateTime,
      text: text,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(SocialAppSendMassageSuccessState());
    }).catchError((onError) {
      emit(SocialAppSendMassageErrorState(onError.toString()));
    });

    FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(userModel!.uId)
        .collection('messages')
        .add(model.toMap())
        .then((value) {
      emit(SocialAppSendMassageSuccessState());
    }).catchError((onError) {
      emit(SocialAppSendMassageErrorState(onError.toString()));
    });
  }

  List<MessageModel> messages = [];
  void getMessage({
    required String receiverId,
  }) {
    emit(SocialAppGetMassageLoadingState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(userModel!.uId)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages = [];
      event.docs.forEach((element) {
        messages.add(MessageModel.fromJson(element.data()));
      });
      emit(SocialAppGetMassageSuccessState());
    });
  }
}
