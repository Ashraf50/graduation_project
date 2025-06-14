import 'dart:developer';
import '../../helper/di.dart';

Future<String> getLandLordNameById(String id) async {
  var user = await supabase.from('LandLord').select().eq('id', id).single();

  log(user.toString());
  return user['username'];
  // return user;
}
