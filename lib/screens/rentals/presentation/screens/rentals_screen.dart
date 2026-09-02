import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/rentals/domain/entities/retals_item_entity.dart';
import 'package:scraapy_pro/screens/rentals/presentation/cubit/Retals_cubit.dart';
import 'package:scraapy_pro/screens/rentals/presentation/cubit/Retals_state.dart';
import 'package:scraapy_pro/screens/shared_feature/product_item_card/presentation/cubit/add_quotation_cubit.dart';
import 'package:scraapy_pro/screens/shared_feature/product_item_card/presentation/cubit/add_quotation_state.dart';
import 'package:scraapy_pro/screens/shared_feature/product_item_card/presentation/widgets/product_item_card.dart';

class RentalsScreen extends StatelessWidget {
  const RentalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_)=> getIt<RentalsCubit>()..getRentals(),
      child: BlocProvider(
        create: (_) => getIt<AddQuotationCubit>(),
        child: BlocListener<AddQuotationCubit, AddQuotationState>(
          listener: (context, state) {
            if (state is QuotationSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('تم إرسال طلب عرض السعر بنجاح'),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is QuotationError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
        child: WillPopScope(
        onWillPop: () async => false,

        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: CustomAppBar(title: 'إيجار'),
                ),
                Expanded(
                  child: BlocBuilder<RentalsCubit, RentalsState>(
                    builder: (context, state) {
                      if (state is RentalsLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is RentalsLoaded) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.all(0),
                            itemCount: state.response.data.length,
                            itemBuilder: (context, index) {
                              // return _buildProductCard(context, state.response.data[index]);
                              return ProductItemCard(item: state.response.data[index]);
                            },
                          ),
                        );
                      }

                      if (state is RentalsError) {
                        return const Text('حدث خطأ');
                      }

                      return const SizedBox();
                    },
                  ),
                ),
              ],
            )
          ),
          ),
        ),
        ),
      ),
    );
  }

  // Widget _buildProductCard(BuildContext context, RentalsItemEntity item) {
  //   return Container(
  //     margin: const EdgeInsets.only(bottom: 24),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(16),
  //       border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
  //       boxShadow: [
  //         BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 10, offset: const Offset(0, 4))
  //       ],
  //     ),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Container(
  //           height: 180,
  //           width: double.infinity,
  //           decoration: const BoxDecoration(
  //             color: Color(0xFF82DADB),
  //             borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
  //             image: DecorationImage(
  //               image: NetworkImage('https://images.unsplash.com/photo-1581092160562-40aa08e78837?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80'),
  //               fit: BoxFit.cover,
  //             )
  //           ),
  //           child: Stack(
  //             children: [
  //               Positioned(
  //                 top: 12,
  //                 right: 12,
  //                 child: Container(
  //                   padding: const EdgeInsets.all(6),
  //                   decoration: BoxDecoration(
  //                     color: const Color(0xFF02D58E),
  //                     borderRadius: BorderRadius.circular(4),
  //                   ),
  //                   child: const Icon(Icons.list, color: Colors.white, size: 20),
  //                 ),
  //               ),
  //               Positioned(
  //                 top: 20,
  //                 left: -10,
  //                 child: Transform.rotate(
  //                   angle: -0.2,
  //                   child: Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Container(
  //                         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
  //                         color: Colors.red,
  //                         child: const Text('الموديل\nSF-X30KG', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
  //                       ),
  //                       const SizedBox(height: 4),
  //                       Container(
  //                         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
  //                         color: Colors.red,
  //                         child: const Text('السعر\n4500 دولار', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //
  //         Padding(
  //           padding: const EdgeInsets.all(16.0),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(item.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
  //                   Row(
  //                     children: [
  //                       Text(item.price, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14, fontWeight: FontWeight.bold)),
  //                       const SizedBox(width: 4),
  //                       Text('ر.س', style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 14, fontWeight: FontWeight.bold)),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //               const SizedBox(height: 12),
  //
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: [
  //                   Icon(Icons.inventory_2_outlined, color: Colors.grey[600], size: 18),
  //                   const SizedBox(width: 8),
  //                   Text('${item.quantity}'+' '+'الكمية المتوفرة', style: const TextStyle(color: Colors.grey, fontSize: 14)),
  //                 ],
  //               ),
  //               const SizedBox(height: 20),
  //
  //               Row(
  //                 children: [
  //                   Container(
  //                     decoration: BoxDecoration(
  //                       color: Colors.grey.withValues(alpha: 0.1),
  //                       borderRadius: BorderRadius.circular(8),
  //                     ),
  //                     child: Row(
  //                       children: [
  //                         IconButton(
  //                           icon: const Icon(Icons.remove, size: 16),
  //                           onPressed: () {},
  //                           constraints: const BoxConstraints(),
  //                           padding: const EdgeInsets.all(8),
  //                         ),
  //                         const Text('1', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
  //                         IconButton(
  //                           icon: const Icon(Icons.add, size: 16),
  //                           onPressed: () {},
  //                           constraints: const BoxConstraints(),
  //                           padding: const EdgeInsets.all(8),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   const SizedBox(width: 16),
  //
  //                   Expanded(
  //                     child: MainAppBtn(title: 'إضافة عرض سعر')
  //                   ),
  //                 ],
  //               )
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
