import 'package:flutter/material.dart';

class CheckItem extends StatelessWidget {
  const CheckItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 🔹 Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.teal.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Preparing',
                  style: TextStyle(color: Colors.teal),
                ),
              ),

              Row(
                children: const [
                  Text(
                    '1325# طلب',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 6),
                  Icon(Icons.circle, color: Colors.teal, size: 10),
                ],
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// 🔹 Info Row
          Wrap(
            spacing: 20,
            runSpacing: 12,
            children: [
              _infoItem(Icons.inventory_2_outlined, '28 الكمية المتوفرة'),
              _infoItem(Icons.monetization_on_outlined, '500 إجمالي Pc'),
              _infoItem(Icons.calendar_today_outlined, '20/4/2020 تاريخ'),
              _infoItem(Icons.scale_outlined, '100.0 لكل Pc'),
            ],
          ),

          const SizedBox(height: 16),

          /// 🔹 Status
          Row(
            children: const [
              Icon(Icons.inventory_2, color: Colors.teal),
              SizedBox(width: 6),
              Text(
                'انت تجهز الطلب',
                style: TextStyle(color: Colors.teal),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// 🔹 Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E4A73),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onPressed: () {},
              child: const Text('عرض التفاصيل'),
            ),
          ),
        ],
      ),
    );
  }

  /// 🔹 reusable item
  Widget _infoItem(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: Colors.grey),
        const SizedBox(width: 4),
        Text(text),
      ],
    );
  }
}