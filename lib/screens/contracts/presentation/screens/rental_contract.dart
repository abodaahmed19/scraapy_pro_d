import 'package:flutter/material.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/widgets/custom_text_field.dart';

class RentalContract extends StatelessWidget {
  const RentalContract({super.key});

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

                  Text('عقد إيجار',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: AppColors.primary),),
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
                  CustomTextField(hint: '',label: 'التاريخ الميلادي',),
                  CustomTextField(hint: '',label: 'التاريخ الهجري',),
                  SizedBox(height: 12,),

                  Row(
                    children: [
                      Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                      SizedBox(width: 6,),
                      Text('الطرف الأول (المورد)',style:
                      TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.primary),),

                    ],
                  ),
                  SizedBox(height: 12,),
                  CustomTextField(hint: 'ادخل اسم المورد',label: 'اسم المورد',),
                  CustomTextField(hint: 'ادخل نوع النشاط',label: 'نوع النشاط',),

                  SizedBox(height: 12,),

                  Row(
                    children: [
                      Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                      SizedBox(width: 6,),
                      Text('الطرف التاني (الوسيط)',style:
                      TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.primary),),

                    ],
                  ),
                  SizedBox(height: 12,),
                  CustomTextField(hint: 'ادخل اسم الوسيط',label: 'اسم الوسيط',),
                  CustomTextField(hint: 'ادخل اسم الشركة',label: 'سجل الشركة',),
                  CustomTextField(hint: 'ادخل رقم السجل',label: 'السجل التجاري',),

                  SizedBox(height: 12,),

                  Row(
                    children: [
                      Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                      SizedBox(width: 6,),
                      Text('الطرف التالت (المشتري / المستاجر)',style:
                      TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.primary),),

                    ],
                  ),
                  SizedBox(height: 12,),
                  CustomTextField(hint: 'ادخل اسم المشتري / المستاجر',label: 'اسم المشتري / المستاجر',),


                  SizedBox(height: 12,),

                  Row(
                    children: [
                      Icon(Icons.circle,color: Colors.red,size: 10,),
                      SizedBox(width: 6,),
                      Text('الرسوم والأشتراكات',style:
                      TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.primary),),

                    ],
                  ),
                  SizedBox(height: 12,),
                  CustomTextField(hint: 'ادخل نوع الاشتراك',label: 'نوع الرسوم',),
                  CustomTextField(hint: 'ادخل قيمة الشراء',label: 'القيمة',),


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
