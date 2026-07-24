import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';

import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/rentals/presentation/cubit/Retals_cubit.dart';
import 'package:scraapy_pro/widgets/custom_text_field.dart';

class NonDangerMainfestForm extends StatelessWidget {
  const NonDangerMainfestForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> getIt<RentalsCubit>()..getRentals(),
      child: WillPopScope(
        onWillPop: () async => false, //

        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(

              body: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomAppBar(title: 'المانيفيست',
                      ),

                      Text('مانيفيست نقل النفايات غير الخطرة',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: AppColors.primary),),
                      SizedBox(height: 12,),
                      Row(
                        children: [
                          Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                          SizedBox(width: 6,),
                          Text('معلومات الشحنة الأساسية',style:
                          TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.primary),),

                        ],
                      ),
                      SizedBox(height: 12,),
                      CustomTextField(hint: 'ادخل رقم البيان',label: 'رقم البايان',),
                      CustomTextField(hint: 'ادخل رقم الشحنة',label: 'رقم الشحنة',),
                      CustomTextField(hint: 'ادخل نوع الشحنة',label: 'نوع الشحنة',),
                      CustomTextField(hint: 'اختر نوع الشحنة',label: 'حالة الشحنة',),

                      CustomTextField(hint: 'تاريخ إنشاء البيان',label: 'تاريخ إنشاء البيان',),
                      CustomTextField(hint: 'وقت إنشاء البيان',label: 'وقت إنشاء البيان',),
                      CustomTextField(hint: 'تاريخ الشحنة',label: 'تاريخ الشحنة',),
                      CustomTextField(hint: 'وقت الشحنة',label: 'وقت الشحنة',),
                      CustomTextField(hint: 'ادخل رقم الإتصال',label: 'جهة الإتصال في طوارئ',),

