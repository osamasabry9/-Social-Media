import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_media/layout/cubit/states_app.dart';
import 'package:social_media/models/user_model.dart';

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


}