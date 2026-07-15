import 'package:flutter/material.dart';

class BorsaCard extends StatelessWidget {
  final String title;
  final String priceSar;
  final String priceUsd;
  final String date;
  const BorsaCard({super.key, required this.title, required this.priceSar, required this.priceUsd, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      // margin: const EdgeInsets.only(left: 16, bottom: 8, top: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(priceSar, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              Text(priceUsd, style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          const SizedBox(height: 16),
          Text('التاريخ : $date', style: TextStyle(color: Colors.grey[500], fontSize: 11)),
        ],
      ),
    );
  }
}
