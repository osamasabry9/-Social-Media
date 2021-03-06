abstract class SocialAppStates {}

// ------------InitialState----------------
class SocialAppInitialState extends SocialAppStates {}
//------------Get User States----------------
class SocialAppGetUserLoadingState extends SocialAppStates {}
class SocialAppGetUserSuccessState extends SocialAppStates {}
class SocialAppGetUserErrorState extends SocialAppStates {
  final String error;

  SocialAppGetUserErrorState(this.error);
}
//------------Get All Users States----------------
class SocialAppGetAllUsersLoadingState extends SocialAppStates {}
class SocialAppGetAllUsersSuccessState extends SocialAppStates {}
class SocialAppGetAllUsersErrorState extends SocialAppStates {
  final String error;

  SocialAppGetAllUsersErrorState(this.error);
}
//------------Bottom States----------------
class SocialChangeBottomNavState extends SocialAppStates {}

class SocialNewPostState extends SocialAppStates {}

// ------------------Profile Image------------------

// Profile Image packer
class SocialProfileImagePackerSuccessState extends SocialAppStates {}
class SocialProfileImagePackerErrorState extends SocialAppStates {
  final String error;

  SocialProfileImagePackerErrorState(this.error);
}
// //Uploading profile Image
class SocialUploadProfileImageSuccessState extends SocialAppStates {}
class SocialUploadProfileImageErrorState extends SocialAppStates {
  final String error;

  SocialUploadProfileImageErrorState(this.error);
}

// ------------------Cover Image------------------

// Cover Image packer
class SocialCoverImagePackerSuccessState extends SocialAppStates {}
class SocialCoverImagePackerErrorState extends SocialAppStates {
  final String error;

  SocialCoverImagePackerErrorState(this.error);
}

//Uploading cover Image
class SocialUploadCoverImageSuccessState extends SocialAppStates {}
class SocialUploadCoverImageErrorState extends SocialAppStates {
  final String error;

  SocialUploadCoverImageErrorState(this.error);
}

// Update user data
class SocialAppUserUploadLoadingState extends SocialAppStates {}
class SocialUserUploadErrorState extends SocialAppStates {
  final String error;

  SocialUserUploadErrorState(this.error);
}

// ------------------Posts------------------
class SocialAppCreatePostLoadingState extends SocialAppStates {}
class SocialAppCreatePostSuccessState extends SocialAppStates {}
class SocialAppCreatePostErrorState extends SocialAppStates {
  final String error;

  SocialAppCreatePostErrorState(this.error);
}

// Post Image packer
class SocialPostImagePackerSuccessState extends SocialAppStates {}
class SocialPostImageRemoveState extends SocialAppStates {}
class SocialPostImagePackerErrorState extends SocialAppStates {
  final String error;

  SocialPostImagePackerErrorState(this.error);
}

//------------Get Post States----------------
class SocialAppGetPostLoadingState extends SocialAppStates {}
class SocialAppGetPostSuccessState extends SocialAppStates {}
class SocialAppGetPostErrorState extends SocialAppStates {
  final String error;

  SocialAppGetPostErrorState(this.error);
}

//------------Like Post States----------------
class SocialAppLikePostLoadingState extends SocialAppStates {}
class SocialAppLikePostSuccessState extends SocialAppStates {}
class SocialAppLikePostErrorState extends SocialAppStates {
  final String error;

  SocialAppLikePostErrorState(this.error);
}

//------------Comment Post States----------------
class SocialAppCommentPostLoadingState extends SocialAppStates {}
class SocialAppCommentPostSuccessState extends SocialAppStates {}
class SocialAppCommentPostErrorState extends SocialAppStates {
  final String error;

  SocialAppCommentPostErrorState(this.error);
}

// Chat
class SocialAppSendMassageSuccessState extends SocialAppStates {}
class SocialAppSendMassageErrorState extends SocialAppStates {
  final String error;

  SocialAppSendMassageErrorState(this.error);
}

class SocialAppGetMassageLoadingState extends SocialAppStates {}

class SocialAppGetMassageSuccessState extends SocialAppStates {}
class SocialAppGetMassageErrorState extends SocialAppStates {
  final String error;

  SocialAppGetMassageErrorState(this.error);
}
