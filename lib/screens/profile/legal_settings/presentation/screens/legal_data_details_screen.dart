import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';

import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/screens/edit_personal_account.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/screens/transactions_screen.dart';
import 'package:scraapy_pro/widgets/custom_text_field.dart';

class LegalDataDetailsScreen extends StatelessWidget {
  LegalDataDetailsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // backgroundColor: Color(0xFFF9F9F9),
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              CustomAppBar(title: 'المعلومات القانونية',),

              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(0),
                  children: [

                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0x33000000)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                                SizedBox(width: 10,),

                                Text('تفاصيل الشركة',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,
                                    color:AppColors.primary )),
                              ],
                            ),
                            SizedBox(height: 16,),
                            const CustomTextField(
                              hint: 'الموقع',
                              label: 'الموقع',
                            ),
                            MainAppBtn(title: 'تعديل', titleStyle: null,  btnColor: AppColors.primary,haveGradient: false,),
                            SizedBox(height: 20,),
                            const CustomTextField(
                              hint: 'رقم الهاتف الرسمي',
                              label: 'رقم الهاتف الرسمي',
                            ),
                            const CustomTextField(
                              hint: 'ادخل العنوان',
                              label: 'عنوان البريد الإلكتروني الرسمي',
                            ),



                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0x33000000)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                                SizedBox(width: 10,),

                                Text('تفاصيل جهة الإتصال',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,
                                    color:AppColors.primary )),
                              ],
                            ),
                            SizedBox(height: 16,),
                            const CustomTextField(
                              hint: 'ادخل الإسم',
                              label: 'الإسم',
                            ),
                            const CustomTextField(
                              hint: 'ادخل المنصب',label: 'المنصب',
                            ),
                            const CustomTextField(
                              hint: 'رقم الإتصال',label: 'رقم الإتصال',
                            ),
                            const CustomTextField(
                              hint: 'البريد الالكتروني',label: 'عنوان البريد الإلكتروني الرسمي',
                            ),



                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0x33000000)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                                SizedBox(width: 10,),

                                Text('تفاصيل المستندات التجارية',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,
                                    color:AppColors.primary )),
                              ],
                            ),
                            SizedBox(height: 16,),
                            const CustomTextField(
                              hint: 'ادخل الرقم',
                              label: 'رقم السجل التجاري',
                            ),

                            const CustomTextField(
                              hint: 'ادخل الرقم',
                              label: 'رقم ضريبة القيمة المضافة',
                            ),


                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0x33000000)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                                SizedBox(width: 10,),

                                Text('مستند السجل التجاري',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,
                                    color:AppColors.primary )),
                              ],
                            ),
                            SizedBox(height: 16,),
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
                                        'انقر للتحميل / اسحب الملف.pdf file format (max. 20MB)',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,
                                        color:Color(0x71000000) )),

                                  ],
                                ),
                              ),
                            ),



                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 16,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Color(0x33000000)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                                SizedBox(width: 10,),

                                Text('مستند ضريبة القيمه المضافة',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,
                                    color:AppColors.primary )),
                              ],
                            ),
                            SizedBox(height: 16,),
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
                                        'انقر للتحميل / اسحب الملف.pdf file format (max. 20MB)',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,
                                        color:Color(0x71000000) )),

                                  ],
                                ),
                              ),
                            ),



                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 24,),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




