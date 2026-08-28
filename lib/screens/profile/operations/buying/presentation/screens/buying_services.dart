import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/const/app_colors.dart';

import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/presentation/cubit/buying_orders_cubit.dart';
import 'package:scraapy_pro/screens/profile/operations/buying/presentation/cubit/buying_orders_state.dart';
import 'package:scraapy_pro/screens/profile/operations/shared_widgets/order_card.dart';

import '../../../../../../core/di/injection.dart';

class BuyingOrders extends StatelessWidget {
  final bool fromInspection;

  const BuyingOrders({
    super.key,
    this.fromInspection = false,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (_) => getIt<BuyingOrdersCubit>()..getBuyingOrders(),
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(
                  title: 'الطلبات',
                ),
                Row(
                  children: [
                    Icon(Icons.circle,size: 8,color: AppColors.terquaz,),
                    SizedBox(width: 8,),
                    const Text('هنا يمكنك الإطلاع على الخدمات التي تم طلبها.',),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: BlocBuilder<BuyingOrdersCubit, BuyingOrdersState>(
                    builder: (context, state) {
                      if (state is BuyingOrdersLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (state is BuyingOrdersError) {
                        return Center(
                          child: Text(state.message),
                        );
                      }

                      if (state is BuyingOrdersLoaded) {
                        final orders = state.orders;

                        if (orders.isEmpty) {
                          return  Transform.translate(
                            offset: const Offset(0, -30),

                            child: Center(
                              child: Text(
                                'لا توجد طلبات',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          );
                        }

                        return ListView.builder(
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 20,
                          ),
                          itemCount: orders.length +
                              (state.hasMore ? 1 : 0),
                          itemBuilder: (context, index) {
                            if (index == orders.length) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                  top: 4,
                                  bottom: 16,
                                ),
                                child: _LoadMoreButton(
                                  isLoading: state.isLoadingMore,
                                  onPressed: () {
                                    context
                                        .read<BuyingOrdersCubit>()
                                        .loadMore();
                                  },
                                ),
                              );
                            }

                            return Padding(
                              padding: const EdgeInsets.only(
                                bottom: 16,
                              ),
                              child: OrderCard(
                                fromInspection: fromInspection,
                              ),
                            );
                          },
                        );
                      }

                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LoadMoreButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onPressed;

  const _LoadMoreButton({
    required this.isLoading,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Center(
          child: SizedBox(
            width: 24,
            height: 24,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          ),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'تحميل المزيد',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
