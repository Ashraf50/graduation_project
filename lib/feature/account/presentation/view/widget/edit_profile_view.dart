import 'package:flutter/material.dart';
import 'package:graduation_project/core/widget/custom_app_bar.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/custom_update_button.dart';
import 'package:graduation_project/feature/account/presentation/view/widget/profile_photo.dart';
import 'package:graduation_project/generated/l10n.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

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
            ProfilePhoto(),
            SizedBox(
              height: 30,
            ),
            CustomUpdateButton(
              title: S.of(context).update_username,
              subTitle: "Ashraf Essam",
              imageIcon: "assets/img/id_card.svg",
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
            CustomUpdateButton(
              title: S.of(context).Update_email,
              subTitle: "ashrafesam@gmail.com",
              imageIcon: "assets/img/Email.svg",
              icon: Icon(Icons.edit),
              onPressed: () {},
            ),
            CustomUpdateButton(
              title: S.of(context).add_phone,
              subTitle: "+201*********",
              imageIcon: "assets/img/phone.svg",
              icon: Icon(Icons.add),
              onPressed: () {},
            ),
            CustomLogoutDeleteButton(
              title: S.of(context).delete_acc,
              image: "assets/img/delete.svg",
              onTap: () {},
            ),
            CustomLogoutDeleteButton(
              title: S.of(context).logout,
              image: "assets/img/log_out.svg",
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
