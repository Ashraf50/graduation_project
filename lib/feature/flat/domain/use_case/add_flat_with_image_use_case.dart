import 'package:dartz/dartz.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/feature/flat/domain/repository/repo/flat_repo_contract.dart';
import 'package:image_picker/image_picker.dart';

class AddFlatWithImageUseCase {
  FlatRepoContract flatRepoContract;
  AddFlatWithImageUseCase({
    required this.flatRepoContract,
  });
  Future<Either<Failure, String>> uploadFlat({
    required String numOfRoom,
    required String numOfBathroom,
    required String price,
    required String description,
    required String space,
    required String landlordID,
    required List<XFile> images,
  }) async {
    return await flatRepoContract.uploadFlat(
        numOfRoom: numOfRoom,
        numOfBathroom: numOfBathroom,
        price: price,
        description: description,
        space: space,
        landlordID: landlordID,
        images: images);
  }
}
