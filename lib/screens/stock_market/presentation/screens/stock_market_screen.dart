import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/stock_market/presentation/cubit/stock_market_cubit.dart';
import 'package:scraapy_pro/screens/stock_market/presentation/cubit/stock_market_state.dart';
import 'package:scraapy_pro/screens/stock_market/presentation/widgets/borsa_card.dart';

class StockMarketScreen extends StatelessWidget {
   StockMarketScreen({super.key});

  final ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StockMarketCubit()..changeTab('معادن'),
      child: WillPopScope(
        onWillPop: () async => false, //

        child: Builder(
          builder: (context) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Scaffold(

                  body: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(

                      children: [
                        CustomAppBar(title: 'أسعار البورصة',
                        ),
                        _buildServicesRow(context),
                        const SizedBox(height: 12),
                        Expanded(
                          child: GridView.builder(
                          controller: controller,
                          shrinkWrap: true,
                          // padding: const EdgeInsets.all(16),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 1.1,
                          ),
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return    BorsaCard( title:'بطاريات سيارات', priceSar: '450 ر.س', priceUsd: '0.03 \$', date: '15-3-1999',);
                          },
                                          ),
                        ),
                        SizedBox(height: 30,)

                      ],
                    ),
                  )
              ),
            );
          }
        ),
      ),
    );
  }
  Widget _buildServicesRow(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildServiceCard(context, 'معادن',
            onTap: (){
              context.read<StockMarketCubit>().changeTab('معادن');

            }
          ),
          _buildServiceCard(context, 'خردة حديد',
            onTap: (){
              context.read<StockMarketCubit>().changeTab('خردة حديد');

            }

          ),
          _buildServiceCard(context, 'بلاستيك',
              onTap: (){
                context.read<StockMarketCubit>().changeTab('بلاستيك');

              }
          ),
          _buildServiceCard(context, 'ورق',
              onTap: (){
                context.read<StockMarketCubit>().changeTab('ورق');

              }
          ),
          _buildServiceCard(context, 'زجاج/مطاط',
              onTap: (){
                context.read<StockMarketCubit>().changeTab('زجاج/مطاط');

              }
          ),
          _buildServiceCard(context, 'إلكترونيات / بطاريات',
              onTap: (){
                context.read<StockMarketCubit>().changeTab('إلكترونيات / بطاريات');

              }
          ),

        ],
      ),
    );
  }

  Widget _buildServiceCard(BuildContext context, String title,  {VoidCallback? onTap}) {
    return BlocBuilder<StockMarketCubit,StockMarketState>(
      builder: (context,state) {
        return GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.only(left: 12),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(

              color: title == state.selectedTab ?  AppColors.primary :Colors.grey.withValues(alpha: 0.1),
              // color: AppColors.grey ,
              borderRadius: BorderRadius.circular(12),

            ),
            child: Text(
              title,
              style: TextStyle(
                color: title == state.selectedTab ? AppColors.white : Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        );
      }
    );
  }


}

