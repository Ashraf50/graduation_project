import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:graduation_project/feature/flat/domain/repository/data_source/flat_data_source_contract.dart';
import 'package:graduation_project/feature/flat/domain/repository/repo/flat_repo_contract.dart';

class FlatRepoImpl implements FlatRepoContract {
  FlatDataSourceContract flatDataSourceContract;
  FlatRepoImpl({
    required this.flatDataSourceContract,
  });
  @override
  Future<Either<Failure, String>> uploadFlat({
    required String numOfRoom,
    required String numOfBathroom,
    required String price,
    required String description,
    required String space,
    required String landlordID,
    required List<XFile> images,
  }) {
    return flatDataSourceContract.uploadFlat(
      numOfRoom: numOfRoom,
      numOfBathroom: numOfBathroom,
      price: price,
      description: description,
      space: space,
      landlordID: landlordID,
      images: images,
    );
  }
}
