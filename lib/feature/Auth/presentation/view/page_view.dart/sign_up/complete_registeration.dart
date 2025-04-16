import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/core/widget/custom_app_bar.dart';
import 'package:graduation_project/core/widget/custom_button.dart';
import 'package:graduation_project/core/widget/custom_scaffold.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../../../../../../generated/l10n.dart';

class CompleteRegistration extends StatefulWidget {
  const CompleteRegistration({super.key});

  @override
  CompleteRegistrationState createState() => CompleteRegistrationState();
}

class CompleteRegistrationState extends State<CompleteRegistration> {
  File? frontImage;
  File? backImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage({required bool isFront}) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        if (isFront) {
          frontImage = File(image.path);
        } else {
          backImage = File(image.path);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.sizeOf(context).width;
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            S.of(context).upload_front,
            style: AppStyles.textStyle18black,
          ),
          buildImagePicker(
            theme: themeProvider,
            imageFile: frontImage,
            onPickImage: () => _pickImage(isFront: true),
          ),
          SizedBox(height: 20),
          Text(
            S.of(context).upload_back,
            style: AppStyles.textStyle18black,
          ),
          buildImagePicker(
            theme: themeProvider,
            imageFile: backImage,
            onPickImage: () => _pickImage(isFront: false),
          ),
          SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }

  Widget buildImagePicker({
    required ThemeProvider theme,
    required File? imageFile,
    required VoidCallback onPickImage,
  }) {
    return GestureDetector(
      onTap: onPickImage,
      child: Card(
        elevation: 5,
        child: Container(
          width: 300,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: theme.isDarkTheme
                ? AppColors.widgetColorDark
                : AppColors.whiteGrey,
          ),
          child: imageFile == null
              ? Center(
                  child: Icon(
                    Icons.add_a_photo,
                    size: 50,
                    color: Colors.grey,
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(
                    imageFile,
                    width: 300,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
        ),
      ),
    );
  }
}
