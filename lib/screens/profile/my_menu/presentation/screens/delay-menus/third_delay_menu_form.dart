import 'package:flutter/material.dart';

import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/profile/my_menu/presentation/screens/delay-menus/forth_delay_menu_form.dart';
import 'package:scraapy_pro/widgets/custom_text_field.dart';

class ThirdDelayMenuForm extends StatelessWidget {
  const ThirdDelayMenuForm({super.key});

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
                      Text('السعر',style:
                      TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.primary),),

                    ],
                  ),
                  SizedBox(height: 12,),
                  CustomTextField(hint: 'ادخل السعر',label: 'السعر لكل وحدة',),
                  CustomTextField(hint: 'اختر السعر',label: 'السعر المدفوع للكل',),
                  Row(
                    children: [
                      Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                      SizedBox(width: 6,),
                      Text('التوصيل',style:
                      TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.primary),),

                    ],
                  ),
                  SizedBox(height: 8,),
                  Text(
                    style: TextStyle(fontSize:10 ,fontWeight: FontWeight.w400,color: Color(
                        0xC4000000)),
                      '*ستكون مسؤولاً عن توصيل هذه المعدات إلى موقع العميل وإعادتها إليك عند انتهاء مدة الإيجار، يرجى تقديم تكلفة النقل الذي ستتقاضاه لكل وحدة.'),
                  SizedBox(height: 12,),
                  CustomTextField(hint: 'ريال سعودي',label: 'ريال سعودي',),





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

                    Navigator.push(context, MaterialPageRoute(builder: (_) =>  ForthDelayMenuForm()));

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

