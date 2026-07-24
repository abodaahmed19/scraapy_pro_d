import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/profile/legal_settings/presentation/widgets/add_docs_bottom_sheet.dart';
import 'package:scraapy_pro/screens/profile/legal_settings/presentation/widgets/add_license_bottom_sheet.dart';
import 'package:scraapy_pro/widgets/custom_text_field.dart';

class DocsShowScreen extends StatelessWidget {
  const DocsShowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              CustomAppBar(title: 'عرض المستندات',),

              SizedBox(height: 16,),
              CustomTextField(hint: 'ادخل اسم المستند',label: 'اسم المستند',),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                    itemCount: 10,
                    padding: EdgeInsets.all(0),
                    itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Container(

                      decoration: BoxDecoration(
                        color: Color(0xFFF6F6F6),
                        border: Border.all(color: Color(0x1A000000)),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(AppImages.pdf),
                                SizedBox(width: 10,),
                                Text('المانيفيست .Pdf',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,
                                    color:Color(0xB2000000) ))
                              ],
                            ),
                            Container(
                              height: 30,width: 30,
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: SvgPicture.asset(AppImages.download),
                              ),
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

