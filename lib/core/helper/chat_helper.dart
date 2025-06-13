import 'package:flutter/widgets.dart';

import 'di.dart';

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
