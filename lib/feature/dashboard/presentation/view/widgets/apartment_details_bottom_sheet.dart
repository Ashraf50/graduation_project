import 'package:flutter/material.dart';
import 'package:graduation_project/core/constant/app_style.dart';
import 'package:graduation_project/feature/dashboard/presentation/view/widgets/custom_text_field.dart';

class ApartmentDetailsBottomSheet extends StatelessWidget {
  const ApartmentDetailsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            ),
            SizedBox(height: 16),
            Row(
              children: const [
                Expanded(
                  child: CustomTextField(
                    labelText: 'Bathrooms',
                    prefixIcon: Icons.bathtub,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: CustomTextField(
                    labelText: 'Bedrooms',
                    prefixIcon: Icons.bed,
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: CustomTextField(
                    labelText: 'Space (sqm)',
                    prefixIcon: Icons.square_foot,
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            CustomTextField(
              labelText: 'Description',
              prefixIcon: Icons.description,
              maxLines: 3,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
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
    );
  }
}
