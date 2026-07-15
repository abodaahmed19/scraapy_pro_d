import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/inspection/inspection_request_screen.dart';
import 'package:scraapy_pro/screens/rentals/presentation/cubit/Retals_cubit.dart';

class InspectionReqScreen extends StatelessWidget {
  const InspectionReqScreen({super.key});

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
                      CustomAppBar(title: 'طلبات الفحص والهدم',
                      ),
                  
                      itemBlock(context, 'فحص وتدقيق', 'صفحة مخصصة لعرض ومراجعة طلبات الملفات والدقيقة والدقيقة من دقتها.',
                          AppImages.check1),
                      SizedBox(height: 16,),
                      itemBlock(context, 'فحص وتثمين', 'صفحة مخصصة لفحص الأصول وتقييمها لتحديد قيمتها بدقة.',AppImages.check2),
                      SizedBox(height: 16,),

                      itemBlock(context, 'فحص وهدم', 'صفحة مخصصة لفحص المواقع واتخاذ قرار الهدم وفق المعايير.',AppImages.check3),
                  
                  
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
      child: Column(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
              child: Image.asset(img,height: 125,fit: BoxFit.cover,width: double.infinity,)),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 12,),
                Text(title,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                SizedBox(height: 10,),
                Text(description,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                SizedBox(height: 16,),
                MainAppBtn(title: 'عرض',onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const InspectionRequestScreen()));

                },)
              ],
            ),
          ),
        ],
      ),
    );
  }

}

