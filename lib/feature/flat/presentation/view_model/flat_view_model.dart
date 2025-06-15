import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:graduation_project/core/constant/function/get_landlord_by_its_id.dart';
import 'package:graduation_project/feature/flat/domain/use_case/add_flat_with_image_use_case.dart';
import 'package:graduation_project/feature/flat/presentation/view_model/flat_states.dart';

import '../../../../core/helper/di.dart';
import '../../data/models/flat_model.dart';

class FlatViewModel extends Cubit<FlatStates> {
  AddFlatWithImageUseCase addFlatWithImageUseCase;

  FlatViewModel({required this.addFlatWithImageUseCase})
      : super(FlatInitialState());

  // int currnetIndex = 0;
  bool isFlatLoaded = false;
  List<Flat> allFlats = [];
  Future<void> addFlatToSupabase({required Flat flat}) async {
    emit(FlatLoadingState());
    var either = await addFlatWithImageUseCase.uploadFlat(
      numOfRoom: flat.numRooms ?? '0',
      numOfBathroom: flat.numBathroom ?? '0',
      price: flat.price ?? '0',
      description: flat.description ?? '',
      space: flat.space ?? '0',
      landlordID: flat.landlordId ?? '0',
      images: flat.images ?? [],
    );
    log(' either is $either');
    either.fold((err) {
      log(err.toString());
      emit(AddingFlatErrorState(errMsg: err.errMessage));
    }, (sucMsg) {
      log(sucMsg.toString());
      emit(AddingFlatSuccessState(sucMsg: sucMsg));
    });
  }

  Future<List<Flat>> fetchAllFlats() async {
    try {
      if (isFlatLoaded) {
        emit(FetchingAllFlatsSuccessState(flats: allFlats));
        allFlats;
      }

      emit(FetchingAllFlatsLoadingState());
      SmartDialog.showLoading(useAnimation: true, alignment: Alignment.center);
      final response = await supabase
          .from('Flats')
          .select()
          .order('created_at', ascending: false);

      if (response.isEmpty) {
        emit(
          FetchingAllFlatsErrorState(errMsg: 'there is no flats to show yet'),
        );
      }
      // log('flat  response is  ${response.toString()}');

      // Convert to List<Flat>
      List<Flat> flats = (response as List)
          .map(
            (flatJson) => Flat.fromJson(flatJson),
          )
          .toList();

      for (var flat in flats) {
        flat.landlordName = await getLandLordNameById(flat.landlordId!);
        flat.imagesUrl = await _fetchFlatImages(flat.flatId.toString());
      }

      allFlats = flats;

      isFlatLoaded = true;
      // log(' all the flats are $flats');
      emit(FetchingAllFlatsSuccessState(flats: flats));
      return flats;
    } on Exception catch (e) {
      emit(FetchingAllFlatsErrorState(errMsg: e.toString()));
      throw Exception('Error fetching flats: ${e.toString()}');
    }
  }

  Future<List<String>> _fetchFlatImages(String flatId) async {
    try {
      var response =
          await supabase.from('FlatImages').select().eq('flat_id', flatId);

      // log('images response is $response');
      List<String> images = [];
      for (var image in response) {
        images.add(image['image_URL']);
      }
      // log('images  $images');

      return images;
    } catch (e) {
      throw Exception('Error fetching flat images: ${e.toString()}');
    }
  }

  Future<void> fetchFlatsByLandlordId(String landlordId) async {
    try {
      if (isFlatLoaded) {
        log('allFlats  ${allFlats.toString()}');
        emit(FetchingLandlordFlatsSuccessState(flats: allFlats));
        return;
      }
      emit(FetchingLandlordFlatsLoadingState());
      SmartDialog.showLoading(useAnimation: true, alignment: Alignment.center);

      final response = await supabase
          .from('Flats')
          .select()
          .eq('landlord_id', landlordId)
          .order('created_at', ascending: false);

      if (response.isEmpty) {
        emit(FetchingLandlordFlatsErrorState(
            errMsg: 'there is no flats to show yet'));
      }

      var flats = (response as List)
          .map((flatJson) => Flat.fromJson(flatJson))
          .toList();

      for (var flat in flats) {
        flat.landlordName = await getLandLordNameById(flat.landlordId!);
        flat.imagesUrl = await _fetchFlatImages(flat.flatId.toString());
      }
      allFlats = flats;

      isFlatLoaded = true;

      emit(FetchingLandlordFlatsSuccessState(flats: flats));
    } on Exception catch (e) {
      emit(FetchingLandlordFlatsErrorState(errMsg: e.toString()));
    }
  }

  void invalidateLandlordFlatsCache() {
    isFlatLoaded = false;
    allFlats = [];
  }
}
