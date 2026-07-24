import 'package:flutter/material.dart';

import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/profile/my_menu/presentation/screens/delay-menus/third_delay_menu_form.dart';
import 'package:scraapy_pro/widgets/custom_text_field.dart';

class LastDelayForm extends StatelessWidget {
  const LastDelayForm({super.key});

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




                  Row(
                    children: [
                      Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                      SizedBox(width: 6,),
                      Text('التفاصيل',style:
                      TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.primary),),

                    ],
                  ),
                  SizedBox(height: 12,),
                  CustomTextField(hint: 'ادخل اسم المنتج',label: 'اسم المنتج',),
                  SizedBox(height: 12,),
                  RichText(
                    text: TextSpan(
                      text: 'label',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color:  Colors.black87,
                        fontFamily: 'Cairo',
                      ),
                      
                    ),
                  ),
                  const SizedBox(height: 8),
                  CustomTextField(hint: 'ادخل الوصف',maxLines: 3,label: 'الوصف',),




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
                                textAlign: TextAlign.start,
                                'سيتم خصم رسوم خدمة قدرها 100 ريال سعودي / A service fee of 100 SAR will be applied.',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,
                                color:Colors.black )),
                          ),

                        ],
                      ),
                    ),
                  ),



                  SizedBox(height: 16,),

                  MainAppBtn(title: 'التالي',haveGradient: false,btnColor: AppColors.primary,onTap: (){

                    Navigator.push(context, MaterialPageRoute(builder: (_) =>  ThirdDelayMenuForm()));

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

