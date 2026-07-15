import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/inspection/inspection_request_screen.dart';
import 'package:scraapy_pro/screens/rentals/presentation/cubit/Retals_cubit.dart';

class ManifestScreen extends StatelessWidget {
  const ManifestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> getIt<RentalsCubit>()..getRentals(),
      child: WillPopScope(
        onWillPop: () async => false, //

        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(

              body: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.0),
                child: SingleChildScrollView(
                  child: Column(

                    children: [
                      CustomAppBar(title: 'المانيفيست',
                      ),

                      itemBlock(context, 'مانيفيست نقل الننفايات الخطرة', 'مواد ضارة تتطلب إجراءات خاصة لضمان نقلها والتخلص منها بشكل آمن.',
                          AppImages.m1),
                      SizedBox(height: 16,),
                      itemBlock(context, 'مانيفيست نقل النفايات غير الخطرة', 'مخلفات آمنة يمكن التعامل معها بطرق تقليدية دون مخاطر كبيرة.',AppImages.m2),


                    ],
                  ),
                ),
              )
          ),
        ),
      ),
    );
  }

  Widget itemBlock(BuildContext context,String title,String description,String img){
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.09), // shadow color
            blurRadius: 8, // softness
            spreadRadius: 2, // size
            offset: Offset(0, 4), // position (x, y)
          ),
        ],

      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,width: 40,
              decoration: BoxDecoration(
                  color: AppColors.lightBlue,
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(img),
              ),
            ),
            SizedBox(height: 12,),
            Text(title,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
            SizedBox(height: 10,),
            Text(description,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
            SizedBox(height: 16,),
            MainAppBtn(title: 'إصدار المانيفيست',onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => const InspectionRequestScreen()));

            },)
          ],
        ),
      ),
    );
  }

}

