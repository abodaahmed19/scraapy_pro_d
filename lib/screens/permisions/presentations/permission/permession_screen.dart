import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';


class PermessionScreen extends StatelessWidget {
  const PermessionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Column(

                children: [
                  CustomAppBar(title: 'الأذونات',
                  ),
                  _buildCard(
                    title: 'إذن الاستيراد',
                    subtitle: 'تحديد صلاحيات المستخدمين لعمليات الاستيراد',
                    showAvatar: true,
                    btnLeft: 'استيراد النفايات غير الخطرة',
                    btnRight: 'استيراد النفايات الخطرة',
                    onTapLeft: (){},onTapRight: (){}
                  ),
                  const SizedBox(height: 20),

                  _buildCard(
                    title: 'إذن التصدير',
                    subtitle: 'تحديد صلاحيات المستخدمين لعمليات التصدير',
                    showAvatar: false,
                    btnLeft: 'تصدير النفايات غير الخطرة',
                    btnRight: 'تصدير النفايات الخطرة',
                    onTapRight: (){}, onTapLeft: (){}),


                ],
              ),
            ),
          )
      ),
    );
  }
  Widget _buildCard({
    required String title,
    required String subtitle,
    required bool showAvatar,
    required String btnLeft,
    required String btnRight,
    required Function()? onTapLeft,
    required Function()? onTapRight,
  }) {
    return Container(
      width: double.infinity,
      margin: showAvatar ? const EdgeInsets.only(top: 0) : null,
      padding: EdgeInsets.fromLTRB(
        16,
        showAvatar ? 44 : 16,
        16,
        16,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Top-right document icon
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFF4F6F8),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.insert_drive_file_outlined,
              color: Color(0xFF2A9D8F),
              size: 20,
            ),
          ),

          const SizedBox(height: 8),

          // Title
          Text(
            title,
            // textAlign: TextAlign.right,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 6),

          // Subtitle
          Text(
            subtitle,
            // textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 16),

          // Buttons row
          Row(
            children: [
              Expanded(child: MainAppBtn(title: btnRight,titleStyle: TextStyle(fontSize: 12,color: AppColors.white),
              onTap: onTapRight,
              )),
              const SizedBox(width: 10),
              Expanded(child: MainAppBtn(title: btnLeft,
                  onTap: onTapLeft,
                  titleStyle: TextStyle(fontSize: 12,color: AppColors.white))),
            ],
          ),
        ],
      ),
    );


  }

}




