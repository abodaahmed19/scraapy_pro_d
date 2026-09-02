import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/screens/home/presentation/screens/home_screen.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/screens/personal_account_screen.dart';
import 'package:scraapy_pro/screens/quotes/presentation/screens/qoutes_screen.dart';
import 'package:scraapy_pro/screens/quotes/presentation/screens/quotes_list.dart';
import '../../cubit/app_cubit.dart';
import '../../cubit/app_state.dart';
import '../market/presentation/screens/market_screen.dart';
import '../quotes/presentation/screens/old_quotes_screen.dart';
import '../contracts/presentation/screens/contracts_screen.dart';
import '../profile/profile_screen.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  final List<Widget> _screens = const [
    HomeScreen(),
    MarketScreen(),
    QuotesScreen(),
    ContractsScreen(),
    // ProfileScreen(),
    PersonalAccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        int currentIndex = 0;
        if (state is NavigationState) {
          currentIndex = state.selectedIndex;
        }

        return Scaffold(
          body: _screens[currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SizedBox(
              height: 75,
              child: BottomNavigationBar(
                currentIndex: currentIndex,
                onTap: (index) {
                  context.read<AppCubit>().changeBottomNavBar(index);
                },
                unselectedLabelStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Colors.black),
                selectedLabelStyle: TextStyle(fontSize: 10,fontWeight: FontWeight.w500,color: Colors.black),
                type: BottomNavigationBarType.fixed,
                backgroundColor: Theme.of(context).colorScheme.surface,
                selectedItemColor: Theme.of(context).colorScheme.primary,
                unselectedItemColor: Colors.black,
                elevation: 0,
                items:  [
                  BottomNavigationBarItem(icon: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 6.0),
                    child: SvgPicture.asset(AppImages.black_home),
                  ), activeIcon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: SvgPicture.asset(AppImages.active_home),
                  ), label: 'الصفحة الرئيسية'),
                  BottomNavigationBarItem(icon: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 6.0),
                    child: SvgPicture.asset(AppImages.black_market),
                  ), activeIcon: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 6.0),
                    child: SvgPicture.asset(AppImages.active_market),
                  ), label: 'السوق'),
                  BottomNavigationBarItem(icon: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 6.0),
                    child: SvgPicture.asset(AppImages.black_offer),
                  ), activeIcon: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 6.0),
                    child: Icon(Icons.local_offer),
                  ), label: 'طلب عرض سعر'),
                  BottomNavigationBarItem(icon: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 6.0),
                    child: SvgPicture.asset(AppImages.black_contract),
                  ), activeIcon: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 6.0),
                    child: SvgPicture.asset(AppImages.active_contract),
                  ), label: 'العقود'),
                  BottomNavigationBarItem(icon: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 6.0),
                    child: SvgPicture.asset(AppImages.black_user),
                  ), activeIcon: Padding(
                    padding:  EdgeInsets.symmetric(vertical: 6.0),
                    child: SvgPicture.asset(AppImages.active_user),
                  ), label: 'الحساب الشخصي'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
