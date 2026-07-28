import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/entities/branches_entity.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/cubit/branches_cubit.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/cubit/branches_state.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/widgets/empty_branches.dart';

class BranchesScreen extends StatelessWidget {
  const BranchesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<BranchesCubit>()..getBranches(),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: BlocBuilder<BranchesCubit, BranchesState>(
            builder: (context, state) {
              if (state is BranchesLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is BranchesError) {
                return Center(child: Text(state.message));
              }

              if (state is BranchesLoaded) {
                if (state.branches.results.isEmpty) {
                  return const EmptyBranches();
                }

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      CustomAppBar(title: 'قائمة الفروع'),
                      Row(
                        children: [
                          Icon(Icons.circle, color: AppColors.terquaz, size: 10),
                          const SizedBox(width: 10),
                          Text('الفروع',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: AppColors.primary)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.branches.results.length,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, index) {
                            final branch = state.branches.results[index];
                            return _buildBranchCard(context, branch, index);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildBranchCard(BuildContext context, BranchEntity branch, int index) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: const Color(0x33000000), width: 1.4),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color(0x4A2563EB),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6.0, vertical: 4),
                          child: Center(child: Text('${index + 1}')),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(branch.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14)),
                    ],
                  ),
                  SvgPicture.asset(AppImages.remove),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  SvgPicture.asset(AppImages.pin),
                  const SizedBox(width: 6),
                  Text(branch.cityName,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 14)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  SvgPicture.asset(AppImages.phone),
                  const SizedBox(width: 6),
                  Text(branch.phoneNumber,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 14)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  SvgPicture.asset(AppImages.email),
                  const SizedBox(width: 6),
                  Text(branch.email,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: Color(0xFF234777))),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MainAppBtn(
                    width: MediaQuery.of(context).size.width * 0.4,
                    title: 'التقارير',
                    btnColor: AppColors.primary,
                    haveGradient: false,
                  ),
                  MainAppBtn(
                    width: MediaQuery.of(context).size.width * 0.2,
                    titleStyle: const TextStyle(color: Colors.black),
                    border: Border.all(color: const Color(0x33000000)),
                    title: 'عرض',
                    btnColor: AppColors.grey,
                    haveGradient: false,
                  ),
                  MainAppBtn(
                    width: MediaQuery.of(context).size.width * 0.2,
                    titleStyle: const TextStyle(color: Colors.black),
                    border: Border.all(color: const Color(0x33000000)),
                    title: 'تعديل',
                    btnColor: AppColors.grey,
                    haveGradient: false,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