                      SizedBox(height: 12,),
                      Row(
                        children: [
                          Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                          SizedBox(width: 6,),
                          Text('بيانات مولد النفايات',style:
                          TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.primary),),

                        ],
                      ),
                      SizedBox(height: 12,),
                      CustomTextField(hint: 'ادخل اسم الشركة',label: 'اسم الشركة',),
                      CustomTextField(hint: 'ادخل رقم MWAN',label: 'رقم ترخيص MWAN',),
                      CustomTextField(hint: 'ادخل رقم السجل',label: 'رقم السجل التجاري',),
                      CustomTextField(hint: 'ادخل رقم الموحد',label: 'الرقم الموحد',),
                      CustomTextField(hint: 'ادخل رقم NCNE',label: 'رقم NCNE',),
                      CustomTextField(hint: 'ادخل موقع الجمع',label: 'موقع الجمع',),
                      CustomTextField(hint: 'ادخل احداثيات الموقع',label: 'إحداثيات الموقع',),
                      CustomTextField(hint: 'اجخل اسم الشخص المسؤول',label: 'الشخص المسؤول',),
                      CustomTextField(hint: 'ادخل رقم الجوال',label: 'رقم الجوال (المسجل في Absher)',),
                      MainAppBtn(title: 'إضافة منتجات وإنشاء QR Code',btnColor: AppColors.primary,haveGradient: false,),
                      SizedBox(height: 12,),
                      Row(
                        children: [
                          Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                          SizedBox(width: 6,),
                          Text('بيانات نقل النفايات',style:
                          TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.primary),),

                        ],
                      ),
                      SizedBox(height: 12,),
                      CustomTextField(hint: 'ادخل اسم الشركة',label: 'اسم الشركة',),
                      CustomTextField(hint: 'ادخل رقم MWAN',label: 'رقم ترخيص MWAN',),
                      CustomTextField(hint: 'ادخل رقم السجل',label: 'رقم السجل التجاري',),
                      CustomTextField(hint: 'ادخل رقم الموحد',label: 'الرقم الموحد',),
                      CustomTextField(hint: 'ادخل رقم NCNE',label: 'رقم NCNE',),
                      CustomTextField(hint: 'ادخل رقم لوحة الشحنة',label: 'رقم لوحة الشحنة',),
                      CustomTextField(hint: 'ادخل مواصفات الشحنة',label: 'مواصفات الشحنة',),
                      CustomTextField(hint: 'ادخل سعة الشحنة',label: 'سعة الشحنة',),
                      CustomTextField(hint: 'تاريخ استلام الشحنة',label: 'تاريخ استلام الشحنة',),
                      CustomTextField(hint: 'وقت استلام الشحنة',label: 'وقت استلام الشحنة',),
                      MainAppBtn(title: 'إنشاء QR Code ناقل النفايات',btnColor: AppColors.primary,haveGradient: false,),
                      SizedBox(height: 12,),
                      Row(
                        children: [
                          Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                          SizedBox(width: 6,),
                          Text('بيانات المنشأة المعالجة',style:
                          TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.primary),),

                        ],
                      ),
                      SizedBox(height: 12,),
                      CustomTextField(hint: 'ادخل اسم الشركة',label: 'اسم الشركة',),
                      CustomTextField(hint: 'ادخل رقم MWAN',label: 'رقم ترخيص MWAN',),
                      CustomTextField(hint: 'ادخل رقم السجل',label: 'رقم السجل التجاري',),
                      CustomTextField(hint: 'ادخل رقم الموحد',label: 'الرقم الموحد',),
                      CustomTextField(hint: 'ادخل رقم NCNE',label: 'رقم NCNE',),
                      CustomTextField(hint: 'ادخل موقع المنشأة',label: 'موقع المنشأة',),
                      CustomTextField(hint: 'ادخل احداثيات الموقع',label: 'إحداثيات الموقع',),
                      CustomTextField(hint: 'ادخل اسم الشخص المسؤول',label: 'الشخص المسؤول',),
                      CustomTextField(hint: 'ادخل رقم الوحدة',label: 'رقم الوحدة للمنشأة',),
                      CustomTextField(hint: 'ادخل رقم الجوال',label: 'رقم الجوال (المسجل في Absher)',),
                      CustomTextField(hint: '',label: 'تاريخ استلام الشحنة',),
                      CustomTextField(hint: '',label: 'وقت استلام الشحنة',),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MainAppBtn(title: 'إنشاء QR Code المنشأة المعالجة',btnColor: AppColors.primary,haveGradient: false,titleStyle:
                          TextStyle(fontSize: 12,color: AppColors.white),padding: EdgeInsets.symmetric(horizontal: 8),
                          ),
                          MainAppBtn(title: 'إنشاء QR Code الجهة الرقابية',
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              btnColor: AppColors.primary,haveGradient: false,titleStyle:
                              TextStyle(fontSize: 12,color: AppColors.white)),

                        ],
                      ),
                      SizedBox(height: 12,),
                      Row(
                        children: [
                          Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                          SizedBox(width: 6,),
                          Text('وصف النفايات الخطرة',style:
                          TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.primary),),

                        ],
                      ),
                      SizedBox(height: 12,),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.grey4),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              CustomTextField(hint: 'ادخل / اختر اسم النفاية',label: 'اسم النفاية (اختياري)',),
                              CustomTextField(hint: 'ادخل / اختر كود ال HS',label: 'كود ال HS (اختياري)',),
                              CustomTextField(hint: 'ادخل الكمية',label: 'الكمية',),
                              CustomTextField(hint: 'اختر الوحدة المناسبة',label: 'الوحدة (اختياري)',),
                              CustomTextField(hint: 'ادخل المواصفات الخطرة',label: 'المواصفات الخطرة (يتم قرائتها لاحقا)',),
                              CustomTextField(hint: 'ادخل اجرائات المعالجة',label: 'إجرائات المعالجة (يتم قرائتها لاحقا)',),

                              MainAppBtn(title: 'إضافة نوع نفايات جديد',btnColor: AppColors.primary,haveGradient: false,),

                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 12,),

                      MainAppBtn(title: 'اعتماد النموذج',),
                      SizedBox(height: 12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MainAppBtn(title: 'توليد افكار جديدة',
                            width: MediaQuery.of(context).size.width * 0.42,

                            btnColor: AppColors.primary,haveGradient: false,padding: EdgeInsets.symmetric(horizontal: 10),),
                          MainAppBtn(title: 'إعادة تعييين',
                            width: MediaQuery.of(context).size.width * 0.42,
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            titleStyle: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),
                            btnColor: AppColors.white,haveGradient: false,border: Border.all(color: AppColors.grey4),),

                        ],
                      ),

                      SizedBox(height: 24,),


                    ],
                  ),
                ),
              )
          ),
        ),
      ),
    );
  }


}

