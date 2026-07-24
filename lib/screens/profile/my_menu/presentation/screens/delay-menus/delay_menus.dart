import 'package:flutter/material.dart';
import 'package:scraapy_pro/screens/profile/my_menu/presentation/screens/delay-menus/empty_delay_menu.dart';

class DelayMenus extends StatelessWidget {
  const DelayMenus({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child:



          // Column(
          //   children: [
          //     CustomAppBar(title: 'قوائم التاخير',),
          //
          //
          //   ],
          // ),
          EmptyDelayMenu()
        ),
      ),
    );
  }
}

