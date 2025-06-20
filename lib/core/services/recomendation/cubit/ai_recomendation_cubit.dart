import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constant/api_keys.dart';
import 'package:graduation_project/feature/flat/data/models/flat_model.dart';

part 'ai_recomendation_state.dart';

class AiRecomendationCubit extends Cubit<AiRecomendationState> {
  AiRecomendationCubit() : super(AiRecomendationInitial());

  List<Flat> recomendedFlats = [];
  getRecomendation({required Flat flat}) async {
    Map<String, dynamic> map = {
      'area': flat.space,
      'rooms': flat.numRooms,
      'bathrooms': flat.numBathroom,
      'internet': 1,
      'gas': 1,
      'beds': (int.parse(flat.numRooms!) * 2),
      'rent': flat.price,
      
    };
    emit(AiRecomendationLoading());
    try {
      Response response =
          await Dio().get(ApiKeys.aiRecomendationUrl, queryParameters: map);

      for (var flat in response.data) {
        if (!recomendedFlats.contains(flat)) {
          recomendedFlats.add(
            Flat(
              space: flat['Area (m²)'].toString(),
              numRooms: flat['Number of Rooms'].toString(),
              numBathroom: flat['Number of Bathrooms'].toString(),
              price: flat['Rent'].toString(),
            ),
          );
        }
      }
      log(response.data.toString());
      log(recomendedFlats.length.toString());

      emit(AiRecomendationSuccess(flats: recomendedFlats));
    } on Exception catch (e) {
      log(e.toString());
      emit(AiRecomendationFailure(errMessage: e.toString()));
    }
  }
}
