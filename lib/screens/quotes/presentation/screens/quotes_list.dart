import 'package:flutter/material.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';



// ── Data Models ───────────────────────────────────────────────────────────────

class QuoteItem {
  final int index;
  final String name;
  int quantity;
  final double price;

  QuoteItem({
    required this.index,
    required this.name,
    required this.quantity,
    required this.price,
  });

  double get total => quantity * price;
}

// ── Page ──────────────────────────────────────────────────────────────────────

class QuotesListPage extends StatefulWidget {
  const QuotesListPage({super.key});

  @override
  State<QuotesListPage> createState() => _QuotesListPageState();
}

class _QuotesListPageState extends State<QuotesListPage> {
  final List<QuoteItem> _marketItems = [
    QuoteItem(index: 1, name: 'منتج تصدير', quantity: 4, price: 10090),
    QuoteItem(index: 2, name: 'مكينة تدوير الأطعمة الى سماد', quantity: 1, price: 3500),
    QuoteItem(index: 3, name: 'منتج ورقي بحاله جيدة', quantity: 1, price: 3),
    QuoteItem(index: 4, name: 'حاوية فرز نفايات مكتبية ×6', quantity: 1, price: 1500),
    QuoteItem(index: 5, name: 'تخزين الطعام X2', quantity: 3, price: 1000),
    QuoteItem(index: 6, name: 'منتج جديد', quantity: 2, price: 12),
  ];

  final List<QuoteItem> _rentalItems = [
    QuoteItem(index: 1, name: 'حاويه جديده 30', quantity: 3, price: 4000),
    QuoteItem(index: 2, name: 'حاويه 30 ياردة', quantity: 2, price: 400),
  ];

  final List<QuoteItem> _serviceItems = [
    QuoteItem(index: 1, name: 'ديانا نقل عادي 1.5 طن تعديل', quantity: 1, price: 800),
    QuoteItem(index: 2, name: 'فك ونقل عفش', quantity: 1, price: 2000),
    QuoteItem(index: 3, name: 'فك ونقل عفش', quantity: 1, price: 1500),
    QuoteItem(index: 4, name: 'توريد مياه غير صالحة للشرب', quantity: 4, price: 100),
  ];

  double get _marketTotal => _marketItems.fold(0, (s, i) => s + i.total);
  double get _rentalTotal => _rentalItems.fold(0, (s, i) => s + i.total);
  double get _serviceTotal => _serviceItems.fold(0, (s, i) => s + i.total);
  double get _subtotal => _marketTotal + _rentalTotal + _serviceTotal;
  double get _commission => _subtotal * 0.05;
  double get _fees => 600;
  double get _vat => (_subtotal + _commission + _fees) * 0.15;
  double get _grandTotal => _subtotal + _commission + _fees + _vat;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(

            children: [
              CustomAppBar(title: 'إصدار عرض سعر'),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(

                    children: [
                      Column(

                        children: [
                          _buildCard(children: [

                            const SizedBox(height: 16),
                            _buildSection(
                              title: 'السوق',
                              items: _marketItems,
                              total: _marketTotal,
                            ),
                            const SizedBox(height: 24),
                            _buildSection(
                              title: 'الإيجار',
                              items: _rentalItems,
                              total: _rentalTotal,
                            ),
                            const SizedBox(height: 24),
                            _buildSection(
                              title: 'الخدمات',
                              items: _serviceItems,
                              total: _serviceTotal,
                            ),
                          ]),
                          const SizedBox(height: 16),
                          _buildSummaryCard(),
                          const SizedBox(height: 16),
                          _buildPrintButton(),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget _buildSection({
    required String title,
    required List<QuoteItem> items,
    required double total,
  }) {
    final isNarrow = MediaQuery.of(context).size.width < 600;600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Section title
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

             CircleAvatar(
                radius: 4, backgroundColor: AppColors.terquaz),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
            ),

          ],
        ),
        const SizedBox(height: 12),

        // Table

        _buildMobileList(items),

        const SizedBox(height: 12),

        // Total row
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF9F9F9),
            border: Border.all(color: const Color(0xFFE8E8E8)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₨ ${total.toStringAsFixed(2)}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const Text(
                'الإجمالي',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }




  Widget _buildMobileList(List<QuoteItem> items) {
    return Column(
      children: items.map((item) {
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE8E8E8)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: const Color(0xFF1B4F72),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        alignment: Alignment.center,
                        child: Text('${item.index}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 10)),
                      ),
                      const SizedBox(width: 6),

                      Text(item.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 13)),

                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete_outline,
                        color: Colors.grey, size: 20),
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),

                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('₨ ${item.total.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B4F72))),
                  Row(
                    children: [
                      _StepperButton(
                          icon: Icons.add,
                          onTap: () => setState(() => item.quantity++)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text('${item.quantity}',
                            style: const TextStyle(fontWeight: FontWeight.w600)),
                      ),
                      _StepperButton(
                          icon: Icons.remove,
                          onTap: () => setState(() {
                            if (item.quantity > 1) item.quantity--;
                          })),
                    ],
                  ),
                  Text('₨ ${item.price.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.grey, fontSize: 13)),
                ],
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSummaryCard() {
    return _buildCard(
        children: [
      _summaryRow('الإجمالي الفرعي', '₨ ${_subtotal.toStringAsFixed(2)}'),
      _summaryRow('العمولة', '₨ ${_commission.toStringAsFixed(2)}'),
      _summaryRow('الرسوم', '₨ ${_fees.toStringAsFixed(2)}'),
      _summaryRow('القيمة المضافة', '₨ ${_vat.toStringAsFixed(2)}'),
      _summaryRow('التاريخ', '02-09-2026'),
      const Divider(height: 24),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'إجمالي السعر',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            '₨ ${_grandTotal.toStringAsFixed(2)}',
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B4F72)),
          ),

        ],
      ),
    ]);
  }

  Widget _summaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(fontSize: 14, color: Colors.black54)),
          Text(value,
              style: const TextStyle(fontSize: 14, color: Colors.black87)),

        ],
      ),
    );
  }

  Widget _buildPrintButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.print_outlined, color: Colors.white, size: 18),
        label: const Text('طباعة',
            style: TextStyle(color: Colors.white, fontSize: 15)),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1B4F72),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 0,
        ),
      ),
    );
  }

  Widget _buildCard({required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: children,
      ),
    );
  }
}

// ── Stepper Button ────────────────────────────────────────────────────────────

class _StepperButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _StepperButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFDDDDDD)),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon, size: 14, color: Colors.black87),
      ),
    );
  }
}



