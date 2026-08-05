import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/profile/check/presentation/screens/inspection_order_details.dart';
import 'package:scraapy_pro/widgets/custom_text_field.dart';




class InspectionDemolitionItemDetails extends StatelessWidget {
  const InspectionDemolitionItemDetails({super.key});

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
              CustomAppBar(title: 'العمليات المعلقة'),
              OrderStatusBarCard(),
              SizedBox(height: 16),
              RecipientDetailsCard(),
              SizedBox(height: 16),
              ProductDetailsCard(),
              SizedBox(height: 20),

              MainAppBtn(title: 'طلب قيد الإنتظام'),
              SizedBox(height: 30),


            ],
          ),
        ),
      ),
    );
  }
}

/// ================= 1. ORDER STATUS CARD =================
class OrderStatusBarCard extends StatelessWidget {
  const OrderStatusBarCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0x33000000), width: 1),
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
            children: const [
              CircleAvatar(radius: 4, backgroundColor: Colors.teal),
              SizedBox(width: 8),
              Text(
                'حالة البيع',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),

          // Timeline Steps
          const TimelineStep(
            title: 'قيد المراجعة',
            subtitle: '13/5/2020',
            status: TimelineStatus.completed,
            isFirst: true,
          ),
          const TimelineStep(
            title: 'قيد التحضير',
            subtitle: '13/5/2020',
            status: TimelineStatus.completed,
          ),
          const TimelineStep(
            title: 'جاهز',
            subtitle: 'جاري انتظار شركة الشحن',
            status: TimelineStatus.current,
          ),
          const TimelineStep(
            title: 'تم الإستلام',
            status: TimelineStatus.pending,
          ),
          const TimelineStep(
            title: 'مكتمل',
            status: TimelineStatus.pending,
            isLast: true,
          ),

          // const SizedBox(height: 16),


        ],
      ),
    );
  }
}

enum TimelineStatus { completed, current, pending }

class TimelineStep extends StatelessWidget {
  final String title;
  final String? subtitle;
  final TimelineStatus status;
  final bool isFirst;
  final bool isLast;

  const TimelineStep({
    super.key,
    required this.title,
    this.subtitle,
    required this.status,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    Color activeColor = AppColors.terquaz; // Teal
    Color pendingColor = const Color(0xFFB0BEC5); // Grey

    Color getColor() {
      if (status == TimelineStatus.pending) return pendingColor;
      return activeColor;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Indicator & Line Column
        Column(
          children: [
            // Line above (if not first)
            if (!isFirst)
              Container(
                width: 2,
                height: 14,
                color: status == TimelineStatus.pending ? pendingColor : activeColor,
              ),
            // Bullet icon
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: status == TimelineStatus.current ? Colors.white : getColor(),
                border: Border.all(
                  color: getColor(),
                  width: status == TimelineStatus.current ? 4 : 0,
                ),
              ),
              child: status == TimelineStatus.completed
                  ? const Icon(Icons.check, size: 12, color: Colors.white)
                  : null,
            ),
            // Line below (if not last)
            if (!isLast)
              Container(
                width: 2,
                height: 28,
                color: status == TimelineStatus.completed ? activeColor : pendingColor,
              ),
          ],
        ),
        const SizedBox(width: 12),

        // Text Content
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(top: isFirst ? 0 : 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: status == TimelineStatus.pending ? Colors.grey : Colors.black
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: TextStyle(
                      fontSize: 12,
                      color: status == TimelineStatus.current ? const Color(0xFF00ACC1) : Colors.grey,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

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
            children:  [
              CircleAvatar(radius: 4, backgroundColor: Colors.teal),
              SizedBox(width: 8),
              Text(
                'تفاصيل الطلب',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
                      title: 'الإسم',
                      value: 'أحمد محمد علي',
                    ),
                    SizedBox(height: 12),

                    DetailItem(
                      icon: Icons.home_outlined,
                      title: 'التوقيت',
                      value: ' PM 4:25 ',
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
                    SizedBox(height: 12),
                    DetailItem(
                      icon: Icons.location_city_outlined,
                      title: 'الموقع',
                      value: 'الدمام',
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Map Mockup Preview Container
          MainAppBtn(title: 'عرض التفاصيل',
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (_) => const InspectionOrderDetails()));

            },
            haveGradient: false,btnColor: AppColors.primary,),

        ],
      ),
    );
  }
}

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

/// Custom painter to simulate abstract map roads/lines in the background

/// ================= 1. PRODUCT DETAILS CARD =================
class ProductDetailsCard extends StatelessWidget {
  const ProductDetailsCard({super.key});

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
          // Header Row: Product Details Title & Page Link
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  CircleAvatar(radius: 4, backgroundColor: Colors.teal),
                  SizedBox(width: 8),
                  Text(
                    'موقع الهدم',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              height: 140,
              width: double.infinity,
              color: const Color(0xFFEAEFF2),
              child: Stack(
                children: [
                  // Simulated map background graphics
                  // Positioned.fill(
                  //   child: CustomPaint(
                  //     painter: MapMockPainter(),
                  //   ),
                  // ),
                  // Map Controls (+ / -)
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(color: Colors.black12, blurRadius: 4),
                        ],
                      ),
                      child: Column(
                        children: const [
                          Icon(Icons.add, size: 20, color: Colors.black54),
                          Divider(height: 1, color: Colors.grey),
                          Icon(Icons.remove, size: 20, color: Colors.black54),
                        ],
                      ),
                    ),
                  ),
                  // Bottom Location Button
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.my_location, size: 16, color: Colors.white),
                      label: const Text(
                        'تحديد الموقع الحالي',
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          CustomTextField(hint: 'ادخل احداثيات الموقع',label: 'إحداثيات الموقع*',)


        ],
      ),
    );
  }
}

class ProductDetailItem extends StatelessWidget {
  final String icon;
  final String title;
  final Color? valueColor;

  const ProductDetailItem({
    super.key,
    required this.icon,
    required this.title,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      // decoration: BoxDecoration(
      //   color: const Color(0xFFF9FAFB),
      //   borderRadius: BorderRadius.circular(10),
      //   border: Border.all(color: const Color(0xFFF3F4F6)),
      // ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: AppColors.light_primary,
              borderRadius: BorderRadius.circular(6),
            ),
            child: SvgPicture.asset(icon, ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: valueColor ?? const Color(0xFF374151),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// ================= 2. FINANCIAL DETAILS CARD =================
class FinancialDetailsCard extends StatelessWidget {
  const FinancialDetailsCard({super.key});

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
            children: const [
              CircleAvatar(radius: 4, backgroundColor: Colors.teal),
              SizedBox(width: 8),
              Text(
                'التفاصيل المالية',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Product Name item
          const Text(
            'منتج مستعمل',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),

          // Financial Breakdown Rows
          const FinancialRow(label: 'الكمية', value: '2 كج'),
          const SizedBox(height: 12),
          const FinancialRow(label: 'سعر الوحدة', value: '100 كج'),
          const SizedBox(height: 12),
          const FinancialRow(label: 'المجموع الفرعي', value: 'SAR 200'),
          const SizedBox(height: 12),
          const FinancialRow(label: 'ضريبة القيمة المضافة (15%)', value: 'SAR 15.0'),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Divider(color: Color(0xFFE5E7EB), height: 1),
          ),

          // Total Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'المجموع',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                'SAR 185',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary // Dark Navy Blue matching design
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FinancialRow extends StatelessWidget {
  final String label;
  final String value;

  const FinancialRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF6B7280),
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style:  TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.primary
          ),
        ),
      ],
    );
  }
}