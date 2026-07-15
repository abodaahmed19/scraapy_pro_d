import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';

import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/widgets/custom_text_field.dart';

class EditPersonalAccountScreen extends StatelessWidget {
  const EditPersonalAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFF9F9F9),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              CustomAppBar(title: 'تعديل الملف الشخصي',),
              // PersonalInfoWidget(),

              Center(
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Container(
                      height: 80,width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10000)
                      ),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10000),
                          child: Image.network(
                              fit: BoxFit.cover,
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHLt1Maa11qirS2kVC4ylQI3mZU9EyrpMj0Oe7b-kPHA&s=10')),
                    ),
                    Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color:AppColors.primary,// you can change color
                          borderRadius: BorderRadius.circular(8), // rounded edges
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(AppImages.white_edit,width: 20,height: 20,),
                        )
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              const CustomTextField(
                label: 'الإسم',
                hint: 'ادخل الإسم',
              ),
              const CustomTextField(
                label: 'رقم الجوال',
                hint: 'ادخل رقم الجوال',
              ),

              MainAppBtn(title: 'حفظ', titleStyle: null, btnColor: null,)




        ],
          ),
        ),
      ),
    );
  }
}




