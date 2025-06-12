import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/feature/dashboard/presentation/view/widgets/custom_text_field.dart';
import 'package:graduation_project/feature/flat/data/models/flat_model.dart';
import 'package:graduation_project/feature/flat/presentation/view_model/flat_view_model.dart';

class ApartmentDetailsBottomSheet extends StatefulWidget {
  const ApartmentDetailsBottomSheet({super.key});

  @override
  State<ApartmentDetailsBottomSheet> createState() =>
      _ApartmentDetailsBottomSheetState();
}

class _ApartmentDetailsBottomSheetState
    extends State<ApartmentDetailsBottomSheet> {
  Flat? flat;

  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
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
              CustomTextField(
                labelText: 'Upload Photos',
                prefixIcon: Icons.photo,
              ),
              SizedBox(height: 16),
              CustomTextField(
                labelText: 'Price',
                prefixIcon: Icons.attach_money,
                keyboardType: TextInputType.number,
                onSubmitted: (value) {
                  flat!.price = value;
                },
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      onSubmitted: (value) {
                        flat!.numBathroom = value;
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
                        flat!.numRooms = value;
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
                        flat!.space = value;
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
                  flat!.description = value;
                },
                labelText: 'Description',
                prefixIcon: Icons.description,
                maxLines: 3,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate() &&
                      flat!.images!.isNotEmpty &&
                      flat!.landlordId!.isNotEmpty) {
                    BlocProvider.of<FlatViewModel>(context)
                        .addFlatToSupabase(flat: flat!);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(175, 0, 89, 79),
                ),
                child: Text(
                  'Submit',
                  style: AppStyles.textStyle18White,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
