import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/profile/check/presentation/screens/inspection_demolition_item_details.dart';
import 'package:scraapy_pro/screens/profile/operations/operations_details_screen.dart';
import 'package:scraapy_pro/screens/profile/operations/shared_widgets/order_card.dart';



class SellingOrders extends StatelessWidget {
  final bool fromInspection;
  const SellingOrders({super.key, this.fromInspection = false});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // backgroundColor: const Color(0xFFF7F8FA),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              CustomAppBar(title: "الطلبات"),

              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    padding: EdgeInsets.all(0),
                    itemBuilder: (context,index){
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: OrderCard(fromInspection: fromInspection,),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

