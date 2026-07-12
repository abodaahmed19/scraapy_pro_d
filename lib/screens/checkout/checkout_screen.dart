import 'package:flutter/material.dart';
import '../../widgets/responsive_layout.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('الدفع'),
        centerTitle: true,
      ),
      body: ResponsiveLayout(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildSectionHeader('تفاصيل الشحن', isDark),
              _buildShippingDetailsCard(context),
              const SizedBox(height: 16),
              
              _buildSectionHeader('العناوين المحفوظة', isDark),
              _buildSavedAddressesCard(context),
              const SizedBox(height: 16),
              
              _buildSectionHeader('سلة التسوق', isDark),
              _buildShoppingCartCard(context),
              const SizedBox(height: 16),
              
              _buildSectionHeader('طريقة الدفع', isDark),
              _buildPaymentMethodCard(context),
              const SizedBox(height: 16),
              
              _buildSectionHeader('التفاصيل المالية', isDark),
              _buildFinancialDetailsCard(context),
              const SizedBox(height: 24),
              
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: const Color(0xFF189491), // Specific Teal color from Figma
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('إتمام الدفع', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, bool isDark) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Color(0xFF189491),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF234777),
              fontFamily: 'Cairo',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShippingDetailsCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.black12),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('استلام من الفرع', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('استلم طلبك خلال يوم عمل واحد.', style: TextStyle(fontSize: 12, color: Colors.grey)),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF234777),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('إضافة تفاصيل الشحن'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSavedAddressesCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.black12),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.radio_button_unchecked, color: Colors.grey),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('فرع المدينة المنورة', style: TextStyle(fontWeight: FontWeight.bold)),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.blue.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text('1', style: TextStyle(color: Colors.blue, fontSize: 12)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'طريق الملك عبدالعزيز، حي الياسمين، الرياض 13325، المملكة العربية السعودية',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.location_on_outlined, size: 20, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      side: const BorderSide(color: Colors.black12),
                      foregroundColor: Colors.black,
                    ),
                    child: const Text('حذف'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF234777),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Text('تعديل'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShoppingCartCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.black12),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            const Icon(Icons.delete_outline, color: Colors.red),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text('منتج مستعمل', style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: const [
                    Text('2 كج', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    SizedBox(width: 4),
                    Icon(Icons.inventory_2_outlined, size: 14, color: Colors.grey),
                  ],
                ),
                const Text('SAR 1000', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF234777))),
              ],
            ),
            const SizedBox(width: 12),
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.local_shipping, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.black12),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Icon(Icons.apple, size: 32),
                Icon(Icons.credit_card, size: 32, color: Colors.orange),
                Icon(Icons.credit_card, size: 32, color: Colors.blue),
                Icon(Icons.account_balance_wallet, size: 32, color: Colors.green),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: const [
                      Icon(Icons.radio_button_unchecked, color: Colors.grey),
                      SizedBox(width: 8),
                      Text('الدفع من المحفظة', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: const [
                      Icon(Icons.radio_button_unchecked, color: Colors.grey),
                      SizedBox(width: 8),
                      Text('الدفع بالبطاقة', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFinancialDetailsCard(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.black12),
      ),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('منتج مستعمل', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            _buildFinanceRow('الكمية', '2 كج'),
            _buildFinanceRow('سعر الوحدة', '100 SAR'),
            _buildFinanceRow('المجموع الفرعي', 'SAR 200'),
            _buildFinanceRow('ضريبة القيمة المضافة (15%)', 'SAR 15.0'),
            const Divider(),
            _buildFinanceRow('المجموع', 'SAR 185', isTotal: true),
          ],
        ),
      ),
    );
  }

  Widget _buildFinanceRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? const Color(0xFF234777) : Colors.grey,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
