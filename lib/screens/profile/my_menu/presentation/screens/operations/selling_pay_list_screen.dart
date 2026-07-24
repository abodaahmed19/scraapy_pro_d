import 'package:flutter/material.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/profile/my_menu/presentation/screens/operations/operations_details_screen.dart';



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
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F2C59),
                    ),
                  ),

                ],
              ),
              // Preparing Tag
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: const Color(0xFF80CBC4), width: 1.2),
                ),
                child: const Text(
                  'Preparing',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF00897B),
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
                  children: const [
                    DetailRowItem(
                      icon: Icons.inventory_2_outlined,
                      title: 'الكمية المتوفرة',
                      value: '28',
                    ),
                    SizedBox(height: 12),
                    DetailRowItem(
                      icon: Icons.scale_outlined,
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
                      icon: Icons.monetization_on_outlined,
                      title: '500 إجمالي Pc',
                      value: '',
                    ),
                    SizedBox(height: 12),
                    DetailRowItem(
                      icon: Icons.calendar_today_outlined,
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
            children: const [
              Icon(Icons.inventory_2_outlined, size: 18, color: Color(0xFF00897B)),
              SizedBox(width: 8),
              Text(
                'انت تجهز الطلب',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00897B),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Action Button ("عرض التفاصيل")
          MainAppBtn(title: "عرض التفاصيل",btnColor: AppColors.primary,haveGradient: false,onTap: (){

            Navigator.push(context, MaterialPageRoute(builder: (_) =>  OperationsDetailsScreen() ));

          },)
        ],
      ),
    );
  }
}

class DetailRowItem extends StatelessWidget {
  final IconData icon;
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
        Icon(icon, size: 20, color: const Color(0xFF5C6B73)),
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