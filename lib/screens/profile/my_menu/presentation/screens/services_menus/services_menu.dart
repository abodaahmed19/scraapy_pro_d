import 'package:flutter/material.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/profile/my_menu/presentation/screens/services_menus/add_services_menus_screen.dart';
import 'package:scraapy_pro/screens/profile/my_menu/presentation/screens/services_menus/empty_services_menus.dart';
import 'package:scraapy_pro/screens/profile/my_menu/presentation/screens/services_menus/services_with_contract_list.dart';

class ServicesMenu extends StatelessWidget {
  const ServicesMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
               CustomAppBar(title: 'قوائم الخدمات',),

              // EmptyServicesMenus(),
              ServicesWithContractList()
            ],
          ),
        ),
      ),
    );
  }

}
