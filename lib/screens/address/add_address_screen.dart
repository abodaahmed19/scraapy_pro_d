import 'package:flutter/material.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import '../../widgets/responsive_layout.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/map_placeholder.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

        body: ResponsiveLayout(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomAppBar(title: 'إضافة عنوان جديد'),
                Text('إضافة فرع جديد',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: AppColors.primary),),
                SizedBox(height: 16,),
                Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(Icons.circle, color: AppColors.terquaz, size: 8),

                    const SizedBox(width: 8),

                    const Text(
                      'البيانات الاساسية',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16,),

                const CustomTextField(
                  label: 'اسم الفرع',
                  hint: 'ادخل اسم الفرع',
                ),
                const CustomTextField(
                  label: 'رقم الشحنة',
                  hint: 'ادخل رقم الشحنة',
                ),
                const CustomTextField(
                  label: 'الشخص المسؤول',
                  hint: 'ادخل اسم الشخص',
                ),

                const CustomTextField(
                  label: 'رقم الهاتف',
                  hint: 'ادخل رقم الهاتف',
                ),
                const CustomTextField(
                  label: 'البريد الإلكتروني',
                  hint: 'اسم البريد الإلكتروني',
                ),
                const CustomTextField(
                  label: 'الرمز البريدي',
                  hint: 'ادخل الرمز',
                ),
                const CustomTextField(
                  label: 'جه الاتصال في الموقع',
                  hint: 'اسم جه الاتصال',
                ),

                const CustomTextField(
                  label: 'المدينة (اختياري)',
                  hint: 'اختر المدينة',
                ),
                const CustomTextField(
                  label: 'المنطقة المختارة*',
                  hint: 'يملأ تلقائيا من الخريطة/ادخل يدويا',
                ),

                const CustomTextField(
                  label: 'رقم الإتصال',
                  hint: 'ادخل رقم الاتصال',
                ),
                const MapPlaceholder(),
                const SizedBox(height: 12),

                const CustomTextField(
                  label: 'إحداثيات الموقع',
                  hint: 'ادخل إحداثيات الموقع',
                ),
                const SizedBox(height: 24),


                Row(
            children: [
              Expanded(child: MainAppBtn(title: 'إضافة فرع'),),
              const SizedBox(width: 10),

              Container(
                  width: MediaQuery.of(context).size.width * 0.2,
                  child: MainAppBtn(
                onTap: (){

                },
                title: 'إلغاء',haveGradient: false,
                btnColor:AppColors.secBtnColor ,titleStyle: TextStyle(color: Colors.black),
                border: Border.all(color: AppColors.secBtnBorderColor),
              )),

            ],
          ),

          const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
