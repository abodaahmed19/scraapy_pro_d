import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/profile/my_menu/presentation/screens/delay-menus/sec_delay_menu_form.dart';
import 'package:scraapy_pro/widgets/custom_text_field.dart';

class FirstDelayMenuForm extends StatelessWidget {
  const FirstDelayMenuForm({super.key});

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
                  CustomAppBar(title: 'قوائم التاخير',
                  ),



                  CustomTextField(hint: 'ادخل عوانك',label: 'العنوان الأول',),
                  CustomTextField(hint: 'ادخل اسم الموقع',label: 'اسم الموقع*',),

                  CustomTextField(hint: 'ادخل مدينتك',label: 'المدينة',),
                  CustomTextField(hint: 'ادخل منطقتك',label: 'المنطقة',),
                  CustomTextField(hint: 'ادخل الرمز البريدي',label: 'الرمز البريدي',),

                  CustomTextField(hint: 'ادخل بلدك',label: 'الدولة',),
                  CustomTextField(hint: 'ادخل اسم الشخص',label: 'الشخص المسؤول',),
                  CustomTextField(hint: 'رقم الإتصال',label: 'رقم الإتصال',),
                  MainAppBtn(title: 'حفظ العنوان',haveGradient: false,btnColor: AppColors.primary,),
                  SizedBox(height: 16,),
                  CustomTextField(hint: 'اختر الفئة',label: 'الفئة',),
                  CustomTextField(hint: 'اختر الفئة الفرعية',label: 'الفئة الفرعية',),

                  CustomTextField(hint: 'اختر النوع',label: 'النوع',),
                  CustomTextField(hint: 'اختر الطراز',label: 'طراز المركبة',),
                  CustomTextField(hint: 'اختر اسنة',label: 'سنة المصنع',),




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

                  SizedBox(height: 16,),

                  MainAppBtn(title: 'التالي',haveGradient: false,btnColor: AppColors.primary,onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (_) =>  SecDelayMenuForm()));

                  },),
                  SizedBox(height: 16,),




                ],
              ),
            ),
          )
      ),
    );
  }
}

