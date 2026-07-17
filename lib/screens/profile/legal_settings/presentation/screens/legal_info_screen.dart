import 'package:flutter/material.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/profile/legal_settings/presentation/widgets/add_license_bottom_sheet.dart';

class LegalInfoScreen extends StatelessWidget {
  const LegalInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              CustomAppBar(title: 'المعلومات القانونية',),

              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.white,

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

                          Text('تفاصيل البيانات القانونية',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,
                              color:AppColors.primary )),
                        ],
                      ),
                      SizedBox(height: 12,),

                      Text('تكون مطلوبة عند شراء الخردة أو استئجار المعدات أو الاستفادة من الخدمات.',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,
                          color:Color(0xB2000000) )),
                      SizedBox(height: 20,),

                      // const CustomTextField(
                      //   hint: 'الوصف(اختياري)',
                      // ),
                      MainAppBtn(title: 'إضافة', titleStyle: null,  btnColor: AppColors.primary,haveGradient: false,)


                    ],
                  ),
                ),
              ),
              SizedBox(height: 16,),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.white,
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

                          Text('ترخيص موان',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,
                              color:AppColors.primary )),
                        ],
                      ),
                      SizedBox(height: 12,),

                      Text('مطلوب عند شراء الخردة',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,
                          color:Color(0xB2000000) )),
                      SizedBox(height: 20,),

                      // const CustomTextField(
                      //   hint: 'الوصف(اختياري)',
                      // ),
                      MainAppBtn(title: 'إضافة ترخيص موان',
                        onTap: (){
                          AddLicenseBottomSheet().addLicenseBottomSheet(context);
                        },
                        titleStyle: null,  btnColor: AppColors.primary,haveGradient: false,),
                      SizedBox(height: 20,),
                      Text('مستندات إضافية',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,
                          color:AppColors.primary )),
                      SizedBox(height: 12,),

                      Text('سيتم إضافة أي مستندات يطلبها سكرابى هنا.',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,
                          color:Color(0xB2000000) )),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MainAppBtn(
                            width: MediaQuery.of(context).size.width * 0.4,
                            title: 'إضافة مستندات', titleStyle: null,btnColor: AppColors.primary,haveGradient: false,),
                          MainAppBtn(
                            width: MediaQuery.of(context).size.width * 0.4,
                            border: Border.all(color: Color(0xFFD1D5DB),width: 1.5),
                            title: 'عرض مستندات', titleStyle: TextStyle(
                            color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16
                          ),btnColor: Color(0xFFF3F4F6),haveGradient: false,),

                        ],
                      )

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

