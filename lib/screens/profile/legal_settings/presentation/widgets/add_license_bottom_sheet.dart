
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/widgets/custom_text_field.dart';

class AddLicenseBottomSheet {


  addLicenseBottomSheet(BuildContext context){
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(

              mainAxisSize: MainAxisSize.min,
              children: [
                Text('إضافة ترخيص موان', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600)),
                SizedBox(height: 20),
                CustomTextField(hint: 'ادخل رقم الترخيص',label: 'رقم ترخيص موان',),
                SizedBox(height: 16),
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

                            Text('تحميل ترخيص موان',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,
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
                SizedBox(height: 20),

                MainAppBtn(title: 'إرسال', titleStyle: null,)


              ],
            ),
          ),
        );
      },
    );
  }
}