import 'package:flutter/material.dart';
import '../../widgets/responsive_layout.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/map_placeholder.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('إضافة عنوان جديد'),
        centerTitle: true,
      ),
      body: ResponsiveLayout(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const MapPlaceholder(),
              const SizedBox(height: 24),
              const CustomTextField(
                label: 'إسم العنوان (الفرع)',
                hint: 'ادخل العنوان',
              ),
              const CustomTextField(
                label: 'العنوان الأول',
                hint: 'ادخل العنوان',
              ),
              const CustomTextField(
                label: 'اسم الموقع',
                hint: 'ادخل عنوانك',
              ),
              const CustomTextField(
                label: 'المدينة',
                hint: 'اسم المدينة',
              ),
              const CustomTextField(
                label: 'المنطقة',
                hint: 'ادخل المنطقة',
              ),
              const CustomTextField(
                label: 'الرمز البريدي',
                hint: 'ادخل الرمز',
              ),
              const CustomTextField(
                label: 'الدولة',
                hint: 'ادخل دولتك',
              ),
              const CustomTextField(
                label: 'الشخص المسؤول',
                hint: 'ادخل اسم الشخص',
              ),
              const CustomTextField(
                label: 'رقم الإتصال',
                hint: 'ادخل رقم الاتصال',
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('حفظ العنوان', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
