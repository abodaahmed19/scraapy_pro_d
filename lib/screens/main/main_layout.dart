import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/app_cubit.dart';
import '../../cubit/app_state.dart';
import '../home/home_screen.dart';
import '../market/market_screen.dart';
import '../quotes/quotes_screen.dart';
import '../contracts/contracts_screen.dart';
import '../profile/profile_screen.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  final List<Widget> _screens = const [
    HomeScreen(),
    MarketScreen(),
    QuotesScreen(),
    ContractsScreen(),
    ProfileScreen(),
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
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (index) {
              context.read<AppCubit>().changeBottomNavBar(index);
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.store),
                label: 'السوق',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.request_quote),
                label: 'طلب عرض سعر',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.description),
                label: 'العقود',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'الحساب الشخصي',
              ),
            ],
          ),
        );
      },
    );
  }
}
