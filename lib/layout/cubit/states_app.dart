abstract class SocialAppStates {}

class SocialAppInitialState extends SocialAppStates {}

class SocialAppGetUserLoadingState extends SocialAppStates {}

class SocialAppGetUserSuccessState extends SocialAppStates
{
}

class SocialAppGetUserErrorState extends SocialAppStates
{
  final String error;

  SocialAppGetUserErrorState(this.error);
}
class SocialChangeBottomNavState extends SocialAppStates{}
class SocialNewPostState extends SocialAppStates{}