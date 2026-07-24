import 'package:flutter/material.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';

class ImportHazardousWaste extends StatelessWidget {
  const ImportHazardousWaste({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(

                children: [
                  CustomAppBar(title: 'الأذونات',
                  ),

                ],
              ),
            ),
          )
      ),
    );

  }
}

