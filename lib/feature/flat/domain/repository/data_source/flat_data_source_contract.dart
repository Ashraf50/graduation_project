import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:image_picker/image_picker.dart';

abstract class FlatDataSourceContract {
  Future<Either<Failure, String>> uploadFlat({
    required String numOfRoom,
    required String numOfBathroom,
    required String price,
    required String description,
    required String space,
    required String landlordID,
  });
  Future<Either<Failure, String>> uploadFlatImages({
    required List<XFile> images,
    required String flatId,
    required String landlordId,
  });
}
