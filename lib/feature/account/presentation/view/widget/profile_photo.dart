import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/helper/di.dart';
import 'package:graduation_project/core/widget/custom_toast.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/change_photo_button.dart';
import 'package:graduation_project/feature/account/presentation/view_model/user_data_cubit/user_data_cubit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/constant/function/build_account_image.dart';

class ProfilePhoto extends StatelessWidget {
  final String image;
  ProfilePhoto({super.key, required this.image});
  final viewModel =
      UserDataCubit(uploadImageUsecase: injectUploadImageUsecase());
  @override
  Widget build(BuildContext context) {
    return BlocListener<UserDataCubit, UploadProfileImageState>(
      bloc: viewModel,
      listener: (context, state) async {
        if (state is UploadProfileImageLoadingState) {
          /// todo : show loading
          SmartDialog.showLoading();
        } else if (state is UploadProfileImageSuccessState) {
          // todo : hide loading
          SmartDialog.dismiss();

          // todo : show message
          CustomToast.show(
            message: state.profileImageURL,
            alignment: Alignment.bottomCenter,
            backgroundColor: AppColors.toastColor,
          );
          await supabase.auth.updateUser(
            UserAttributes(
              data: {
                'imageProfile': state.profileImageURL,
              },
            ),
          );
        } else if (state is UploadProfileImageErrorState) {
          // todo : hide loading
          SmartDialog.dismiss();

          // todo : show error message
          print('error is ${state.errMessage}');
          CustomToast.show(
            message: state.errMessage,
            alignment: Alignment.bottomCenter,
            backgroundColor: Colors.red,
          );
        } else {
          // todo : hide loading
          SmartDialog.dismiss();

          // todo : show error message
          // print('error is ${state.errorMessage}');
          CustomToast.show(
            message: ' state.errorMessage',
            alignment: Alignment.bottomCenter,
            backgroundColor: Colors.red,
          );
        }
      },
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            buildAccountImage(radius: 80),
            Positioned(
              bottom: -3,
              right: 11,
              child: ChangePhotoButton(
                choosePhoto: () async {
                  final XFile? xFile = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (xFile != null) {
                    viewModel.profileImageFile = File(xFile.path);
                    viewModel.profileImageURL =
                        'images/${DateTime.now().millisecondsSinceEpoch + 1}_${viewModel.profileImageFile!.path.split('/').last}';
                  }
                  viewModel.uploadImage();
                },
                takePhoto: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
