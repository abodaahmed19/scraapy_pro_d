import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/screens/services/presenation/cubit/service_cubit.dart';
import 'package:scraapy_pro/screens/services/presenation/cubit/service_state.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ServiceCubit>()..getServices(),
      child: const ServiceScreen(),
    );
  }
}

class ServiceScreen extends StatelessWidget {
  const ServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body:Column(
        children: [
          SizedBox(height: 60,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap:(){
                    Navigator.pop(context);
                    // Navigator.of(context, rootNavigator: true).pop();
                  },
                  child: Container(
                    height: 40,width: 40,
                    decoration: BoxDecoration(
                        color: AppColors.grey,

                        borderRadius: BorderRadius.all(Radius.circular(8))
                    ),
                    child: Icon(Icons.arrow_back_ios_sharp),

                  ),
                ),

                Text('الخدمات',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600),),
                Container()
              ],
            ),
          ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: BlocBuilder<ServiceCubit, ServiceState>(
            builder: (context, state) {
              if (state is ServiceLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              else if (state is ServiceLoaded) {
                final services = state.services;

                return GridView.builder(
                  itemCount: services.length, //
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    final item = services[index];

                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 102,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(Radius.circular(12)),
                              child: Image.asset(
                                AppImages.serviceImg,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${item.title}'), //
                                    Text(item.description??''),       //
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text('${item.price} الكمية المتوفرة'),
                                    const SizedBox(width: 4),
                                    Image.asset(AppImages.icon),
                                  ],
                                ),

                                MainAppBtn(
                                  title: 'إضافة عرض سعر',
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                                  titleStyle: const TextStyle(color: Colors.white),
                                  btnColor: AppColors.primary,
                                ),

                                const SizedBox(height: 8),

                                Container(
                                  height: 30,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.primary),
                                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('+'),
                                        Text('0'),
                                        Text('-'),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
                return Text('gggggggg');
              }

              else if (state is ServiceError) {
                return Center(child: Text(state.message));
              }

              return const SizedBox();
            },
          ),
        ),
      ),
        ],
      ),
    );
  }
}
