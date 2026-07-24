import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/widgets/custom_text_field.dart';

class OrderShowProduct extends StatelessWidget {
  const OrderShowProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomAppBar(title: 'طلب عرض منتج',
                  ),



                  CustomTextField(hint: 'ادخل احداثيات الموقع',label: 'إحداثيات الموقع*',),
                  CustomTextField(hint: 'ادخل عوانك',label: 'العنوان الأول',),
                  CustomTextField(hint: 'ادخل مدينتك',label: 'المدينة',),
                  CustomTextField(hint: 'ادخل منطقتك',label: 'المنطقة',),

                  CustomTextField(hint: 'ادخل بلدك',label: 'الدولة',),
                  CustomTextField(hint: 'ادخل اسم الشخص',label: 'الشخص المسؤول',),
                  CustomTextField(hint: 'رقم الإتصال',label: 'رقم الإتصال',),
                  MainAppBtn(title: 'حفظ العنوان',haveGradient: false,btnColor: AppColors.primary,),
                  SizedBox(height: 16,),
                  CustomTextField(hint: 'اختر الفئة',label: 'الفئة',),
                  CustomTextField(hint: 'اختر الفئة الفرعية',label: 'الفئة الفرعية',),
                  CustomTextField(hint: 'ادخل اسم المنتج',label: 'اسم المنتج',),
                  CustomTextField(hint: 'ادخل hs code',label: '**Hs Code',),
                  CustomTextField(hint: 'ادخل الوصف',label: 'الوصف',),
                  Row(
                    children: [
                      Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                      SizedBox(width: 6,),
                      Text('المخزون المتاح وكيف ترغب بيعة',style:
                      TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.primary),),

                    ],
                  ),
                  SizedBox(height: 12,),
                  CustomTextField(hint: 'ادخل الكمية',label: 'الكمية',),
                  CustomTextField(hint: 'اختر نوع الوحدة',label: 'نوع الوحدة',),
                  CustomTextField(hint: 'ادخل الحد الأدني',label: 'الحد الأدني لكمية الطلب*',),

                  Row(
                    children: [
                      Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                      SizedBox(width: 6,),
                      Text('السعر',style:
                      TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.primary),),

                    ],
                  ),
                  SizedBox(height: 12,),
                  CustomTextField(hint: 'ادخل السعر',label: 'السعر',),
                  CustomTextField(hint: 'اختر نوع الوحدة',label: 'نوع الوحدة',),
                  Row(
                    children: [
                      Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                      SizedBox(width: 6,),
                      Text('الصور',style:
                      TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.primary),),

                    ],
                  ),
                  SizedBox(height: 12,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xFFF4F4F4),
                      border: Border.all(color: Color(0x33000000)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20),
                      child: Row(

                        children: [
                          Checkbox(value: false, onChanged: (val){}),
                          SizedBox(width: 6,),
                          Container(
                            width: MediaQuery.of(context).size.width *0.7,
                            child: Text(
                                textAlign: TextAlign.center,
                                'سيتم خصم رسوم خدمة قدرها 100 ريال سعودي / A service fee of 100 SAR will be applied.',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,
                                color:Colors.black )),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12,),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xFFF4F4F4),
                      border: Border.all(color: Color(0x33000000)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(AppImages.upload),
                          SizedBox(height: 12,),
                          Text(
                              textAlign: TextAlign.center,
                              'صورة واحدة مطلوبة كحد أدنى، والحد الأقصى 10 صور',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,
                              color:Color(0x71000000) )),

                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 16,),

                  MainAppBtn(title: 'حفظ'),
                  SizedBox(height: 16,),




                ],
              ),
            ),
          )
      ),
    );
  }
}

