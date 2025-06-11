import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/core/helper/di.dart';
import 'package:graduation_project/feature/flat/data/models/flat_model.dart';
import 'package:graduation_project/feature/flat/presentation/view_model/flat_view_model.dart';
import 'package:image_picker/image_picker.dart';

class FlatSupabaseManager {
  FlatSupabaseManager._();
  static FlatSupabaseManager? _instance;

  static FlatSupabaseManager getInstance() {
    _instance ??= FlatSupabaseManager._();
    return _instance!;
  }

// we need to pass to this fun numOfRoom, numOfBathroom, price, description, space, landlordID, images
  Future<Either<Failure, String>> uploadFlat({
    required String numOfRoom,
    required String numOfBathroom,
    required String price,
    required String description,
    required String space,
    required String landlordID,
    required List<XFile> images,
  }) async {
    var connectivityResults = await Connectivity().checkConnectivity();
    if (connectivityResults.contains(ConnectivityResult.mobile) ||
        connectivityResults.contains(ConnectivityResult.wifi)) {
      try {
        final response = await supabase.from('Flats').insert(
          {
            'description': description,
            'num_bathroom': numOfBathroom,
            'num_room': numOfRoom,
            'space': space,
            'landlord_id': landlordID,
          },
        ).select();
        if (response.isEmpty) {
          return Left(ServerError('failed to add flat'));
        }
        var flatId = response[0]['flat_id'];
        try {
          for (var image in images) {
            var bytes = await image.readAsBytes();
            String imageURL =
                "flats/${DateTime.now().millisecondsSinceEpoch}/$flatId-${image.path.split('/').last}";
            final uploadResponse = await supabase.storage
                .from('flat-image')
                .uploadBinary(imageURL, bytes);
            if (uploadResponse.isNotEmpty) {
              return Left(ServerError("failed to upload flat's images"));
            }
            String publicURL =
                supabase.storage.from('flat-image').getPublicUrl(imageURL);
            await supabase.from('FlatImages').insert({
              'flat_id': flatId,
              'landlord_id': landlordID,
              'image_URL': publicURL,
            });
            print('added image successfully');
            // return Right('flat added successfuly');
          }
        } catch (_) {
          return Left(ServerError('failed to upload flat.!'));
        }
        return Right('flat added successfuly');
      } catch (err) {
        return Left(
          ServerError(err.toString()),
        );
      }
    } else {
      return Left(
        NetworkError('Check your internet connection..!'),
      );
    }
  }

// more function we need to implement

  // Future<Either<Failure,List>> getAllFlat()async{}

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

// Future<Either<Failure, String>> uploadFlatImages({
//   required List<XFile> images,
//   required String flatId,
//   required String landlordId,
// }) async {
//   var connectivityResults = await Connectivity().checkConnectivity();
//   if (connectivityResults.contains(ConnectivityResult.mobile) ||
//       connectivityResults.contains(ConnectivityResult.wifi)) {
//     try {
//       /// internet is stable
//       /// data != null
//       /// flat_id && image_URL && landlord_id
//       //todo: add flat's images to the storage =>flat-image
//       // todo: add flat's images to the table => FlatImages
//       for (var image in images) {
//         var bytes = await image.readAsBytes();
//         String imageURL =
//             "flats/${DateTime.now().millisecondsSinceEpoch}/$flatId-${image.path.split('/').last}";
//         final uploadResponse = await supabase.storage
//             .from('flat-image')
//             .uploadBinary(imageURL, bytes);
//         if (uploadResponse.isNotEmpty) {
//           return Left(ServerError("failed to upload flat's images"));
//         }
//         imageURL = supabase.storage.from('flat-image').getPublicUrl(imageURL);
//         supabase.from('FlatImages').insert({
//           'flat_id': flatId,
//           'landlord_id': landlordId,
//           'image_URL': imageURL,
//         });
//         print('added image successfully');
//       }
//       return Right("flat's images added successfully.!");
//     } catch (err) {
//       return Left(ServerError(err.toString()));
//     }
//   } else {
//     return Left(
//       NetworkError('Check your internet connection..!'),
//     );
//   }
// }
