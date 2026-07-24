import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/widgets/custom_text_field.dart';

class AddServicesMenusScreen extends StatelessWidget {
  const AddServicesMenusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

        
        
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
        
            CustomTextField(hint: 'ادخل اسم المنتج',label: 'اسم المنتج',),
            CustomTextField(hint: 'hs code',label: 'كود الHs',),
            CustomTextField(hint: 'ادخل الوصف',label: 'الوصف',maxLines: 3,),
            SizedBox(height: 16,),
            Row(
              children: [
                Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                SizedBox(width: 6,),
                Text('السعر',style:
                TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.primary),),
        
              ],
            ),
            SizedBox(height: 12,),
            CustomTextField(hint: 'ادخل السعر',label: 'السعر',),
            SizedBox(height: 16,),
            Row(
              children: [
                Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                SizedBox(width: 6,),
                Text('الصور ',style:
                TextStyle(fontWeight: FontWeight.w500,fontSize: 12,color: AppColors.primary),),
        
              ],
            ),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(AppImages.upload),
                    SizedBox(height: 12,),
                    Text(
                        textAlign: TextAlign.center,
                        'صورة واحدة مطلوبة كحد أدنى، والحد الأقصى 10 صور',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,
                        color:Color(0x71000000) )),
        
                  ],
                ),
              ),
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
        

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MainAppBtn(
                  onTap: (){
                  },
                  width: MediaQuery.of(context).size.width * 0.44,
                  title: 'حفظ', titleStyle: null,),
                MainAppBtn(
                  onTap: (){

                    // Navigator.push(context, MaterialPageRoute(builder: (_) =>  DocsShowScreen()));

                  },
                  width: MediaQuery.of(context).size.width * 0.44,
                  border: Border.all(color: Color(0xFFD1D5DB),width: 1.5),
                  title: 'إضافة منتج جديد', titleStyle: TextStyle(
                    color: Colors.black,fontWeight: FontWeight.w500,fontSize: 16
                ),btnColor: Color(0xFFF3F4F6),haveGradient: false,),

              ],
            ),

            SizedBox(height: 24,),
        
        
        
        
          ],
        ),
      ),
    );
  }
}

