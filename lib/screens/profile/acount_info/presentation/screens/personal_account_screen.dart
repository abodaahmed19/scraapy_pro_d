import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/screens/account_info_screen.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/screens/edit_personal_account.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/widgets/baqa_widget.dart';
import 'package:scraapy_pro/screens/profile/legal_settings/presentation/screens/legal_settings_menu.dart';

class PersonalAccountScreen extends StatelessWidget {
  const PersonalAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Color(0xFFF9F9F9),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            padding: EdgeInsets.all(0),
            children: [
              CustomAppBar(title: 'الحساب الشخصى',),
              PersonalInfoWidget(),
              SizedBox(height: 16,),
              BaqaWidget(),
              SizedBox(height: 12,),
              AccountMenu(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        color:Color(0x14FF0000) ,// you can change color
                        borderRadius: BorderRadius.circular(8), // rounded edges
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(AppImages.remove,width: 20,height: 20,),
                      )
                  ),
                  SizedBox(width: 14,),
                  Text('حذف الحساب',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,
                      color:Color(0xFFF70000) )),

                ],
              ),
              SizedBox(height: 24,)


            ],
          ),
        ),
      ),
    );
  }
}


class PersonalInfoWidget extends StatelessWidget {
  const PersonalInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 64,width: 64,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10000)
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10000),
                      child: Image.network(
                          fit: BoxFit.cover,
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTHLt1Maa11qirS2kVC4ylQI3mZU9EyrpMj0Oe7b-kPHA&s=10')),
                ),

                SizedBox(width: 12,),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('أحمد بن حماد',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16),),
                    SizedBox(height: 8,),
                    Text('+966 55 123 4567',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),),
                  ],
                ),



              ],
            ),

            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) => const EditPersonalAccountScreen()));

              },
              child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color:AppColors.lightBlue,// you can change color
                    borderRadius: BorderRadius.circular(8), // rounded edges
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(AppImages.frame,width: 20,height: 20,),
                  )
              ),
            ),

          ],
        ),

      ],
    );
  }
}

class AccountMenu extends StatelessWidget {
   AccountMenu({super.key});

  var menuItem = [
    {
      "title":"معلومات الحساب",
      "icon":"${AppImages.user}",
      "page":AccountInfoScreen()
    },
    {
      "title":"قوائمي",
      "icon":"${AppImages.menus}",
      "page":AccountInfoScreen()

    },
    {
      "title":"العمليات",
      "icon":"${AppImages.menus}",
      "page":AccountInfoScreen()

    },
    {
      "title":"الخدمات اللوجستية",
      "icon":"${AppImages.menus}",
      "page":AccountInfoScreen()

    },
    {
      "title":"العقود والوثائق",
      "icon":"${AppImages.menus}",
      "page":AccountInfoScreen()

    },
    {
      "title":"التقارير",
      "icon":"${AppImages.menus}",
      "page":AccountInfoScreen()

    },
    {
      "title":"الفحص والهدم",
      "icon":"${AppImages.menus}",
      "page":AccountInfoScreen()

    },
    {
      "title":"الإعدادات والقانونية",
      "icon":"${AppImages.menus}",
      "page":LegalSettingsMenu()

    },
    {
      "title":"الإشتراكات",
      "icon":"${AppImages.menus}",
      "page":AccountInfoScreen()

    },


  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: menuItem.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){

          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_) =>  menuItem[index]['page'] as Widget ));


              },
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Row(
                      children: [

                        Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color:AppColors.lightBlue,// you can change color
                              borderRadius: BorderRadius.circular(8), // rounded edges
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset('${menuItem[index]['icon']}',width: 20,height: 20,),
                            )
                        ),
                        SizedBox(width: 14,),
                        Text('${menuItem[index]['title']}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,
                            color:Color(0xFF234777) )),

                      ],
                    ),
                    Icon(Icons.arrow_forward_ios_outlined,size: 14,color: Color(
                        0x89000000),),
                  ],
                ),
              ),
            ),
          );
    });
  }
}

