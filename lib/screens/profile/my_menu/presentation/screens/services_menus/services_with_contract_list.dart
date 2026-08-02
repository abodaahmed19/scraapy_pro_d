import 'package:flutter/material.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/screens/profile/my_menu/presentation/widgets/delete_contract.dart';

class ServicesWithContractList extends StatelessWidget {
  const ServicesWithContractList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context,index){
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: ContractCard(
            index: 1,
            title: 'نفايات خطرة قابلة لإعادة التدوير',
            subtitle: 'عقد جديد خاص بالنفايات الخطرة القابلة لإعادة التدوير',
            duration: 'ثلاث سنوات',
            location: 'المدينة المنورة',
            price: '1500',

          ),
        );
      }),
    );
  }
}


class ContractCard extends StatelessWidget {
  final int index;
  final String title;
  final String subtitle;
  final String duration;
  final String location;
  final String price;

  const ContractCard({
    super.key,
    required this.index,
    required this.title,
    required this.subtitle,
    required this.duration,
    required this.location,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isTablet = screenWidth > 600;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Title row with index badge
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: const Color(0xFFc0d2f9),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '$index',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: isTablet ? 18 : 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),

              ],
            ),
            const SizedBox(height: 6),

            // Subtitle
            Text(
              subtitle,
              style: TextStyle(
                fontSize: isTablet ? 13 : 12,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 14),

            // Info chips row
            Row(
              children: [
                Expanded(
                  child: _InfoChip(
                    icon: Icons.access_time_outlined,
                    label: duration,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _InfoChip(
                    icon: Icons.location_on_outlined,
                    label: location,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Price row
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),

              decoration: BoxDecoration(
                color: const Color(0xFFF8F8F8),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0x14000000)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'سعر العقد',
                    style: TextStyle(
                      fontSize: isTablet ? 14 : 13,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    '﷼ $price',
                    style: TextStyle(
                      fontSize: isTablet ? 16 : 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),


            // Action buttons
            Row(
              children: [
                Expanded(child: MainAppBtn(title: 'تعديل',haveGradient: false,)),
                const SizedBox(width: 10),

                Expanded(child: MainAppBtn(
                  onTap: (){
                    showDialog(
                        context: context,
                        builder: (context) => DeleteContract().deleteConfirmation(context)
                    );

                  },
                  title: 'حذف',haveGradient: false,
                btnColor:Colors.white ,titleStyle: TextStyle(color: Colors.red),
                  border: Border.all(color: Colors.red),
                )),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8F8),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0x14000000)),
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [

          Icon(icon, size: 16, color: Colors.grey[600]),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              label,
              style: const TextStyle(fontSize: 12, color: Colors.black87),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
            ),
          ),

        ],
      ),
    );
  }
}
