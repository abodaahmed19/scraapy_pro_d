import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/screens/wallet_screen.dart';
import 'package:scraapy_pro/screens/profile/my_menu/presentation/screens/delay-menus/delay_menus.dart';
import 'package:scraapy_pro/screens/profile/my_menu/presentation/screens/operations/buying/buying_menu.dart';
import 'package:scraapy_pro/screens/profile/my_menu/presentation/screens/operations/selling/selling_menu.dart';
import 'package:scraapy_pro/screens/profile/my_menu/presentation/screens/operations/selling_pay_list_screen.dart';
import 'package:scraapy_pro/screens/profile/my_menu/presentation/screens/services_menus/order_show_product.dart';
import 'package:scraapy_pro/screens/profile/my_menu/presentation/screens/selling_products.dart';
import 'package:scraapy_pro/screens/profile/my_menu/presentation/screens/services_menus/add_services_menus_screen.dart';
import 'package:scraapy_pro/screens/profile/my_menu/presentation/screens/services_menus/services_menu.dart';

class OperationsMenu extends StatelessWidget {
  OperationsMenu({super.key});

  var menuItem = [
    {
      "title":"البيع",
      "icon":"${AppImages.sellingProduct}",
      "page":SellingMenu()

    },
    {
      "title":"الشراء",
      "icon":"${AppImages.rentalMenu}",
      "page":BuyingMenu()

    },



  ];

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
              CustomAppBar(title: 'العمليات',),
              // PersonalInfoWidget(),

              ListView.builder(
                  itemCount: menuItem.length,
                  shrinkWrap: true,
                  padding: EdgeInsets.all(0),
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index){

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
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
                                      width: 36,
                                      height: 36,
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
                  })



            ],
          ),
        ),
      ),
    );
  }
}

