import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/core/helper/di.dart';
import 'package:provider/provider.dart';
import 'account_header_widget.dart';

class AccountHeaderContent extends StatelessWidget {
  const AccountHeaderContent({super.key});
  @override
  Widget build(BuildContext context) {
    Provider.of<ThemeProvider>(context);

    return AccountHeaderWidget(
      
      name: supabase.auth.currentUser?.userMetadata?['userName'] ?? '',
      image: supabase.auth.currentUser?.userMetadata?['imageProfile'] ??
          supabase.auth.currentUser?.userMetadata?['userName'][0],
      onTap: () {
        context.push('/edit_profile');
      },
    );
  }
}
