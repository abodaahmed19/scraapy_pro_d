import 'package:flutter/material.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/profile/my_menu/presentation/screens/delay-menus/first_delay_menu_form.dart';
import 'package:scraapy_pro/screens/profile/my_menu/presentation/screens/services_menus/add_services_menus_screen.dart';

class EmptyServicesMenus extends StatelessWidget {
  const EmptyServicesMenus({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [

          Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('لا توجد عروض',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                  SizedBox(height: 20,),
                  Text('حالياً ليس لديك أي منتجات معروضة.',style: TextStyle(
                      color: Color(0xB2000000),
                      fontSize: 16,fontWeight: FontWeight.w400),  textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 60,),
                  MainAppBtn(title: 'إضافة خدمة بدون عقد',
                    onTap: (){


                      Navigator.push(context, MaterialPageRoute(builder: (_) =>  AddServicesMenusScreen() ));

                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
