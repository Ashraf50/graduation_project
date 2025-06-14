import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/core/constant/function/build_account_image.dart';
import 'package:graduation_project/core/constant/shared_pref.dart';
import 'package:graduation_project/core/helper/di.dart';
import 'package:graduation_project/core/widget/custom_app_bar.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/core/widget/custom_toast.dart';
import 'package:graduation_project/feature/Auth/presentation/view/widget/custom_text_field.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/custom_update_button.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/profile_photo.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class EditProfileView extends StatelessWidget {
  final User? userData;
  EditProfileView({
    super.key,
    this.userData,
  });

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).my_profile),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(
              height: 24,
            ),
            ProfilePhoto(
              image: supabase.auth.currentUser?.userMetadata?['imageProfile'] ??
                  supabase.auth.currentUser?.userMetadata?['userName'][0],
            ),
            // buildAccountImage(radius: 25),
            SizedBox(
              height: 30,
            ),
            CustomUpdateButton(
              title: S.of(context).update_username,
              subTitle: userData?.userMetadata?['userName'] ?? '',
              imageIcon: 'assets/img/id_card.svg',
              icon: Icon(Icons.edit),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: themeProvider.isDarkTheme
                            ? AppColors.primaryColor
                            : AppColors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            CustomTextfield(
                              enableColor: themeProvider.isDarkTheme
                                  ? AppColors.widgetColorDark
                                  : Color(0xffBCB8B1),
                              hintText:
                                  userData?.userMetadata?['userName'] ?? '',
                              obscureText: false,
                              controller: nameController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == '') {
                                  return S.of(context).value_empty;
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.13,
                            ),
                            TextButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  await supabase.auth
                                      .updateUser(
                                    UserAttributes(
                                      data: {
                                        'userName': nameController.text,
                                      },
                                    ),
                                  )
                                      .then(
                                    (value) {
                                      Navigator.pop(context);
                                      CustomToast.show(
                                        message: 'Updated successfully.!',
                                        alignment: Alignment.bottomCenter,
                                        backgroundColor: AppColors.toastColor,
                                      );
                                    },
                                  ).onError(
                                    (error, stackTrace) {
                                      Navigator.pop(context);
                                      CustomToast.show(
                                        message: error.toString(),
                                        alignment: Alignment.bottomCenter,
                                        backgroundColor: Colors.red,
                                      );
                                    },
                                  );
                                }
                              },
                              child: Text(
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeProvider.isDarkTheme
                                      ? AppColors.white
                                      : AppColors.primaryColor,
                                ),
                                'press here to update your info',
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            CustomUpdateButton(
              title: S.of(context).Update_email,
              subTitle: userData?.email ?? '',
              imageIcon: 'assets/img/Email.svg',
              icon: Icon(Icons.edit),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: themeProvider.isDarkTheme
                            ? AppColors.primaryColor
                            : AppColors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            CustomTextfield(
                              enableColor: themeProvider.isDarkTheme
                                  ? AppColors.widgetColorDark
                                  : Color(0xffBCB8B1),
                              hintText: userData?.email ?? '',
                              obscureText: false,
                              controller: emailController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                return value != null &&
                                        !EmailValidator.validate(value)
                                    ? S.of(context).valid_email
                                    : null;
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.13,
                            ),
                            TextButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  try {
                                    await supabase.auth
                                        .updateUser(
                                      UserAttributes(
                                        email: emailController.text,
                                      ),
                                    )
                                        .then(
                                      (value) async {
                                        await supabase.auth.signOut();
                                        Navigator.pop(context);
                                        context.go('/sign_in');

                                        SharedPreferenceUtils.removeDate(
                                            key: 'token');

                                        CustomToast.show(
                                          message:
                                              'Updated successfully, Now, confirm your email.!',
                                          alignment: Alignment.bottomCenter,
                                          backgroundColor: AppColors.toastColor,
                                        );
                                      },
                                    ).onError(
                                      (error, stackTrace) {
                                        print(
                                            'error server: ${error.toString()}');
                                        CustomToast.show(
                                          message:
                                              'check your internet connection.!',
                                          alignment: Alignment.bottomCenter,
                                          backgroundColor: Colors.red,
                                        );
                                      },
                                    );
                                  } catch (err) {
                                    print('error catched ${err.toString()}');
                                    CustomToast.show(
                                      message: err.toString(),
                                      alignment: Alignment.bottomCenter,
                                      backgroundColor: Colors.red,
                                    );
                                  }
                                }
                              },
                              child: Text(
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeProvider.isDarkTheme
                                      ? AppColors.white
                                      : AppColors.primaryColor,
                                ),
                                'press here to update your info',
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            CustomUpdateButton(
              title: S.of(context).update_phone,
              subTitle: userData?.userMetadata?['phoneNo'] ?? '010',
              imageIcon: 'assets/img/phone.svg',
              icon: Icon(Icons.edit),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: themeProvider.isDarkTheme
                            ? AppColors.primaryColor
                            : AppColors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            CustomTextfield(
                              enableColor: themeProvider.isDarkTheme
                                  ? AppColors.widgetColorDark
                                  : Color(0xffBCB8B1),
                              hintText:
                                  userData?.userMetadata?['phoneNo'] ?? '',
                              obscureText: false,
                              controller: phoneController,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value!.length != 11) {
                                  return S.of(context).valid_phone;
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.13,
                            ),
                            TextButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  await supabase.auth
                                      .updateUser(
                                    UserAttributes(
                                      data: {
                                        'phoneNo': phoneController.text,
                                      },
                                    ),
                                  )
                                      .then(
                                    (value) {
                                      Navigator.pop(context);
                                      CustomToast.show(
                                        message: 'Updated successfully.!',
                                        alignment: Alignment.bottomCenter,
                                        backgroundColor: AppColors.toastColor,
                                      );
                                    },
                                  ).onError(
                                    (error, stackTrace) {
                                      Navigator.pop(context);
                                      CustomToast.show(
                                        message: error.toString(),
                                        alignment: Alignment.bottomCenter,
                                        backgroundColor: Colors.red,
                                      );
                                    },
                                  );
                                }
                              },
                              child: Text(
                                style: TextStyle(
                                  fontSize: 20,
                                  color: themeProvider.isDarkTheme
                                      ? AppColors.white
                                      : AppColors.primaryColor,
                                ),
                                'press here to update your info',
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
            CustomLogoutDeleteButton(
              title: S.of(context).delete_acc,
              image: 'assets/img/delete.svg',
              onTap: () {},
            ),
            CustomLogoutDeleteButton(
              title: S.of(context).logout,
              image: 'assets/img/log_out.svg',
              onTap: () async {
                context.go('/sign_in');
                await supabase.auth.signOut();
                SharedPreferenceUtils.removeDate(key: 'token');
                // AuthRepo authRepo = AuthRepoImpl(ApiHelper());
                // authRepo.logout();
              },
            )
          ],
        ),
      ),
    );
  }
}
