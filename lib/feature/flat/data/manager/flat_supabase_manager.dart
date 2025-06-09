import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/core/helper/di.dart';
import 'package:image_picker/image_picker.dart';

class FlatSupabaseManager {
  FlatSupabaseManager._();
  static FlatSupabaseManager? _instance;

  static FlatSupabaseManager getInstance() {
    _instance ??= FlatSupabaseManager._();
    return _instance!;
  }

  Future<Either<Failure, String>> uploadFlatImages({
    required List<XFile> images,
    required String flatId,
    required String landlordId,
  }) async {
    var connectivityResults = await Connectivity().checkConnectivity();
    if (connectivityResults.contains(ConnectivityResult.mobile) ||
        connectivityResults.contains(ConnectivityResult.wifi)) {
      try {
        /// internet is stable
        /// data != null
        /// flat_id && image_URL && landlord_id

        //todo: add flat's images to the storage =>flat-image
        // todo: add flat's images to the table => FlatImages
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
          imageURL = supabase.storage.from('flat-image').getPublicUrl(imageURL);
          supabase.from('FlatImages').insert({
            'flat_id': flatId,
            'landlord_id': landlordId,
            'image_URL': imageURL,
          });
          print('added image successfully');
        }
        return Right("flat's images added successfully.!");
      } catch (err) {
        return Left(ServerError(err.toString()));
      }
    } else {
      return Left(
        NetworkError('Check your internet connection..!'),
      );
    }
  }

  Future<Either<Failure, String>> uploadFlat({
    required String numOfRoom,
    required String numOfBathroom,
    required String price,
    required String description,
    required String space,
    required String landlordID,
  }) async {
    var connectivityResults = await Connectivity().checkConnectivity();
    if (connectivityResults.contains(ConnectivityResult.mobile) ||
        connectivityResults.contains(ConnectivityResult.wifi)) {
      try {
        /// internet is stable
        /// data != null
        // todo: add flat to the table => Flats
        final response = await supabase.from('Flats').insert(
          {
            'description': description,
            'num_bathroom': numOfBathroom,
            'num_room': numOfRoom,
            'space': space,
            'landlord_flat_id': landlordID,
          },
        ).select();
        if (response.isEmpty) {
          return Left(ServerError('failed to add flat'));
        } else {
          return Right('flat added successfuly');
        }
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
}
