import 'dart:developer';

class ChatHelper {
//   Future<String> getUserNameById(String id) async {
//     String uuid = idToUuid(id);
//     final response =
//         await supabase.from('LandLord').select('username').eq('id', uuid);

//     if (response.isNotEmpty) {
//       final userName = response[0]['username'];
//       log(userName);

//       return userName;
//     } else {
//       log('No user found.');
//       return 'not found';
//     }
//   }

  idToString(String id) {
    return id.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');
  }

  idToUuid(String id) {
    List<String> parts = id.split('');
    log(id);
    log('ID BEFORE $parts');
    // parts.insert(9, '-');
    // parts.insert(14, '-');
    // parts.insert(19, '-');
    // parts.insert(24, '-');
    log('ID AFTER $parts');
    return parts.join('');
  }
}
