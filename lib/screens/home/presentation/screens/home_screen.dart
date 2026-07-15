import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/screens/home/presentation/cubit/home_cubit.dart';
import 'package:scraapy_pro/screens/home/presentation/cubit/home_state.dart';
import 'package:scraapy_pro/screens/inspection_req/inspection_screen.dart';
import 'package:scraapy_pro/screens/manifest/presentation/manifest_screen.dart';
import 'package:scraapy_pro/screens/rentals/presentation/screens/retals_screen.dart';
import 'package:scraapy_pro/screens/services/presentation/screens/services_screen.dart';
import 'package:scraapy_pro/screens/stock_market/presentation/screens/stock_market_screen.dart';
import '../../../../widgets/responsive_layout.dart';
import '../../../notifications/notifications_screen.dart';
import '../../../favorites/presentation/screens/favorites_screen.dart';
import '../../../checkout/checkout_screen.dart';
import '../../../inspection/inspection_request_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ScrollController controller = ScrollController();
  final String typeSelect = 'service';

  @override
  void initState() {
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, //

      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: BlocProvider(
            create: (context) => HomeCubit()..changeTab('service'),
            child: Builder(
              builder: (context) {
                return SafeArea(
                  child: ResponsiveLayout(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildHeader(context),
                          const SizedBox(height: 24),
                          _buildHeroBanner(context),
                          const SizedBox(height: 24),
                          _buildServicesRow(context),
                          const SizedBox(height: 32),
                          _buildBourseSection(context),
                          const SizedBox(height: 32),
                          _buildFeaturedServicesSection(context),
                        ],
                      ),
                    ),
                  ),
                );
              }
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            IconButton(
              icon: Icon(Icons.notifications_outlined, color: Theme.of(context).primaryColor, size: 28),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationsScreen()));
              },
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: Color(0xFF189491),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('مرحبا', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18, fontWeight: FontWeight.bold)),
              Text('منصة سكرابي برو لإدارة النفايات والتدوير', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
            ],
          ),
        ),
        _buildIconAction(context, Icons.favorite_border, () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const FavoritesScreen()));
        }),
        const SizedBox(width: 8),
        _buildIconAction(context, Icons.shopping_cart_outlined, () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => const CheckoutScreen()));
        }),
      ],
    );
  }

  Widget _buildIconAction(BuildContext context, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Theme.of(context).primaryColor, size: 24),
      ),
    );
  }

  Widget _buildHeroBanner(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,

        image: const DecorationImage(
          image: NetworkImage('https://images.unsplash.com/photo-1532996122724-e3c354a0b15b?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Theme.of(context).primaryColor.withValues(alpha: 0.3), blurRadius: 15, offset: const Offset(0, 5)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text('سكرابي برو', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          const Text('أول منصة رقمية مرخصة من "موان" لإدارة\nالنفايات الصناعية والتجارية والخدمية', style: TextStyle(color: Colors.white, fontSize: 14, height: 1.5)),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF234777),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text('تعرف علينا'),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildServicesRow(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildServiceCard(context, 'الخدمات', true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const ServicesScreen()));
              }
          ),
          _buildServiceCard(context, 'إيجار', true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => const RentalsScreen()));
              }
          ),
          _buildServiceCard(context, 'البورصة', true,
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) =>  StockMarketScreen()));
              }
          ),
          _buildServiceCard(context, 'المانيفيست', true,onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) => const ManifestScreen()));

          }),
          _buildServiceCard(context, 'أذونات الاستيراد والتصدير', true),
          _buildServiceCard(context, 'طلبات الفحص والهدم', true, onTap: () {
            // Navigator.push(context, MaterialPageRoute(builder: (_) => const InspectionRequestScreen()));
            Navigator.push(context, MaterialPageRoute(builder: (_) => const InspectionReqScreen()));
          }),
        ],
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, String title, bool isSelected, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 12),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.primary,
              AppColors.terquaz,
              // end color
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          // color: isSelected ? const Color(0xFF189491) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: isSelected ? null : Border.all(color: Colors.grey.withValues(alpha: 0.2)),
          boxShadow: isSelected ? [BoxShadow(color: const Color(0xFF189491).withValues(alpha: 0.3), blurRadius: 8, offset: const Offset(0, 4))] : [],
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildBourseSection(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('اسعار البورصة', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) =>  StockMarketScreen()));


              },
              child: Text('عرض الكل', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14)),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildBourseCard(context, 'بطاريات سيارات', '0.03 \$', '450 ر.س', '15-3-1999'),
              _buildBourseCard(context, 'ستانلستين', '0.03 \$', '450 ر.س', '15-3-1999'),
              _buildBourseCard(context, 'بطاريات سيارات', '0.03 \$', '450 ر.س', '15-3-1999'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBourseCard(BuildContext context, String title, String priceUsd, String priceSar, String date) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(left: 16, bottom: 8, top: 4),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(priceSar, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
              Text(priceUsd, style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          const SizedBox(height: 16),
          Text('التاريخ : $date', style: TextStyle(color: Colors.grey[500], fontSize: 11)),
        ],
      ),
    );
  }

  Widget _buildFeaturedServicesSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('خدماتنا المتميزة', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(child: InkWell(
                onTap: (){
                  context.read<HomeCubit>().changeTab('service');
                },
                child: _buildTabButton(context, ' الخدمات','service' ))),
            const SizedBox(width: 8),
            Expanded(child: InkWell(
                onTap: (){
                  context.read<HomeCubit>().changeTab('products');
                },
                child: _buildTabButton(context, 'المنتجات','products' ))),
            const SizedBox(width: 8),
            Expanded(child: InkWell(
                onTap: (){
                context.read<HomeCubit>().changeTab('rental');
                },
                child: _buildTabButton(context, 'تأجير المعدات','rental' ))),
          ],
        ),
        const SizedBox(height: 20),
        // GridView.count(
        //   crossAxisCount: 2,
        //   shrinkWrap: true,
        //   physics: const NeverScrollableScrollPhysics(),
        //   mainAxisSpacing: 16,
        //   crossAxisSpacing: 16,
        //   childAspectRatio: 0.85,
        //   children: [
        //     _buildFeaturedItem(context, 'سكراب الحديد', 'تداول وبيع وشراء سكراب الحديد بمختلف أنواعه'),
        //     _buildFeaturedItem(context, 'سكراب الحديد', 'تداول وبيع وشراء سكراب الحديد بمختلف أنواعه'),
        //   ],
        // ),

        BlocBuilder<HomeCubit, HomeState>(
          builder: (context,state) {
            return GridView.builder(
              controller: controller,
              shrinkWrap: true,
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.85,
              ),
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return _buildFeaturedItem(

                  context,
                  state.data[index]['title'] ?? '',
                  state.data[index]['description'] ?? '',

                );
              },
            );
          }
        )
        ///////////
        ///////////
      ],
    );
  }



  Widget _buildTabButton(BuildContext context, String title,String selectedTile) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final isSelected = state.selectedTab == selectedTile;
        print(isSelected);
        print(isSelected);
        print(isSelected);

        return Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? Theme.of(context).primaryColor : Colors.grey.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? Colors.white : Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        );
      },
    );
  }

  Widget _buildFeaturedItem(BuildContext context, String title, String subtitle) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.02), blurRadius: 4, offset: const Offset(0, 2))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFE0E0E0),
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                image: DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1518709268805-4e9042af9f23?ixlib=rb-4.0.3&auto=format&fit=crop&w=400&q=80'),
                  fit: BoxFit.cover,
                )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                const SizedBox(height: 4),
                Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 10, height: 1.4), maxLines: 2, overflow: TextOverflow.ellipsis),
              ],
            ),
          )
        ],
      ),
    );
  }
}
