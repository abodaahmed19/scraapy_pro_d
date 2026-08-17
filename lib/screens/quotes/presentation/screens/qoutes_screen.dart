import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/market/domain/entities/market_item_entity.dart';
import 'package:scraapy_pro/screens/market/presentation/cubit/market_cubit.dart';
import 'package:scraapy_pro/screens/market/presentation/cubit/market_state.dart';
import 'package:scraapy_pro/screens/quotes/presentation/cubit/qoutes_cubit.dart';
import 'package:scraapy_pro/screens/quotes/presentation/cubit/qoutes_state.dart';
import 'package:scraapy_pro/widgets/custom_text_field.dart';

class QuotesScreen extends StatelessWidget {
  const QuotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('jjjjjjjjjjjjjjjjjjjjjjjj');
    return MultiBlocProvider(
      // create: (_)=> getIt<MarketCubit>()..getMarket(),
      providers: [
        BlocProvider<MarketCubit>(
          create: (_)=> getIt<MarketCubit>()..getMarket(),
        ),
        BlocProvider<QoutesCubit>(
          create: (_) => getIt<QoutesCubit>(),
        ),

      ],
      child: WillPopScope(
        onWillPop: () async => false,

        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomAppBar(title: 'طلب عرض سعر', haveBack: false),
                    CustomTextField(hint: 'ادخل اسم المنتج',label: 'ادخل اسم المنتج',),
                    // SizedBox(height: 16,),
                    Text('الفئات',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                    SizedBox(height: 12,),
                    BlocBuilder<QoutesCubit, QoutesState>(
                      builder: (context,st) {
                        return Row(
                          children: [
                            Expanded(child: InkWell(
                                onTap: (){
                                  context.read<QoutesCubit>().changeTab('service');
                                },
                                child: _buildTabButton(context, ' الخدمات','service' ))),
                            const SizedBox(width: 8),
                            Expanded(child: InkWell(
                                onTap: (){
                                  context.read<QoutesCubit>().changeTab('market');
                                },
                                child: _buildTabButton(context, 'السوق','market' ))),
                            const SizedBox(width: 8),
                            Expanded(child: InkWell(
                                onTap: (){
                                  context.read<QoutesCubit>().changeTab('rental');
                                },
                                child: _buildTabButton(context, 'الإيجار','rental' ))),
                          ],
                        );
                      }
                    ),
                    SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('السوق',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                        Text('عرض الكل',style: TextStyle(color: AppColors.primary,fontSize: 14,fontWeight: FontWeight.w500),),

                      ],
                    ),
                    SizedBox(height: 20,),

                    Expanded(
                      child: BlocBuilder<MarketCubit, MarketState>(
                        builder: (context, state) {
                          if (state is MarketLoading) {
                            return const Center(child: CircularProgressIndicator());
                          }

                          if (state is MarketLoaded) {
                            return ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.all(0),
                              itemCount: state.response.data.length,
                              itemBuilder: (context, index) {
                                return _buildProductCard(context, state.response.data[index]);
                              },
                            );
                          }

                          if (state is MarketError) {
                            return const Text('حدث خطأ');
                          }

                          return const SizedBox();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            bottomNavigationBar: SafeArea(
              child: Padding(
                padding:  EdgeInsets.all(16),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: MainAppBtn(title: 'إصدار عرض سعر')
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabButton(BuildContext context, String title,String selectedTile) {
    return BlocBuilder<QoutesCubit, QoutesState>(
      builder: (context, state) {
        final isSelected = state.selectedTab == selectedTile;

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


  Widget _buildProductCard(BuildContext context, MarketItemEntity item) {
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
                    Text(item.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Text(item.price, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14, fontWeight: FontWeight.bold)),
                        const SizedBox(width: 4),
                        Text('ر.س', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12),


                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.inventory_2_outlined, color: Colors.grey[600], size: 18),
                    const SizedBox(width: 8),
                    Text('${item.quantity}'+' '+'الكمية المتوفرة', style: const TextStyle(color: Colors.grey, fontSize: 14)),
                  ],
                ),
                const SizedBox(height: 20),


                Row(
                  children: [


                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text('إضافة عرض سعر', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    const SizedBox(width: 16),
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
