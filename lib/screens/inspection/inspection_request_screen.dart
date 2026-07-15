import 'package:flutter/material.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import '../../widgets/responsive_layout.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/map_placeholder.dart';

class InspectionRequestScreen extends StatefulWidget {
  const InspectionRequestScreen({super.key});

  @override
  State<InspectionRequestScreen> createState() => _InspectionRequestScreenState();
}

class _InspectionRequestScreenState extends State<InspectionRequestScreen> {
  bool _acceptFee = false;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('طلبات الفحص والهدم'),
        //   centerTitle: true,
        // ),
        body: ResponsiveLayout(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomAppBar(title: 'طلبات الفحص والهدم',
                ),
                const Text(
                  'فحص وتدقيق',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF234777),
                    fontFamily: 'Cairo',
                  ),
                ),
                const SizedBox(height: 16),

                const CustomTextField(
                  label: 'اسم الشخص المطلوب زيارته',
                  hint: 'ادخل اسم الشخص',
                ),
                const CustomTextField(
                  label: 'رقم الجوال',
                  hint: 'ادخل رقم الجوال',
                  isRequired: true,
                ),

                const MapPlaceholder(),
                const SizedBox(height: 24),

                const CustomTextField(
                  label: 'الشارع / الحي',
                  hint: 'ادخل اسم الشارع / الحي',
                ),
                const CustomTextField(
                  label: 'اسم المدينة',
                  hint: 'ادخل اسم المدينة',
                ),
                const CustomTextField(
                  label: 'اسم المنطقة',
                  hint: 'اختر اسم المنطقة',
                  isDropdown: true,
                ),
                const CustomTextField(
                  label: 'اسم الدولة',
                  hint: 'ادخل اسم الدولة',
                ),
                const CustomTextField(
                  label: 'ملاحظات اضافية',
                  hint: 'اي ملاحظات اضافية..',
                  maxLines: 4,
                  isRequired: true,
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: _acceptFee,
                      onChanged: (val) {
                        setState(() {
                          _acceptFee = val ?? false;
                        });
                      },
                      activeColor: const Color(0xFF189491),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text(
                          'سيتم خصم رسوم خدمة قدرها 100 ريال سعودي / A service fee of 100 SAR will be applied.',
                          style: TextStyle(
                            fontSize: 12,
                            color: isDark ? Colors.white70 : Colors.black87,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                ElevatedButton(
                  onPressed: _acceptFee ? () {} : null,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color(0xFF189491), // Specific Teal color from Figma
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('إرسال الطلب', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
