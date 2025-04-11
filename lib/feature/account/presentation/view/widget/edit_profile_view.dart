import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/helper/api_helper.dart';
import 'package:graduation_project/core/widget/custom_app_bar.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/Auth/data/repo/auth_repo.dart';
import 'package:graduation_project/feature/Auth/data/repo/auth_repo_impl.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/custom_update_button.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/profile_photo.dart';
import 'package:graduation_project/generated/l10n.dart';
import '../../../data/model/user_model.dart';

class EditProfileView extends StatelessWidget {
  final UserModel userData;
  const EditProfileView({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(title: S.of(context).my_profile),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(
              height: 24,
            ),
            ProfilePhoto(image: userData.profileImage!),
            SizedBox(
              height: 30,
            ),
            CustomUpdateButton(
              title: S.of(context).update_username,
              subTitle: userData.username,
              imageIcon: 'assets/img/id_card.svg',
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
            CustomUpdateButton(
              title: S.of(context).Update_email,
              subTitle: userData.email,
              imageIcon: 'assets/img/Email.svg',
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
            CustomUpdateButton(
              title: S.of(context).update_phone,
              subTitle: userData.phone,
              imageIcon: 'assets/img/phone.svg',
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
            CustomLogoutDeleteButton(
              title: S.of(context).delete_acc,
              image: 'assets/img/delete.svg',
              onTap: () {},
            ),
            CustomLogoutDeleteButton(
              title: S.of(context).logout,
              image: 'assets/img/log_out.svg',
              onTap: () {
                context.go('/sign_in');
                AuthRepo authRepo = AuthRepoImpl(ApiHelper());
                authRepo.logout();
              },
            )
          ],
        ),
      ),
    );
  }
}
