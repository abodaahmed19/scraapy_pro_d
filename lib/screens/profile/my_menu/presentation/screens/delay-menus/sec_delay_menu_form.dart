import 'package:flutter/material.dart';

import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/profile/my_menu/presentation/screens/delay-menus/third_delay_menu_form.dart';

class SecDelayMenuForm extends StatelessWidget {
  const SecDelayMenuForm({super.key});

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
                      Text('طلب عرض منتج',style:
                      TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.primary),),

                    ],
                  ),
                  SizedBox(height: 12,),

                  Container(
                    width: MediaQuery.of(context).size.width,

                    decoration: BoxDecoration(
                      color: Color(0x99F4F4F4),
                      border: Border.all(color: Color(0x5000000)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 4),
                      child: Row(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(value: false, onChanged: (val){}),
                          SizedBox(width: 6,),
                          Container(
                            child: Text(
                                textAlign: TextAlign.center,
                                'خصة تسجيل الشاحنة في موان',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,
                                color:Colors.black )),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0x99F4F4F4),
                      border: Border.all(color: Color(0x5000000)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 4),
                      child: Row(

                        children: [
                          Checkbox(value: false, onChanged: (val){}),
                          SizedBox(width: 6,),
                          Container(
                            child: Text(
                                textAlign: TextAlign.center,
                                'رخصة القيادة',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,
                                color:Colors.black )),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0x99F4F4F4),
                      border: Border.all(color: Color(0x5000000)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 4),
                      child: Row(

                        children: [
                          Checkbox(value: false, onChanged: (val){}),
                          SizedBox(width: 6,),
                          Container(
                            child: Text(
                                textAlign: TextAlign.center,
                                'إستمارة السيارة',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,
                                color:Colors.black )),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0x99F4F4F4),
                      border: Border.all(color: Color(0x5000000)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(value: false, onChanged: (val){}),
                          SizedBox(width: 6,),
                          Container(
                            child: Text(
                                textAlign: TextAlign.center,
                                'رخصة القيادة',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,
                                color:Colors.black )),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0x99F4F4F4),
                      border: Border.all(color: Color(0x5000000)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(value: false, onChanged: (val){}),
                          SizedBox(width: 6,),
                          Container(
                            child: Text(
                                textAlign: TextAlign.center,
                                'شهادة جودة / أو أعمال سابقة',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,
                                color:Colors.black )),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0x99F4F4F4),
                      border: Border.all(color: Color(0x5000000)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(value: false, onChanged: (val){}),
                          SizedBox(width: 6,),
                          Container(
                            child: Text(
                                textAlign: TextAlign.center,
                                'ترخيص وزارة النقل',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,
                                color:Colors.black )),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8,),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0x99F4F4F4),
                      border: Border.all(color: Color(0x5000000)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(value: false, onChanged: (val){}),
                          SizedBox(width: 6,),
                          Container(
                            child: Text(
                                textAlign: TextAlign.center,
                                'رخصة المعدات',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,
                                color:Colors.black )),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
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

