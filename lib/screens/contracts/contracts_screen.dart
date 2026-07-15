import 'package:flutter/material.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import '../../widgets/responsive_layout.dart';

class ContractsScreen extends StatelessWidget {
  const ContractsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, //

      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text('العقود'),
        //   actions: const [
        //     Icon(Icons.chevron_right, size: 30),
        //     SizedBox(width: 16),
        //   ],
        // ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: ResponsiveLayout(
            child: Column(
              children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomAppBar(title: 'العقود',haveBack: false,),
              ),

              Expanded(
                  child: GridView.count(
                    padding: const EdgeInsets.all(16.0),
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.85,
                    children: [
                      _buildContractCard(
                        context,
                        'عقد إيجار',
                        'إدارة ومتابعة عقود الإيجار بسهولة وسرعة.',
                        Icons.edit_document,
                      ),
                      _buildContractCard(
                        context,
                        'وساطة سكرابي',
                        'توفير خدمات الوساطة بين التمييز المختلفة',
                        Icons.file_copy_outlined,
                      ),
                      _buildContractCard(
                        context,
                        'نفايات خطرة قابلة لإعادة التدوير',
                        'التخلص الأمن من النفايات التي يمكن تدويرها',
                        Icons.inventory_2_outlined,
                      ),
                      _buildContractCard(
                        context,
                        'نفايات خطرة غير قابلة لإعادة التدوير',
                        'التخلص الأمن من النفايات التي لا يمكن تدويرها.',
                        Icons.warning_amber_rounded,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContractCard(BuildContext context, String title, String subtitle, IconData icon) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 8, offset: const Offset(0, 4))
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF0F4F8), // Light blue-grey background for icon
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Theme.of(context).primaryColor, size: 28),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Expanded(
            child: Text(
              subtitle,
              style: TextStyle(color: Colors.grey[600], fontSize: 10, height: 1.4),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1B6A78), // Deep teal/blue gradient-like color in the screenshot
                padding: const EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('إصدار العقد', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white)),
            ),
          )
        ],
      ),
    );
  }
}
