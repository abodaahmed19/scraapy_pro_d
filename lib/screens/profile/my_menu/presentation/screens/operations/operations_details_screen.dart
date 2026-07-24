import 'package:flutter/material.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';




class OperationsDetailsScreen extends StatelessWidget {
  const OperationsDetailsScreen({super.key});

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
              OrderStatusBarCard(),
              SizedBox(height: 16),
              RecipientDetailsCard(),
              SizedBox(height: 16),
              ProductDetailsCard(),
              SizedBox(height: 16),
              FinancialDetailsCard(),
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
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

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

          const SizedBox(height: 16),

          // Info Banner Box
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F6F8),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              'أنت تقوم بتجهيز الطلب، عندما يتم تجهيز الطلب وجاهز للشحن، اضغط على الزر أدناه. سيتم جدولة شحن الطلب عندما يتم وضع علامة بأنه جاهز.',
              style: TextStyle(fontSize: 12, color: Color(0xFF606770), height: 1.5),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),

          // Action Button
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8B9BB4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              onPressed: () {},
              child: const Text(
                'تم شحنها',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ),
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
    Color activeColor = const Color(0xFF26A69A); // Teal
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
            children: const [
              CircleAvatar(radius: 4, backgroundColor: Colors.teal),
              SizedBox(width: 8),
              Text(
                'بيانات الإستلام',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

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
                    DetailItem(
                      icon: Icons.home_outlined,
                      title: 'المدينة/المنطقة',
                      value: 'الدمام',
                    ),
                    SizedBox(height: 12),
                    DetailItem(
                      icon: Icons.phone_outlined,
                      title: 'رقم الجوال',
                      value: '+9661209856',
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
                      icon: Icons.signpost_outlined,
                      title: 'اسم الشارع',
                      value: 'احمد علي',
                    ),
                    SizedBox(height: 12),
                    DetailItem(
                      icon: Icons.location_city_outlined,
                      title: 'رقم المبني',
                      value: '1235',
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Map Mockup Preview Container
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
                        backgroundColor: const Color(0xFF1E3A8A),
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
            color: const Color(0xFFF3F4F6),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 20, color: const Color(0xFF6B7280)),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 11, color: Color(0xFF9CA3AF)),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 13,
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
                    'تفاصيل المنتج',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  children: const [
                    Text(
                      'صفحة المنتج',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.teal,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.arrow_back_ios, size: 12, color: Colors.teal),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // First Grid (Quantity / Price / Date info)
          Row(
            children: const [
              Expanded(
                child: ProductDetailItem(
                  icon: Icons.inventory_2_outlined,
                  title: '28 الكمية المتوفرة',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ProductDetailItem(
                  icon: Icons.scale_outlined,
                  title: '100.0 لكل Pc',
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: const [
              Expanded(
                child: ProductDetailItem(
                  icon: Icons.monetization_on_outlined,
                  title: '500 إجمالي Pc',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ProductDetailItem(
                  icon: Icons.calendar_today_outlined,
                  title: '20/4/2020 تاريخ',
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Subheader: Inventory tracking subtitle
          const Text(
            '** تتبع المخزون من هذا المنتج',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: Colors.teal,
            ),
          ),
          const SizedBox(height: 12),

          // Second Grid (Inventory Tracking rows)
          Row(
            children: const [
              Expanded(
                child: ProductDetailItem(
                  icon: Icons.inventory_2_outlined,
                  title: '28كج الكمية المتاحة',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: ProductDetailItem(
                  icon: Icons.inventory_2_outlined,
                  title: '2كج هذا الطلب',
                  valueColor: Colors.redAccent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Expanded(
                child: ProductDetailItem(
                  icon: Icons.inventory_2_outlined,
                  title: '28كج الكمية المتبقية',
                ),
              ),
              const SizedBox(width: 12),
              Expanded(child: Container()), // Empty space balancer
            ],
          ),
        ],
      ),
    );
  }
}

class ProductDetailItem extends StatelessWidget {
  final IconData icon;
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
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFFF3F4F6)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Icon(icon, size: 18, color: const Color(0xFF6B7280)),
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
                  color: Colors.black,
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
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E3A8A), // Dark Navy Blue matching design
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
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E3A8A),
          ),
        ),
      ],
    );
  }
}