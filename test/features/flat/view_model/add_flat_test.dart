import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:graduation_project/core/error/failure.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';

import 'package:graduation_project/feature/flat/presentation/view_model/flat_view_model.dart';
import 'package:graduation_project/feature/flat/domain/use_case/add_flat_with_image_use_case.dart';
import 'package:graduation_project/feature/flat/presentation/view_model/flat_states.dart';
import 'package:graduation_project/feature/flat/data/models/flat_model.dart';

import 'add_flat_test.mocks.dart';

class ErrorModel {
  final String errMessage;
  ErrorModel({required this.errMessage});
}

@GenerateMocks([AddFlatWithImageUseCase])
void main() {
  late MockAddFlatWithImageUseCase mockUseCase;
  late FlatViewModel viewModel;

  setUp(() {
    mockUseCase = MockAddFlatWithImageUseCase();
    viewModel = FlatViewModel(addFlatWithImageUseCase: mockUseCase);
  });
  final mockImage = XFile('test/assets/mock.jpg');
  final testFlat = Flat(
    landlordId: '1',
    price: '1000',
    description: 'Nice flat',
    space: '90',
    numRooms: '3',
    numBathroom: '1',
    images: [mockImage],
  );

  group('addFlatToSupabase', () {
    blocTest<FlatViewModel, FlatStates>(
      'emits [FlatLoadingState, AddingFlatSuccessState] on success',
      build: () {
        when(mockUseCase.uploadFlat(
          numOfRoom: anyNamed('numOfRoom'),
          numOfBathroom: anyNamed('numOfBathroom'),
          price: anyNamed('price'),
          description: anyNamed('description'),
          space: anyNamed('space'),
          landlordID: anyNamed('landlordID'),
          images: anyNamed('images'),
        )).thenAnswer((_) async => Right('Flat added successfully'));
        return viewModel;
      },
      act: (vm) => vm.addFlatToSupabase(flat: testFlat),
      expect: () => [
        isA<FlatLoadingState>(),
        isA<AddingFlatSuccessState>(),
      ],
    );

    blocTest<FlatViewModel, FlatStates>(
      'emits [FlatLoadingState, AddingFlatErrorState] on failure',
      build: () {
        when(mockUseCase.uploadFlat(
          numOfRoom: anyNamed('numOfRoom'),
          numOfBathroom: anyNamed('numOfBathroom'),
          price: anyNamed('price'),
          description: anyNamed('description'),
          space: anyNamed('space'),
          landlordID: anyNamed('landlordID'),
          images: anyNamed('images'),
        )).thenAnswer((_) async => Left(
              ServerFailure('Failed to add flat'),
            ));
        return viewModel;
      },
      act: (vm) => vm.addFlatToSupabase(flat: testFlat),
      expect: () => [
        isA<FlatLoadingState>(),
        isA<AddingFlatErrorState>(),
      ],
    );
  });
}
