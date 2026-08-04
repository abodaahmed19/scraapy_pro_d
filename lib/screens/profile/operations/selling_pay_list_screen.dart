import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/profile/operations/operations_details_screen.dart';



class SellingPayListScreen extends StatelessWidget {
  final String title;
  const SellingPayListScreen({super.key, required this.title});

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
              CustomAppBar(title: title),
              
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                    itemCount: 6,
                    padding: EdgeInsets.all(0),
                    itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: OrderCard(),
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

class OrderCard extends StatelessWidget {
  const OrderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row: Status Tag (Left) & Order ID with Dot (Right)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [


              // Order ID #1325 with teal dot
              Row(
                children: const [

                  CircleAvatar(radius: 4, backgroundColor:  AppColors.terquaz,),
                  SizedBox(width: 8),
                  Text(
                    'طلب #1325',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),

                ],
              ),
              // Preparing Tag
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.light_terquaz,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.terquaz2, width: 1.2),
                ),
                child: const Text(
                  'Preparing',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.terquaz,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Details Grid (Two columns)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Right Column
              Expanded(
                child: Column(
                  children:  [
                    DetailRowItem(
                      icon: AppImages.amount,
                      title: 'الكمية المتوفرة',
                      value: '28',
                    ),
                    SizedBox(height: 12),
                    DetailRowItem(
                      icon: AppImages.lb,
                      title: '100.0 لكل Pc',
                      value: '',
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Left Column
              Expanded(
                child: Column(
                  children: const [
                    DetailRowItem(
                      icon: AppImages.pc,
                      title: '500 إجمالي Pc',
                      value: '',
                    ),
                    SizedBox(height: 12),
                    DetailRowItem(
                      icon: AppImages.calendar,
                      title: '20/4/2020 تاريخ',
                      value: '',
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Status message at bottom right of details
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children:  [
              SvgPicture.asset( AppImages.order),
              SizedBox(width: 8),
              Text(
                'انت تجهز الطلب',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.terquaz,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          MainAppBtn(title: "عرض التفاصيل",btnColor: AppColors.primary,haveGradient: false,onTap: (){

            Navigator.push(context, MaterialPageRoute(builder: (_) =>  OperationsDetailsScreen() ));

          },)
        ],
      ),
    );
  }
}

class DetailRowItem extends StatelessWidget {
  final String icon;
  final String title;
  final String value;

  const DetailRowItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon,),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value.isEmpty ? title : '$title $value',
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF334155),
            ),
          ),
        ),
      ],
    );
  }
}