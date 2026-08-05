import 'package:flutter/material.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/profile/my_menu/presentation/screens/delay-menus/sec_delay_menu_form.dart';
import 'package:scraapy_pro/widgets/custom_text_field.dart';

class InspectionForm extends StatelessWidget {
  const InspectionForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(title: 'العمليات المعلقة',
                  ),
                  Text('فحص الطلب #124',style:
                  TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: AppColors.primary),),
                  SizedBox(height: 12,),
                  Row(
                    children: [
                      Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                      SizedBox(width: 6,),
                      Text('معلومات العقار',style:
                      TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.primary),),

                    ],
                  ),
                  SizedBox(height: 12,),

                  CustomTextField(hint: 'اختر نوع العقار',label: 'نوع العقار',),
                  CustomTextField(hint: 'ادخل المساحة',label: 'مساحة الأرض (م²)',),
                  CustomTextField(hint: 'ادخل المساحة',label: 'مساحة البناء (م²)',),
                  CustomTextField(hint: 'ادخل عدد الطوابق',label: 'عدد الطوابق',),
                  CustomTextField(hint: 'ادخل عدد الغرف',label: 'عدد الغرف',),
                  CustomTextField(hint: 'ادخل عدد المطابخ',label: 'عدد المطابخ',),
                  CustomTextField(hint: 'ادخل عدد الدورات',label: 'عدد دورات المياة',),
                  CustomTextField(hint: 'ادخل عدد الأقبية',label: 'عدد الأقبية',),
                  CustomTextField(hint: 'ادخل المدينة',label: 'المدينة',),
                  CustomTextField(hint: 'ادخل المنطقة',label: 'المنطقة',),
                  CustomTextField(hint: 'ادخل اسم الشارع',label: 'الشارع',),
                  CustomTextField(hint: 'ادخل اسم الشخص',label: 'اسم الشخص',),
                  CustomTextField(hint: 'ادخل رقم الجوال',label: 'رقم الجوال',),
                  CustomTextField(hint: 'ادخل عدد المواقف',label: 'عدد مواقف السيارات',),
                  CustomTextField(
                    maxLines: 3,
                    hint: 'ادخل الوصف العقار هنا او استخدم التسجيل الصوتي',label: 'وصف العقار (اختياري)',),

                  SizedBox(height: 30,),
                  MainAppBtn(title: 'حفظ'),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(child: MainAppBtn(title: 'التالي',haveGradient: false,)),
                      const SizedBox(width: 10),

                      Expanded(child: MainAppBtn(
                        onTap: (){

                        },
                        title: 'استكمل احقا',haveGradient: false,
                        btnColor:AppColors.secBtnColor ,titleStyle: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),
                        border: Border.all(color: AppColors.secBtnBorderColor),
                      )),

                    ],
                  ),

                  SizedBox(height: 30,)












                ],
              ),
            ),
          )
      ),
    );
  }
}

