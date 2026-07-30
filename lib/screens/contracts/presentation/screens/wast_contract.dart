import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/widgets/custom_text_field.dart';

class WastContract extends StatelessWidget {
  final String title;
  const WastContract({super.key, required this.title});

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
                  CustomAppBar(title: 'العقود',
                  ),

                  Text(title,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: AppColors.primary),),
                  SizedBox(height: 16,),
                  Row(
                    children: [
                      Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                      SizedBox(width: 6,),
                      Text('البيانات الأساسية',style:
                      TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.primary),),

                    ],
                  ),
                  SizedBox(height: 12,),

                  CustomTextField(hint: 'ادخل رقم العقد',label: 'رقم العقد',),
                  CustomTextField(hint: 'ادخل اسم المدينة',label: 'المدينة',),
                  CustomTextField(hint: '',label: 'التاريخ الميلادي',),
                  CustomTextField(hint: '',label: 'التاريخ الهجري',),
                  SizedBox(height: 12,),

                  Row(
                    children: [
                      Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                      SizedBox(width: 6,),
                      Text('الطلرف الأول (مقدم الخدمة)',style:
                      TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.primary),),

                    ],
                  ),
                  SizedBox(height: 12,),
                  CustomTextField(hint: 'ادخل اسم الطرف الأول',label: 'اسم الطرف الأول',),
                  CustomTextField(hint: 'ادخل البريد الإلكتروني',label: 'البريد الإلكتروني',),
                  CustomTextField(hint: 'ادخل رقم الجوال',label: 'رقم الجوال',),

                  SizedBox(height: 12,),

                  Row(
                    children: [
                      Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                      SizedBox(width: 6,),
                      Text('الطلرف الثاني (طالب الخدمة)',style:
                      TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.primary),),

                    ],
                  ),
                  SizedBox(height: 12,),
                  CustomTextField(hint: 'ادخل اسم الشركة',label: 'اسم الشركة',),
                  CustomTextField(hint: 'ادخل البريد الإلكتروني',label: 'البريد الإلكتروني',),
                  CustomTextField(hint: 'ادخل رقم الجوال',label: 'رقم الجوال',),
                  SizedBox(height: 12,),

                  Row(
                    children: [
                      Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                      SizedBox(width: 6,),
                      Text('مواقع النفايات',style:
                      TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.primary),),

                    ],
                  ),
                  SizedBox(height: 12,),

                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.white,

                        border: Border.all(color: AppColors.grey4),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('الموقع الأول',style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFFF0000),
                                fontFamily: 'Cairo',
                              ),),
                              SvgPicture.asset(AppImages.remove),

                            ],
                          ),
                          SizedBox(height: 12,),
                          CustomTextField(hint: 'ادخل البريد الإلكتروني',label: 'البريد الإلكتروني',),
                          CustomTextField(hint: 'ادخل رقم الجوال',label: 'رقم الجوال',),
                          CustomTextField(hint: 'ادخل اسم الموظف المسؤول',label: 'الموظف المسؤول',),
                          CustomTextField(hint: 'ادخل العنوان المكاني',label: 'العنوان المكاني',),
                          CustomTextField(hint: 'ادخل اسم المدينة',label: 'المدينة',),

                          MainAppBtn(title: 'إضافة موقع جديد',btnColor: AppColors.primary,haveGradient: false,),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),

                  Row(
                    children: [
                      Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                      SizedBox(width: 6,),
                      Text('اسعار النفايات',style:
                      TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.primary),),

                    ],
                  ),
                  SizedBox(height: 12,),

                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                        border: Border.all(color: AppColors.grey4),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Align(
                              alignment: Alignment.topLeft,
                              child: SvgPicture.asset(AppImages.remove)),

                          SizedBox(height: 12,),
                          CustomTextField(hint: 'ادخل نوع النفايا',label: 'نوع النفايا',),
                          CustomTextField(hint: 'ادخل السعر',label: 'السعر (بالريال)',),

                          MainAppBtn(title: 'إضافة نوع نفايات جديد',btnColor: AppColors.primary,haveGradient: false,),

                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 12,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MainAppBtn(title: 'توليد PDF وحفظ العقد',
                        width: MediaQuery.of(context).size.width * 0.42,
                        titleStyle:   TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.white),
                        padding: EdgeInsets.symmetric(horizontal: 10),),
                      MainAppBtn(title: 'مسح النموذج',
                        width: MediaQuery.of(context).size.width * 0.42,

                        padding: EdgeInsets.symmetric(horizontal: 10),
                        titleStyle: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),
                        btnColor: AppColors.white,haveGradient: false,border: Border.all(color: AppColors.grey4),),

                    ],
                  ),
                  SizedBox(height: 24,),


                ],
              ),
            ),
          )
      ),
    );
  }


}
