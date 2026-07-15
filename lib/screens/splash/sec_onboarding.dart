import 'package:flutter/material.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/screens/home/presentation/screens/home_screen.dart';
import 'package:scraapy_pro/screens/main/main_layout.dart';

class SecOnboarding extends StatelessWidget {
  const SecOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          width: 100000,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.second_onboard),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('سكرابي برو',style: TextStyle(color: AppColors.white,fontSize: 28,fontWeight: FontWeight.w700),),
                SizedBox(height: 20,),
                Text('اطلب جمع النفايات من مكانك وحدد الوقت المناسب ليك.',style: TextStyle(color: AppColors.white,fontSize: 18,fontWeight: FontWeight.w600),),
                SizedBox(height: 50,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MainAppBtn(title: 'التالي',width: 80,onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const MainLayout()),
                      );
                    },),

                  ],
                ),
                SizedBox(height: 50,),

              ],
            ),
          ),
        ),
      ),
    );
  }

}
