import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';

class BaqaWidget extends StatelessWidget {
  const BaqaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(color:  Color(0x29000000))

      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('الباقة الحالية',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10),),
                    SizedBox(height: 8,),
                    Text('الأساسية',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: AppColors.terquaz),),
                  ],
                ),

                Container(
                  height: 30,width: 45,
                  decoration: BoxDecoration(
                      color:  Color(0x1A189491),
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color:  Color(0x4D189491))
                  ),
                  child: Center(child: Text('نشط',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 12,color: Color(0x4D189491)))),

                ),




              ],
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('تاريخ الإبتداء',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12),),

                Text('13/5/2020',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12),),




              ],
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('تاريخ الإبتداء',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12),),

                Text('13/5/2020',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12),),




              ],
            ),


          ],
        ),
      ),
    );
  }
}
