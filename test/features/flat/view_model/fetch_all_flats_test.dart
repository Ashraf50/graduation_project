// import 'package:dartz/dartz.dart';
// import 'package:dartz/dartz.dart' as mockQueryBuilder;
// import 'package:flutter_test/flutter_test.dart';
// import 'package:graduation_project/core/helper/di.dart';
// import 'package:graduation_project/feature/flat/domain/use_case/add_flat_with_image_use_case.dart';
// import 'package:mockito/mockito.dart';
// import 'package:bloc_test/bloc_test.dart';
// import 'package:graduation_project/feature/flat/data/models/flat_model.dart';
// import 'package:graduation_project/feature/flat/presentation/view_model/flat_view_model.dart';
// import 'package:graduation_project/feature/flat/presentation/view_model/flat_states.dart';

// import 'package:supabase_flutter/supabase_flutter.dart';

// class MockSupabaseClient extends Mock implements SupabaseClient {}

// class MockSupabaseQueryBuilder extends Mock implements PostgrestQueryBuilder {}

// class MockAddFlatWithImageUseCase extends Mock implements AddFlatWithImageUseCase {}

// void main() {
//   late MockSupabaseClient mockSupabaseClient;
//   late MockSupabaseQueryBuilder mockQueryBuilder;
//   late FlatViewModel viewModel;

//   final mockResponse = [
//     {
//       'flat_id': 1,
//       'landlord_id': '1',
//       'description': 'Test Flat',
//       'num_rooms': '2',
//       'num_bathroom': '1',
//       'price': '1000',
//       'space': '80',
//       'images': [],
//       'created_at': '2024-01-01'
//     }
//   ];

//   setUp(() {
//     mockSupabaseClient = MockSupabaseClient();
//     mockQueryBuilder = MockSupabaseQueryBuilder();

//     // Override global supabase with mock if it's global, otherwise inject
//     supabase = mockSupabaseClient;

//     viewModel = TestableFlatViewModel(
//       addFlatWithImageUseCase: MockAddFlatWithImageUseCase(),
//       fetchImages: (String id) async => ['mocked_image.jpg'],
//       getLandlordName: (String id) async => 'Mocked Landlord',
//     );
//   });

//   blocTest<TestableFlatViewModel, FlatStates>(
//     'emits loading then success when fetchAllFlats is called',
//     build: () {
//       when(mockSupabaseClient.from('Flats')).thenReturn(mockQueryBuilder);
//       when(mockQueryBuilder.select()).thenReturn(mockQueryBuilder);
//       when(mockQueryBuilder.order('created_at', ascending: false)).thenAnswer(
//         (_) async => mockResponse,
//       );
//       return viewModel;
//     },
//     act: (vm) async {
//       await vm.fetchAllFlats();
//     },
//     expect: () => [
//       isA<FetchingAllFlatsLoadingState>(),
//       isA<FetchingAllFlatsSuccessState>(),
//     ],
//     verify: (_) {
//       // Optional: Verify internal behavior
//     },
//   );
// }

// class TestableFlatViewModel extends FlatViewModel {
//   final Future<List<String>> Function(String) fetchImages;
//   final Future<String> Function(String) getLandlordName;

//   TestableFlatViewModel({
//     required AddFlatWithImageUseCase addFlatWithImageUseCase,
//     required this.fetchImages,
//     required this.getLandlordName,
//   }) : super(addFlatWithImageUseCase: addFlatWithImageUseCase);

//   @override
//   Future<List<String>> _fetchFlatImages(String flatId) => fetchImages(flatId);

//   @override
//   Future<void> fetchAllFlats() async {
//     try {
//       if (isFlatLoaded) {
//         emit(FetchingAllFlatsSuccessState(flats: allFlats));
//         return;
//       }

//       emit(FetchingAllFlatsLoadingState());

//       final response = await supabase
//           .from('Flats')
//           .select()
//           .order('created_at', ascending: false);

//       if (response.isEmpty) {
//         emit(FetchingAllFlatsErrorState(errMsg: 'there is no flats to show yet'));
//         return;
//       }

//       List<Flat> flats = (response as List)
//           .map((flatJson) => Flat.fromJson(flatJson))
//           .toList();

//       for (var flat in flats) {
//         flat.landlordName = await getLandlordName(flat.landlordId!);
//         flat.imagesUrl = await fetchImages(flat.flatId.toString());
//       }

//       allFlats = flats;
//       isFlatLoaded = true;
//       emit(FetchingAllFlatsSuccessState(flats: flats));
//     } catch (e) {
//       emit(FetchingAllFlatsErrorState(errMsg: e.toString()));
//     }
//   }
// }
