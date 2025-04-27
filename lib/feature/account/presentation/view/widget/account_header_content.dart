import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_theme.dart';
import 'package:graduation_project/feature/Auth/data/manager/auth_supabase_manager.dart';
import 'package:provider/provider.dart';
import 'account_header_widget.dart';

class AccountHeaderContent extends StatelessWidget {
  const AccountHeaderContent({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);

    return AccountHeaderWidget(
      name: supabase.auth.currentUser?.userMetadata?['userName'] ?? '',
      image: supabase.auth.currentUser?.userMetadata?['imageProfile'] ??
          'https://i.pravatar.cc/300',
      onTap: () {
        context.push('/edit_profile');
      },
    );
  }
}
