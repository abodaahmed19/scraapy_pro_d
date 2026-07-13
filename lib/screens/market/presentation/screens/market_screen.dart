import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/screens/market/presentation/cubit/market_cubit.dart';
import 'package:scraapy_pro/screens/market/presentation/cubit/market_state.dart';
import '../../../../widgets/responsive_layout.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> getIt<MarketCubit>()..getMarket(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('الخدمات'),
        ),
        body: BlocBuilder<MarketCubit, MarketState>(
          builder: (context, state) {
            if (state is MarketLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is MarketLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return _buildProductCard(context);
                  },
                ),
              );
            }

            if (state is MarketError) {
              return const Text('حدث خطأ');
            }

            return const SizedBox();
          },
        )
      ),
    );
  }

  Widget _buildProductCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Container(
            height: 180,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF82DADB),
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              image: DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1581092160562-40aa08e78837?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'),
                fit: BoxFit.cover,
              )
            ),
            child: Stack(
              children: [

                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: const Color(0xFF02D58E),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Icon(Icons.list, color: Colors.white, size: 20),
                  ),
                ),

                Positioned(
                  top: 20,
                  left: -10,
                  child: Transform.rotate(
                    angle: -0.2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          color: Colors.red,
                          child: const Text('الموديل\nSF-X30KG', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          color: Colors.red,
                          child: const Text('السعر\n4500 دولار', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('فك نقل وعفش', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Text('1500', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20, fontWeight: FontWeight.bold)),
                        const SizedBox(width: 4),
                        Text('ر.س', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('28 الكمية المتوفرة', style: TextStyle(color: Colors.grey, fontSize: 14)),
                    const SizedBox(width: 8),
                    Icon(Icons.inventory_2_outlined, color: Colors.grey[600], size: 18),
                  ],
                ),
                const SizedBox(height: 20),
                

                Row(
                  children: [

                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove, size: 16),
                            onPressed: () {},
                            constraints: const BoxConstraints(),
                            padding: const EdgeInsets.all(8),
                          ),
                          const Text('1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          IconButton(
                            icon: const Icon(Icons.add, size: 16),
                            onPressed: () {},
                            constraints: const BoxConstraints(),
                            padding: const EdgeInsets.all(8),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),

                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text('إضافة عرض سعر', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
