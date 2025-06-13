import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/core/helper/di.dart';
import 'package:graduation_project/feature/dashboard/presentation/view/widgets/custom_text_field.dart';
import 'package:graduation_project/feature/flat/data/models/flat_model.dart';
import 'package:graduation_project/feature/flat/presentation/view_model/flat_states.dart';
import 'package:graduation_project/feature/flat/presentation/view_model/flat_view_model.dart';
import 'package:graduation_project/generated/l10n.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/constant/app_colors.dart';

class ApartmentDetailsBottomSheet extends StatefulWidget {
  const ApartmentDetailsBottomSheet({super.key});

  @override
  State<ApartmentDetailsBottomSheet> createState() =>
      _ApartmentDetailsBottomSheetState();
}

class _ApartmentDetailsBottomSheetState
    extends State<ApartmentDetailsBottomSheet> {
  late Flat flat;

  var formKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();
  List<XFile> selectedImages = [];
  late FlatViewModel flatCubit;
  @override
  void initState() {
    flatCubit = BlocProvider.of<FlatViewModel>(context);
    flat = Flat.instance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Center(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 16,
              right: 16,
              top: 16,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Add Apartment Details',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      ),
                    ),
                    child: TextButton(
                      onPressed: () async {
                        selectedImages = await picker.pickMultiImage();

                        if (selectedImages.isNotEmpty) {
                          log('Images selected: ${selectedImages.length}');
                          setState(() {
                            flat.images = selectedImages;
                            flat.landlordId = supabase.auth.currentUser!.id;
                          });
                        } else {
                          print("No images selected.");
                        }
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.photo,
                            size: 24,
                            color: AppColors.primaryColor,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'Upload Phtots',
                            style: AppStyles.textStyle16gray.copyWith(
                              color: Colors.black87,
                            ),
                          ),
                          Spacer(),
                          selectedImages.isNotEmpty
                              ? Icon(
                                  Icons.check_circle,
                                  size: 20,
                                  color: AppColors.primaryColor,
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    labelText: 'Price',
                    prefixIcon: Icons.attach_money,
                    keyboardType: TextInputType.number,
                    onSubmitted: (value) {
                      flat.price = value;
                      setState(() {});
                    },
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          onSubmitted: (value) {
                            flat.numBathroom = value;
                            setState(() {});
                          },
                          labelText: 'Bathrooms',
                          prefixIcon: Icons.bathtub,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: CustomTextField(
                          onSubmitted: (value) {
                            flat.numRooms = value;
                            setState(() {});
                          },
                          labelText: 'Bedrooms',
                          prefixIcon: Icons.bed,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: CustomTextField(
                          onSubmitted: (value) {
                            flat.space = value;
                            setState(() {});
                          },
                          labelText: 'Space (sqm)',
                          prefixIcon: Icons.square_foot,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  CustomTextField(
                    onSubmitted: (value) {
                      flat.description = value;
                      setState(() {});
                    },
                    labelText: 'Description',
                    prefixIcon: Icons.description,
                    maxLines: 3,
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      log('Flat details: ${flat.toString()}');
                      log('Landlord ID: ${supabase.auth.currentUser!.id}');

                      if (formKey.currentState!.validate() &&
                          flat.images!.isNotEmpty &&
                          supabase.auth.currentUser!.id.isNotEmpty) {
                        flatCubit.addFlatToSupabase(flat: flat);
                        SmartDialog.showLoading(
                          useAnimation: true,
                          alignment: Alignment.center,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(175, 0, 89, 79),
                    ),
                    child: Text(
                      S.current.Add_flat,
                      style: AppStyles.textStyle18White,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
