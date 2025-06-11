import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graduation_project/feature/flat/domain/use_case/add_flat_with_image_use_case.dart';
import 'package:graduation_project/feature/flat/presentation/view_model/flat_states.dart';
import 'package:image_picker/image_picker.dart';

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
}
