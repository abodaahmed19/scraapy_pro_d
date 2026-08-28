import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/presentation/screens/selling_orders.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/presentation/screens/selling_purchase.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/presentation/screens/selling_rentals.dart';
import 'package:scraapy_pro/screens/profile/operations/selling_pay_list_screen.dart';

class SellingMenu extends StatelessWidget {
  SellingMenu({super.key});

  var menuItem = [
    {
      "title":"المنتجات المباعة",
      "icon":"${AppImages.sellingProduct}",
      "page":SoldProductsScreen()

    },
    {
      "title":"تأجير",
      "icon":"${AppImages.rentalMenu}",
      "page":SellingRentals()

    },
    {
      "title":"تقديم خدمة",
      "icon":"${AppImages.rentalMenu}",
      "page":SellingOrders()

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
              CustomAppBar(title: 'البيع',),
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

