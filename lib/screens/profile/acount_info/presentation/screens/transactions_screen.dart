import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';

import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/cubit/my_wallet_transactions_cubit.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/cubit/my_wallet_transactions_state.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../core/di/injection.dart';

class TransactionsScreen extends StatelessWidget {
  TransactionsScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (_)=> getIt<MyWalletTransactionsCubit>()..getMyWalletTransactions(),

        child: Scaffold(
          // backgroundColor: Color(0xFFF9F9F9),
          backgroundColor: AppColors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                CustomAppBar(title: 'المعاملات',),
                BlocBuilder<MyWalletTransactionsCubit,MyWalletTransactionsState>
                  (builder: (context,state){
                  if (state is MyWalletTransactionsLoading) {
                    return const Expanded( child: TransactionsShimmer(), );
                  }

                  if (state is MyWalletTransactionsLoaded) {
                    return
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 7,
                            padding: EdgeInsets.all(0),
                            itemBuilder: (context,index){
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color:Color(0x33000000),width: 1.4)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [

                                            Row(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(6),
                                                    color: Color(0x4A2563EB),

                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 4),
                                                    child: Center(child: Text('1')),
                                                  ),
                                                ),
                                                SizedBox(width: 12,),
                                                Text('سحب رصيد',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,color: AppColors.primary
                                                )),
                                              ],
                                            ),
                                            Text('-1500',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 14,color: AppColors.primary
                                            )),                                ],
                                        ),
                                        SizedBox(height: 16,),
                                        Text('سحب - استخدم رصيدك في المحفظة الإلكترونية - فرع ثالث',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,
                                        )),
                                        SizedBox(height: 8,),
                                        Text('٢٢‏/٠٦‏/٢٠٢٦، ٠٦:١٢ م',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12,
                                        )),


                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      );

                  }

                  if (state is MyWalletTransactionsError) {
                    return Center(child: const Text('حدث خطأ'));
                  }

                  return const SizedBox();

                }),


              ],
            ),
          ),
        ),
      ),
    );
  }
}




class TransactionsShimmer extends StatelessWidget {
  const TransactionsShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: 7,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0x33000000),
                  width: 1.4,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 28,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            width: 80,
                            height: 16,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 55,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    height: 14,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 150,
                    height: 14,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}