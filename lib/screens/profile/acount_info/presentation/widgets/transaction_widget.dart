import 'package:flutter/material.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/entities/transactions_entity.dart';
import 'package:intl/intl.dart';

class TransactionWidget extends StatelessWidget {

  final MyWalletTransactionEntity item;
  final int index;
  const TransactionWidget({super.key, required this.item, required this.index});



  String formatArabicDate(DateTime date) {
    final formatted = DateFormat(
      'dd/MM/yyyy، hh:mm a',
    ).format(date);

    return formatted
        .replaceAll('/', '‏/')
        .replaceAll('0', '٠')
        .replaceAll('1', '١')
        .replaceAll('2', '٢')
        .replaceAll('3', '٣')
        .replaceAll('4', '٤')
        .replaceAll('5', '٥')
        .replaceAll('6', '٦')
        .replaceAll('7', '٧')
        .replaceAll('8', '٨')
        .replaceAll('9', '٩')
        .replaceAll('am', 'ص')
        .replaceAll('pm', 'م');
  }

  @override
  Widget build(BuildContext context) {
    //
    // final formate = DateTime.parse(
    //   '${item.createdAt}',
    // );
    final date = formatArabicDate(
      item.createdAt,
    );
    print(date);

    return DecoratedBox(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color:Color(0x33000000),width: 1.4)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0x4A2563EB),

                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 4),
                        child: Center(child: Text('${index+1}')),
                      ),
                    ),
                    SizedBox(width: 12,),
                    Text(item.typeDisplay,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.primary
                    )),
                  ],
                ),
                Text('-'+'${item.amount}',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: AppColors.primary
                )),                                ],
            ),
            SizedBox(height: 16,),
            Text('سحب - استخدم رصيدك في المحفظة الإلكترونية - فرع ثالث',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,
            )),
            SizedBox(height: 8,),
            Text(date,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,
            )),


          ],
        ),
      ),
    );
  }

}
