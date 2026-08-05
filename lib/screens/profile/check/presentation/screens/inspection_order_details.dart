import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/profile/operations/product_page.dart';




class InspectionOrderDetails extends StatelessWidget {
  const InspectionOrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF7F8FA),

        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              CustomAppBar(title: 'تفاصيل'),
              // SizedBox(height: 16),
              RecipientDetailsCard(),
              SizedBox(height: 16),
              BuildingProperty(),
              SizedBox(height: 16),
              BuildingDetails(),
              SizedBox(height: 16),
              Attach()

            ],
          ),
        ),
      ),
    );
  }
}

/// ================= 1. ORDER STATUS CARD =================



/// ================= 2. RECIPIENT DETAILS CARD =================
class RecipientDetailsCard extends StatelessWidget {
  const RecipientDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:  [
              CircleAvatar(radius: 4, backgroundColor: AppColors.terquaz),
              SizedBox(width: 8),
              Text(
                'معلومات العميل',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Detail Rows (Grid/Row layout)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Right Column
              Expanded(
                child: Column(
                  children: const [
                    DetailItem(
                      icon: Icons.person_outline,
                      title: 'اسم المستلم',
                      value: 'أحمد محمد علي',
                    ),
                    SizedBox(height: 12),

                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Left Column
              Expanded(
                child: Column(
                  children: const [
                    DetailItem(
                      icon: Icons.phone_outlined,
                      title: 'رقم الجوال',
                      value: '+9661209856',
                    ),

                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          DetailItem(
            icon: Icons.phone_outlined,
            title: 'العنوان',
            value: 'شارع الملك عبدالعزيز، حي الفلاح، الرياض 13314، المملكة العربية السعودية',
          ),
          const SizedBox(height: 16),

          DetailItem(
            icon: Icons.phone_outlined,
            title: 'الإحداثيات',
            value: '26.422981, 50.171789'
          ),


        ],
      ),
    );
  }
}

class BuildingProperty extends StatelessWidget {
  const BuildingProperty({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            children:  [
              CircleAvatar(radius: 4, backgroundColor: AppColors.terquaz),
              SizedBox(width: 8),
              Text(
                'مواصفات العقار',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Detail Rows (Grid/Row layout)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Right Column
              Expanded(
                child: Column(
                  children: const [
                    DetailItem(
                      icon: Icons.person_outline,
                      title: 'الطوابق',
                      value: '2'
                    ),
                    SizedBox(height: 18),
                    DetailItem(
                        icon: Icons.person_outline,
                        title: 'المطابخ',
                        value: '2'
                    ),
                    SizedBox(height: 18),
                    DetailItem(
                        icon: Icons.person_outline,
                        title: 'الأقبية',
                        value: '2'
                    ),

                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Left Column
              Expanded(
                child: Column(
                  children: const [
                    DetailItem(
                        icon: Icons.person_outline,
                        title: 'الغرف',
                        value: '2'
                    ),
                    SizedBox(height: 18),
                    DetailItem(
                        icon: Icons.person_outline,
                        title: 'الحمامات',
                        value: '2'
                    ),
                    SizedBox(height: 18),
                    DetailItem(
                        icon: Icons.person_outline,
                        title: 'المواقف',
                        value: '2'
                    ),


                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),



        ],
      ),
    );
  }
}
class BuildingDetails extends StatelessWidget {
  const BuildingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            children:  [
              CircleAvatar(radius: 4, backgroundColor: AppColors.terquaz),
              SizedBox(width: 8),
              Text(
                'تفاصيل العقار',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Detail Rows (Grid/Row layout)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Right Column
              Expanded(
                child: Column(
                  children: const [
                    DetailItem(
                      icon: Icons.person_outline,
                      title: 'النوع',
                      value: 'residential_building'
                    ),


                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Left Column
              Expanded(
                child: Column(
                  children: const [
                    DetailItem(
                        icon: Icons.person_outline,
                        title: 'مساحة الأرض',
                        value: '2'
                    ),


                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          DetailItem(
              icon: Icons.person_outline,
              title: 'مساحة البناء',
              value: '2'
          ),



        ],
      ),
    );
  }
}
class Attach extends StatelessWidget {
  const Attach({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE5E7EB), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header
          Row(
            children:  [
              CircleAvatar(radius: 4, backgroundColor: AppColors.terquaz),
              SizedBox(width: 8),
              Text(
                'المرافق',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Detail Rows (Grid/Row layout)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Right Column
              Expanded(
                child: Column(
                  children: const [
                    DetailItem(
                      icon: Icons.person_outline,
                      title: 'الكهرباء',
                      value: 'الإحتفاظ'
                    ),


                  ],
                ),
              ),
              const SizedBox(width: 12),
              // Left Column
              Expanded(
                child: Column(
                  children: const [
                    DetailItem(
                        icon: Icons.person_outline,
                        title: 'المياة',
                        value: 'الإحتفاظ'
                    ),




                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),



        ],
      ),
    );
  }
}
////////////////////////////////
class DetailItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const DetailItem({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.light_primary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 20, color: const Color(0xFF6B7280)),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Text(
              //   title,
              //   style: const TextStyle(fontSize: 11, color: Color(0xFF9CA3AF)),
              // ),
              Text(
                  title,
                  style:  TextStyle(fontSize: 12, color:AppColors.primary)),

              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F2937),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


