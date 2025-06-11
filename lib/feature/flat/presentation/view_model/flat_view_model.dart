import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graduation_project/feature/flat/domain/use_case/add_flat_with_image_use_case.dart';
import 'package:graduation_project/feature/flat/presentation/view_model/flat_states.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/helper/di.dart';
import '../../data/models/flat_model.dart';

class FlatViewModel extends Cubit<FlatStates> {
  AddFlatWithImageUseCase addFlatWithImageUseCase;

  FlatViewModel({required this.addFlatWithImageUseCase})
      : super(FlatInitialState());
  var formKey = GlobalKey<FormState>();
  var descriptionController = TextEditingController();
  var numOfRoomsController = TextEditingController();
  var priceController = TextEditingController();
  var numOfBathRoomController = TextEditingController();
  var spaceController = TextEditingController();
  String landlordId = '';
  List<XFile> images = [];

  Future<void> addFlatToSupabase() async {
    if (formKey.currentState!.validate() &&
        images.isNotEmpty &&
        landlordId.isNotEmpty) {
      emit(FlatLoadingState());
      var either = await addFlatWithImageUseCase.uploadFlat(
        numOfRoom: numOfRoomsController.text,
        numOfBathroom: numOfBathRoomController.text,
        price: priceController.text,
        description: descriptionController.text,
        space: spaceController.text,
        landlordID: landlordId,
        images: images,
      );
      either.fold((err) {
        emit(FlatErrorState(errMsg: err.errMessage));
      }, (sucMsg) {
        emit(FlatSuccessState(sucMsg: sucMsg));
        descriptionController.clear();
        numOfRoomsController.clear();
        priceController.clear();
        numOfBathRoomController.clear();
        spaceController.clear();
        images.clear();
      });
    }
  }


Future<List<Flat>> fetchFlats() async {
    final response = await supabase
        .from('Flats')
        .select()
        .order('created_at', ascending: false);

    if (response.isEmpty) {
      throw Exception('there is no flats to show');
    }

    // Convert to List<Flat>
    return (response as List)
        .map((flatJson) => Flat.fromJson(flatJson))
        .toList();
  }


  Future<List<Flat>> fetchFlatsByLandlord(String landlordId) async {
 
  final response = await supabase
      .from('Flats')
      .select()
      .eq('landlord_id', landlordId);

  if (response.isEmpty) {
    throw Exception('Failed to fetch Flats for landlord: $landlordId');
  }

  return (response as List)
      .map((flatJson) => Flat.fromJson(flatJson))
      .toList();
}



}
