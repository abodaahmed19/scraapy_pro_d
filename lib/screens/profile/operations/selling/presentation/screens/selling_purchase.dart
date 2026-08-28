import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/profile/check/presentation/screens/inspection_demolition_item_details.dart';
import 'package:scraapy_pro/screens/profile/operations/operations_details_screen.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/presentation/cubit/sold_product_cubit.dart';
import 'package:scraapy_pro/screens/profile/operations/selling/presentation/cubit/sold_product_state.dart';
import 'package:scraapy_pro/screens/profile/operations/shared_widgets/order_card.dart';

import '../../../../../../core/di/injection.dart';



class SoldProductsScreen extends StatelessWidget {
  final bool fromInspection;
  const SoldProductsScreen({super.key, this.fromInspection = false});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (_)=> getIt<SoldProductCubit>()..getSoldProducts(),
        child: Scaffold(
          // backgroundColor: const Color(0xFFF7F8FA),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                CustomAppBar(title: "المنتجات المباعة"),

                Expanded(
                  child: BlocBuilder<SoldProductCubit,SoldProductState>(
                    builder: (context,state) {


                      if (state is SoldProductLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (state is SoldProductLoaded) {
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: 6,
                            padding: EdgeInsets.all(0),
                            itemBuilder: (context,index){
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: OrderCard(fromInspection: fromInspection,),
                              );
                            });

                      }

                      if (state is SoldProductError) {
                        return Center(child: const Text('حدث خطأ'));
                      }

                      return const SizedBox();


                    }
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

