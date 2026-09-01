import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';

import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/cubit/my_wallet_cubit.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/cubit/my_wallet_state.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/cubit/my_wallet_transactions_cubit.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/cubit/my_wallet_transactions_state.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/screens/edit_personal_account.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/screens/transactions_screen.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/widgets/transaction_widget.dart';
import 'package:scraapy_pro/widgets/custom_text_field.dart';

import '../../../../../core/di/injection.dart';

class WalletScreen extends StatelessWidget {
  WalletScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child:
        MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_)=> getIt<MyWalletCubit>()..getMyWalletData(),
          ),
          BlocProvider(
            create: (_)=> getIt<MyWalletTransactionsCubit>()..getMyWalletTransactions(),
          ),
        ],
        child: Scaffold(
          // backgroundColor: Color(0xFFF9F9F9),
          backgroundColor: AppColors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                CustomAppBar(title: 'المحفظة',),

                Expanded(
                  child: ListView(
                    padding: EdgeInsets.all(0),
                    children: [

                      BlocBuilder<MyWalletCubit,MyWalletState>(builder: (context,state){
                        if (state is MyWalletLoading) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Center(child: CircularProgressIndicator()),
                          );
                        }

                        if (state is MyWalletLoaded) {
                          return
                          Container(
                            width: double.infinity,
                            // height: 100,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.primary,
                                  AppColors.terquaz,
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('الرصيد الحالي',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,
                                      color:AppColors.white )),
                                  Row(
                                    children: [
                                      Text(state.myWalletEntity.balance,style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16,
                                          color:AppColors.white )),
                                      Text('ريال',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 12,
                                          color:AppColors.white )),
                                    ],
                                  ),
                                  SizedBox(height: 16,),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Color(0x3DFFFFFF)),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('ادارة رصيدك',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,
                                              color:AppColors.white )),
                                          SizedBox(height: 4,),
                                          Text('Id : 2144 2351 2148 142',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 10,
                                              color:AppColors.white )),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );

                        }

                        if (state is MyWalletError) {
                          return Center(child: const Text('حدث خطأ'));
                        }

                        return const SizedBox();

                      }),
                      SizedBox(height: 16,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0x33000000)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                                  SizedBox(width: 10,),

                                  Text('تحويل',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,
                                      color:AppColors.primary )),
                                ],
                              ),
                              SizedBox(height: 16,),
                              const CustomTextField(
                                hint: 'رقم الهاتف',
                              ),
                              const CustomTextField(
                                hint: 'المبلغ',
                              ),
                              const CustomTextField(
                                hint: 'الوصف(اختياري)',
                              ),
                              MainAppBtn(title: 'تحويل', titleStyle: null,  btnColor: AppColors.primary,haveGradient: false,)


                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16,),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0x33000000)),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                                  SizedBox(width: 10,),

                                  Text('طلب تحويل بنكي',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,
                                      color:AppColors.primary )),
                                ],
                              ),
                              SizedBox(height: 16,),
                              const CustomTextField(
                                hint: 'المبلغ',
                              ),
                              const CustomTextField(
                                hint: 'اختر البنك',
                              ),
                              const CustomTextField(
                                hint: 'رقم IBAN',
                              ),
                              const CustomTextField(
                                hint: 'البريد الالكتروني',
                              ),
                              const CustomTextField(
                                hint: 'رقم الهاتف',
                              ),
                              MainAppBtn(title: 'طلب تحويل بنكي', titleStyle: null, btnColor: AppColors.primary,haveGradient: false,)


                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Row(
                            children: [
                              Icon(Icons.circle,color: AppColors.terquaz,size: 10,),
                              SizedBox(width: 10,),

                              Text('المعاملات',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,
                                  color:AppColors.primary )),
                            ],
                          ),
                          InkWell(
                            onTap: (){

                              Navigator.push(context, MaterialPageRoute(builder: (_) =>  TransactionsScreen()));

                            },
                            child: Text('الكل',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14,
                                color:AppColors.primary )),
                          ),
                        ],
                      ),
                      SizedBox(height: 16,),

                      Text('اليوم',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,
                           )),
                      SizedBox(height: 20,),
                      BlocBuilder<MyWalletTransactionsCubit,MyWalletTransactionsState>(builder: (context,state){
                        if (state is MyWalletTransactionsLoading) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Center(child: CircularProgressIndicator()),
                          );
                          // return const Expanded( child: TransactionsShimmer(), );

                        }

                        if (state is MyWalletTransactionsLoaded) {
                          return
                            ListView.builder(
                                shrinkWrap: true,
                                itemCount: state.transactions.length,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.all(0),
                                itemBuilder: (context,index){
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 12.0),
                                    child: TransactionWidget(item: state.transactions[index],index: index,)
                                  );
                                });

                        }

                        if (state is MyWalletTransactionsError) {
                          return Center(child: const Text('حدث خطأ'));
                        }

                        return const SizedBox();

                      }),




                    ],
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




