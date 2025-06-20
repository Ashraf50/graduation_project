import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_colors.dart';
import 'package:graduation_project/core/constant/app_strings.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/widget/custom_toast.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../../generated/l10n.dart';

class MaterailViewBody extends StatefulWidget {
  const MaterailViewBody({super.key});

  @override
  State<MaterailViewBody> createState() => _MaterailViewBodyState();
}

class _MaterailViewBodyState extends State<MaterailViewBody> {
  int level = -1;
  int semester = -1;
  bool semesterEnabled = false;

  late final WebViewController _controller;
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
            });
            // CustomToast.show(message: 'onpageStarted  ${url}');
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
            // CustomToast.show(message: ' onPageFinished  ${url}');
          },
          onWebResourceError: (error) {
            setState(() {
              _isLoading = false;
            });
            // CustomToast.show(
            //     message: ' onWebResourceError  ${error.description}');
            // Optional: show error widget or dialog
          },
        ),
      )
      ..setBackgroundColor(Colors.transparent);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Center(
          child: DropdownMenu(
            menuStyle: _menuStyle(),
            width: screenWidth / 1.5,

            onSelected: (value) {
              if (value != null) {
                level = value;
                semesterEnabled = true;

                setState(() {});
              }
              if (semester != -1) {
                launchUrlOfAlevel(level, semester);
              }
            },
            label: Text(S.of(context).select_level),
            // value: 'data',
            dropdownMenuEntries: const [
              DropdownMenuEntry(
                value: 1,
                label: 'level 1',
              ),
              DropdownMenuEntry(
                value: 2,
                label: 'level 2',
              ),
              DropdownMenuEntry(
                value: 3,
                label: 'level 3',
              ),
              DropdownMenuEntry(
                value: 4,
                label: 'level 4',
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: DropdownMenu(
            menuStyle: _menuStyle(),
            enabled: semesterEnabled,
            width: screenWidth / 1.5,
            onSelected: (value) {
              if (value != null) {
                semester = value;
                launchUrlOfAlevel(level, value);

                setState(() {});
              }
            },

            label: Text(S.of(context).select_semester),
            // value: 'data',
            dropdownMenuEntries: const [
              DropdownMenuEntry(
                value: 1,
                label: 'semester 1',
              ),
              DropdownMenuEntry(
                value: 2,
                label: 'semester 2',
              ),
            ],
          ),
        ),
        // Spacer(),
        // Center(
        //   child: semester != -1
        //       ? WebViewWidget(controller: _controller)
        //       : Text(
        //           S.of(context).select_level_semester,
        //           style: AppStyles.textStyle16,
        //         ),
        // ),
        semester != -1
            ? Expanded(
                child: Stack(
                  children: [
                    WebViewWidget(controller: _controller),
                    if (_isLoading)
                      const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ), // You can customize this
                      ),
                  ],
                ),
              )
            : Padding(
                padding: EdgeInsets.only(top: screenHeight / 4),
                child: Center(
                    child: Text(
                  S.of(context).select_level_semester,
                  textAlign: TextAlign.center,
                  style: AppStyles.textStyle16,
                )),
              ),
        // Spacer(),
      ],
    );
  }

  launchUrlOfAlevel(int level, int sem) {
    switch (level) {
      case 1:
        if (sem == 2) {
          _controller.loadRequest(Uri.parse(MaterialLinks.level1sem2));
          setState(() {});
        } else {
          _controller.loadRequest(Uri.parse(MaterialLinks.level1sem1));
          setState(() {});
        }
      case 2:
        if (sem == 2) {
          _controller.loadRequest(Uri.parse(MaterialLinks.level2sem2));
          setState(() {});
        } else {
          _controller.loadRequest(Uri.parse(MaterialLinks.level2sem1));
          setState(() {});
        }
      case 3:
        if (sem == 2) {
          _controller.loadRequest(Uri.parse(MaterialLinks.level3sem2));
          setState(() {});
        } else {
          _controller.loadRequest(Uri.parse(MaterialLinks.level3sem1));
          setState(() {});
        }
      case 4:
        if (sem == 2) {
          _controller.loadRequest(Uri.parse(MaterialLinks.level4sem2));
          setState(() {});
        } else {
          _controller.loadRequest(Uri.parse(MaterialLinks.level4sem1));
          setState(() {});
        }

        break;
    }
  }

  MenuStyle _menuStyle() {
    return MenuStyle(
      backgroundColor: WidgetStatePropertyAll(AppColors.white),
    );
  }
}
