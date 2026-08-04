
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/widgets/custom_text_field.dart';

class AddDocsBottomSheet {


  addDocsBottomSheet(BuildContext context){
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                        SizedBox(width: 10,),
                
                        Text('تفاصيل الشركة',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,
                            color:AppColors.primary )),
                      ],
                    ),
                    SizedBox(height: 20),
                    CustomTextField(hint: 'ادخل احداثيات الموقع',label: 'إحداثيات الموقع*',),
                    CustomTextField(hint: 'ادخل العنوان',label: 'العنوان الأول',),
                    CustomTextField(hint: 'ادخل المدينة',label: 'المدينة',),
                    CustomTextField(hint: 'ادخل المنطقة',label: 'المنطقة',),
                    CustomTextField(hint: 'ادخل الرمز',label: 'الرمز البريدي',),
                    CustomTextField(hint: 'ادخل الدولة',label: 'الدولة',),
                    CustomTextField(hint: 'ادخل اسم الشخص',label: 'الشخص المسؤول',),
                    CustomTextField(hint: ' ادخل رقم الإتصال',label: 'رقم الإتصال',),
                    SizedBox(height: 16),

                    MainAppBtn(title: 'حفظ العنوان', titleStyle: null,haveGradient: false,)
                
                
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}