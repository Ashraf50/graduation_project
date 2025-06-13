import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../../helper/di.dart';

User getCurrentUser() {
  var user = supabase.auth.currentUser;
  user!.userMetadata!['userName'];
  log(user.toString());
  return user;
}
