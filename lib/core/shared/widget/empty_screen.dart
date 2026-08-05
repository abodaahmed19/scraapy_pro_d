import 'package:flutter/material.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';

class EmptyScreen extends StatelessWidget {
  final String title;
  final String subTitle;
  final String btnTitle;
  final Function() func;
  const EmptyScreen({super.key, required this.title, required this.subTitle, required this.btnTitle, required this.func});

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
                  Text(title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                  SizedBox(height: 20,),
                  Text(subTitle,style: TextStyle(
                      color: Color(0xB2000000),
                      fontSize: 16,fontWeight: FontWeight.w400),  textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 60,),
                  MainAppBtn(title: btnTitle,
                    onTap: func,
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
