import 'package:flutter/material.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body:Column(
        children: [
          SizedBox(height: 60,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap:(){
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,width: 40,
                    decoration: BoxDecoration(
                        color: AppColors.grey,

                        borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    child: Icon(Icons.arrow_back_ios_sharp),

                  ),
                ),

                Text('الخدمات'),
                Container()
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 24),
              child: GridView.builder(
                itemCount: 10, // number of items
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, //
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.75, // التحكم في الطول والعرض
                ),
                itemBuilder: (context, index) {
                  return Container(
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(color:Colors.grey),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            height: 102,
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                child: Image.asset(AppImages.serviceImg,fit: BoxFit.cover,))),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('1500'),
                                  Text('منتج للتصدير'),
            
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('28 الكمية المتوفرة'),
                                  SizedBox(width: 4,),
                                  Image.asset(AppImages.icon),
                                ],
                              ),

                              MainAppBtn(
                                  title: 'إضافة عرض سعر',
                                  padding: EdgeInsets.symmetric(horizontal: 20,vertical: 4),
                                  titleStyle: TextStyle(color: Colors.white), btnColor: AppColors.primary),

                              SizedBox(height: 8,),
                              Container(
                                height: 30,
                                width: 70,
                                decoration: BoxDecoration(
                                  border: Border.all(color:  AppColors.primary,),
                                  borderRadius: BorderRadius.all(Radius.circular(4))
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('+'),
                                      Text('0'),
                                      Text('-'),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),

            
                      ],
                    )
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
