// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// import '../../widget/custom_toast.dart';
// import '../app_colors.dart';

// launchUrl({required String url}) async {
//   CustomToast.show(
//     message: 'launching begin ',
//     alignment: Alignment.bottomCenter,
//     backgroundColor: AppColors.toastColor,
//   );
//   Uri uri = Uri.parse(url);
//   if (!await canLaunchUrl(uri)) {
//     CustomToast.show(
//       message: 'we can not find this target now',
//       alignment: Alignment.bottomCenter,
//       backgroundColor: AppColors.toastColor,
//     );
//   }
//   CustomToast.show(
//     message: 'launching ends ',
//     alignment: Alignment.bottomCenter,
//     backgroundColor: AppColors.toastColor,
//   );
// }

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widget/custom_toast.dart';
import '../app_colors.dart';

urlLaunch({required String url}) async {
  Uri uri = Uri.parse(url);

  if (await canLaunchUrl(uri)) {
    try {
      CustomToast.show(
        message: 'getting you the material',
        alignment: Alignment.bottomCenter,
        backgroundColor: AppColors.toastColor,
      );
      await launchUrl(uri);
    } catch (e) {
      // Handle any error that happens during launch
      CustomToast.show(
        message: 'Error launching URL: $e',
        alignment: Alignment.bottomCenter,
        backgroundColor: AppColors.toastColor,
      );
    }
  } else {
    // If the URL can't be launched, show a toast message
    CustomToast.show(
      message: 'Cannot find this target now',
      alignment: Alignment.bottomCenter,
      backgroundColor: AppColors.toastColor,
    );
  }
}
