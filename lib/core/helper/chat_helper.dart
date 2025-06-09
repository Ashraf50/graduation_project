import 'package:flutter/widgets.dart';
import 'package:graduation_project/feature/Auth/data/manager/auth_supabase_manager.dart';

class ChatHelper {
  Future<String> getUserNameById(String id) async {
    final response =
        await supabase.from('User').select('username').eq('id', id);

    if (response.isNotEmpty) {
      final userName = response[0]['username'];
      debugPrint(userName);

      return userName;
    } else {
      debugPrint('No user found.');
      return 'not found';
    }
  }
}
