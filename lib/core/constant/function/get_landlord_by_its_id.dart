// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:developer';
import '../../helper/di.dart';

Future<String> getLandLordNameById(String id) async {
  // log('Fetching landlord name for ID: $id');
  var user = await supabase.from('LandLord').select().eq('id', id).single();

  // log('the landlord is ' + user['username'].toString());
  return user['username'];
  // return user;
}
