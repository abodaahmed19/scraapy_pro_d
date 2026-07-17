import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';

class BranchesScreen extends StatelessWidget {
  const BranchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

        backgroundColor: AppColors.background,
        body:
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              CustomAppBar(title: 'قائمة الفروع',),
              Row(
                children: [
                  Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                  SizedBox(width: 10,),

                  Text('الفروع',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,
                      color:AppColors.primary )),
                ],
              ),
              SizedBox(height: 16,),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                    itemCount: 7,
                    padding: EdgeInsets.all(0),
                    itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color:Color(0x33000000),width: 1.4)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [

                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Color(0x4A2563EB),

                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 4),
                                        child: Center(child: Text('1')),
                                      ),
                                    ),
                                    SizedBox(width: 12,),
                                    Text('فرع المدينة المنورة',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,
                                         )),
                                  ],
                                ),
                                SvgPicture.asset(AppImages.remove)
                              ],
                            ),
                            SizedBox(height: 16,),
                            Row(
                              children: [
                                SvgPicture.asset(AppImages.pin),
                                SizedBox(width: 6,),
                                Text('المدينة المنورة',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,
                                     )),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Row(
                              children: [
                                SvgPicture.asset(AppImages.phone),
                                SizedBox(width: 6,),
                                Text('+966 55 987 6543',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,
                                    )),
                              ],
                            ),
                            SizedBox(height: 8,),
                            Row(
                              children: [
                                SvgPicture.asset(AppImages.email),
                                SizedBox(width: 6,),
                                Text('rs34852@gmail.com',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,
                                    color:Color(0xFF234777) )),
                              ],
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MainAppBtn(
                                  width: MediaQuery.of(context).size.width * 0.4,

                                  title: 'التقارير',btnColor: AppColors.primary,haveGradient: false,),
                                MainAppBtn(
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  titleStyle: TextStyle(color:Colors.black),
                                  border: Border.all(color: Color(0x33000000)),
                                  title: 'عرض',btnColor: AppColors.grey,haveGradient: false,),
                                MainAppBtn(
                                  width: MediaQuery.of(context).size.width * 0.2,
                                  titleStyle: TextStyle(color:Colors.black),
                                  border: Border.all(color: Color(0x33000000)),
                                  title: 'تعديل',btnColor: AppColors.grey,haveGradient: false,),
                              ],
                            )


                          ],
                        ),
                      ),
                    ),
                  );
                }),
              )

            ],
          ),
        ),
      ),
    );
  }

}

