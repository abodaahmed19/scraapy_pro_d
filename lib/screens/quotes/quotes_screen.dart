import 'package:flutter/material.dart';
import '../../widgets/responsive_layout.dart';

class QuotesScreen extends StatelessWidget {
  const QuotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('طلب عرض سعر'), centerTitle: true),
      body: ResponsiveLayout(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('إضافة عرض سعر جديد', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              _buildTextField(context, 'الوصف', 'ادخل تفاصيل الطلب بدقة', maxLines: 4),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildDropdownField(context, 'الفئة', 'اختر الفئة')),
                  const SizedBox(width: 16),
                  Expanded(child: _buildDropdownField(context, 'الفئة الفرعية', 'اختر الفرع')),
                ],
              ),
              const SizedBox(height: 16),
              _buildTextField(context, 'Hs Code', 'ادخل كود المنتج'),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildDropdownField(context, 'نوع الوحدة', 'اختر')),
                  const SizedBox(width: 16),
                  Expanded(child: _buildTextField(context, 'الحد الأدني', '0', keyboardType: TextInputType.number)),
                ],
              ),
              const SizedBox(height: 24),
              const Text('الصور (اختياري)', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              const SizedBox(height: 12),
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Theme.of(context).dividerColor, style: BorderStyle.solid),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud_upload_outlined, size: 48, color: Theme.of(context).colorScheme.primary),
                    const SizedBox(height: 12),
                    Text('اسحب الصور هنا أو اضغط للرفع', style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    elevation: 5,
                    shadowColor: Theme.of(context).colorScheme.primary.withValues(alpha: 0.4),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: const Text('إصدار عرض السعر', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String label, String hint, {int maxLines = 1, TextInputType? keyboardType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Theme.of(context).dividerColor.withValues(alpha: 0.1))),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField(BuildContext context, String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          items: const [],
          onChanged: (value) {},
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Theme.of(context).dividerColor.withValues(alpha: 0.1))),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Theme.of(context).colorScheme.primary)),
          ),
        ),
      ],
    );
  }
}
