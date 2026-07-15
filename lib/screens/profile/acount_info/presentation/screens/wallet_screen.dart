import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';

import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/screens/edit_personal_account.dart';
import 'package:scraapy_pro/widgets/custom_text_field.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // backgroundColor: Color(0xFFF9F9F9),
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              CustomAppBar(title: 'المحفظة',),
              Container(
                width: double.infinity,
                // height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.primary,
                      AppColors.terquaz,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('الرصيد الحالي',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,
                          color:AppColors.white )),
                      Row(
                        children: [
                          Text('158,000',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,
                              color:AppColors.white )),
                          Text('ريال',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,
                              color:AppColors.white )),
                        ],
                      ),
                      SizedBox(height: 16,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0x3DFFFFFF)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ادارة رصيدك',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,
                                  color:AppColors.white )),
                              SizedBox(height: 4,),
                              Text('Id : 2144 2351 2148 142',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,
                                  color:AppColors.white )),
                            ],
                          ),
                        ),
                      )
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

                          Text('تحويل',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,
                              color:AppColors.primary )),
                        ],
                      ),
                      SizedBox(height: 16,),
                      const CustomTextField(
                        hint: 'رقم الهاتف',
                      ),
                      const CustomTextField(
                        hint: 'المبلغ',
                      ),
                      const CustomTextField(
                        hint: 'الوصف(اختياري)',
                      ),
                      MainAppBtn(title: 'تحويل', titleStyle: null, btnColor: null,)


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

                          Text('طلب تحويل بنكي',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,
                              color:AppColors.primary )),
                        ],
                      ),
                      SizedBox(height: 16,),
                      const CustomTextField(
                        hint: 'المبلغ',
                      ),
                      const CustomTextField(
                        hint: 'اختر البنك',
                      ),
                      const CustomTextField(
                        hint: 'رقم IBAN',
                      ),
                      const CustomTextField(
                        hint: 'البريد الالكتروني',
                      ),
                      const CustomTextField(
                        hint: 'رقم الهاتف',
                      ),
                      MainAppBtn(title: 'طلب تحويل بنكي', titleStyle: null, btnColor: null,)


                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}




