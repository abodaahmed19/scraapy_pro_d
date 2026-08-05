import 'package:flutter/material.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/core/shared/widget/empty_screen.dart';
import 'package:scraapy_pro/screens/profile/my_menu/presentation/screens/services_menus/services_with_contract_list.dart';

class ServicesWithContract extends StatelessWidget {
  const ServicesWithContract({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(

          children: [
            CustomAppBar(title: 'خدمات بعقد'),
            EmptyScreen(title: 'لا توجد عروض', subTitle: 'حالياً ليس لديك أي منتجات معروضة.',
                btnTitle: 'إضافة خدمة بعقد', func: (){})
            // ServicesWithContractList()
          ],
        ),
      ),
    );
  }
}

