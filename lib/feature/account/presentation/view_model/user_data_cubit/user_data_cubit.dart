import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graduation_project/feature/account/domain/usecase/upload_image_usecase.dart';

part 'user_data_state.dart';

class UserDataCubit extends Cubit<UploadProfileImageState> {
  final UploadImageUsecase uploadImageUsecase;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  String? profileImageURL;
  File? profileImageFile;
  UserDataCubit({
    required this.uploadImageUsecase,
  }) : super(UploadProfileImageInitialState());
  Future<void> uploadImage() async {
    emit(UploadProfileImageLoadingState());
    var either = await uploadImageUsecase.uploadProfileImage(
      profileImageURL: profileImageURL,
      profileImageFile: profileImageFile,
    );
    either.fold((err) {
      emit(
        UploadProfileImageErrorState(
          errMessage: err.errMessage,
        ),
      );
    }, (profileImageURL) {
      emit(UploadProfileImageSuccessState(profileImageURL: profileImageURL));
    });
  }
}
