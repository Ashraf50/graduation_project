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
  }) async {
    return await flatRepoContract.uploadFlat(
        numOfRoom: numOfRoom,
        numOfBathroom: numOfBathroom,
        price: price,
        description: description,
        space: space,
        landlordID: landlordID);
  }

  Future<Either<Failure, String>> uploadFlatImages({
    required List<XFile> images,
    required String flatId,
    required String landlordId,
  }) async {
    return await flatRepoContract.uploadFlatImages(
      images: images,
      flatId: flatId,
      landlordId: landlordId,
    );
  }
}
