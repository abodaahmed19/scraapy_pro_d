import 'package:flutter/material.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';

class EmptyBranches extends StatelessWidget {
  const EmptyBranches({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          CustomAppBar(title: 'قائمة الفروع',),

          Padding(
            padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('لا توجد فروع مضافة',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                  SizedBox(height: 20,),
                  Text('قم بإضافة فرع جديد لعرض وإدارة جميع فروعك من هنا.',style: TextStyle(
                      color: Color(0xB2000000),
                      fontSize: 16,fontWeight: FontWeight.w400),  textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 60,),
                  MainAppBtn(title: 'إضافة فرع')
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
