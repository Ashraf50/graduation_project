import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import '../model/places_model/places_model.dart';

abstract class MapRepo {
  Future<Either<Failure, List<PlacesModel>>> fetchAllPlaces({
    required String query,
  });
  Future<List<List<double>>> getRoute({
    required String profile,
    required List<Map<String, double>> waypoints,
  });
}
