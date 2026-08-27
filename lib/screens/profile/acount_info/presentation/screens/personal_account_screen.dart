import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/widgets/logout.dart';
import 'package:scraapy_pro/screens/profile/check/presentation/screens/inspection_demolition_menu.dart';
import 'package:scraapy_pro/screens/profile/operations/operations_menu.dart';
import 'package:scraapy_pro/screens/profile/subscriptions/subscriptions_screen.dart';
import 'package:shimmer/shimmer.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/checkout/checkout_screen.dart';
import 'package:scraapy_pro/screens/favorites/presentation/screens/favorites_screen.dart';
import 'package:scraapy_pro/screens/inspection/inspection_request_screen.dart';
import 'package:scraapy_pro/screens/notifications/presentation/screens/notifications_screen.dart';
import 'package:scraapy_pro/screens/profile/acount_info/data/data_sources/profile_remote_data_source.dart';
import 'package:scraapy_pro/screens/profile/acount_info/data/repositories/profile_repository_impl.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/use_cases/fetch_profile_use_case.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/cubit/profile_cubit.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/cubit/profile_state.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/screens/account_info_screen.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/screens/edit_personal_account.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/widgets/baqa_widget.dart';
import 'package:scraapy_pro/screens/profile/legal_settings/presentation/screens/legal_settings_menu.dart';
import 'package:scraapy_pro/screens/profile/my_menu/presentation/screens/my_menu_tap_screen.dart';
import '../../../../address/add_address_screen.dart';

class PersonalAccountScreen extends StatelessWidget {
  const PersonalAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final remoteDataSource = ProfileRemoteDataSourceImpl();
        final repository = ProfileRepositoryImpl(
          remoteDataSource: remoteDataSource,
        );
        final useCase = FetchProfileUseCase(repository: repository);
        return ProfileCubit(fetchProfileUseCase: useCase)
          ..fetchMeAndRefreshCache();
      },
      child: WillPopScope(
        onWillPop: () async => false,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            backgroundColor: Color(0xFFF9F9F9),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  CustomAppBar(title: 'الحساب الشخصى', haveBack: false),
                  PersonalInfoWidget(),
                  SizedBox(height: 16),
                  BaqaWidget(),
                  SizedBox(height: 16),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          AccountMenu(),
                          InkWell(
                            onTap: () {
                              //TODO:logout
                              // final storage = getIt<SecureStorage>();
                              //
                              // storage.delete(SessionStorageKeys.token);
                              showDialog(
                                context: context,
                                builder: (context) => DeleteAccountDialog().logout(context)
                              );


                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 38,
                                  height: 38,
                                  decoration: BoxDecoration(
                                    color: Color(0x14FF0000),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                      AppImages.remove,
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 14),
                                Text(
                                  'حذف الحساب',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xFFF70000),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PersonalInfoWidget extends StatelessWidget {
  const PersonalInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading || state is ProfileInitial) {
          return _ShimmerWidget();
        }

        String name = '...';
        String phone = '...';
        String imageUrl = '';

        if (state is ProfileLoaded) {
          name = state.user.fullName.isNotEmpty ? state.user.fullName : '...';
          phone = state.user.phoneNumber.isNotEmpty
              ? state.user.phoneNumber
              : '...';
          imageUrl = state.user.profileImageRelative;
        }

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 64,
                      width: 64,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary),
                        borderRadius: BorderRadius.circular(10000),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10000),

                        child: imageUrl.isNotEmpty
                            ? Image.network(fit: BoxFit.cover, imageUrl)
                            : SvgPicture.asset(
                                AppImages.user,
                                width: 30,
                                height: 30,

                                fit: BoxFit.scaleDown,
                              ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          phone,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const EditPersonalAccountScreen(
                          title: 'تعديل الملف الشخصي',
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: AppColors.lightBlue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        AppImages.frame,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _ShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 64,
                width: 64,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10000),
                ),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 16,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 14,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }
}

class AccountMenu extends StatelessWidget {
  AccountMenu({super.key});

  var menuItem = [
    {
      "title": "معلومات الحساب",
      "icon": "${AppImages.user}",
      "page": AccountInfoScreen(),
    },
    {
      "title": "قوائمي",
      "icon": "${AppImages.menus}",
      "page": MyMenuTapScreen(),
    },
    // {
    //   "title": "إضافة عنوان",
    //   "icon": "${AppImages.menus}",
    //   "page": AddAddressScreen(),
    // },
    {
      "title": 'الدفع',
      "icon": "${AppImages.menus}",
      "page": CheckoutScreen(),
    },
    {
      "title": 'المفضلة',
      "icon": "${AppImages.menus}",
      "page": FavoritesScreen(),
    },
    {
      "title": 'الإشعارات',
      "icon": "${AppImages.menus}",
      "page": NotificationsScreen(),
    },
    {
      "title": "العمليات",
      "icon": "${AppImages.menus}",
      "page": OperationsMenu(),
    },
    // {
    //   "title":"الخدمات اللوجستية",
    //   "icon":"${AppImages.menus}",
    //   "page":AccountInfoScreen()
    //
    // },
    // {
    //   "title":"العقود والوثائق",
    //   "icon":"${AppImages.menus}",
    //   "page":AccountInfoScreen()
    //
    // },
    {
      "title": "التقارير",
      "icon": "${AppImages.menus}",
      "page": AccountInfoScreen(),
    },
    {
      "title": "الفحص والهدم",
      "icon": "${AppImages.menus}",
      "page": InspectionDemolitionMenu(),
    },
    // {
    //   "title":"الفحص والهدم",
    //   "icon":"${AppImages.menus}",
    //   "page":AccountInfoScreen()
    //
    // },
    {
      "title": "الإعدادات والقانونية",
      "icon": "${AppImages.menus}",
      "page": LegalSettingsMenu(),
    },

    {
      "title":"الإشتراكات",
      "icon":"${AppImages.menus}",
      "page":SubscriptionsScreen()

    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: menuItem.length,
      shrinkWrap: true,
      padding: EdgeInsets.all(0),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => menuItem[index]['page'] as Widget,
                ),
              );
            },
            child: Container(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 38,
                        height: 38,
                        decoration: BoxDecoration(
                          color: AppColors.lightBlue, // you can change color
                          borderRadius: BorderRadius.circular(
                            8,
                          ), // rounded edges
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            '${menuItem[index]['icon']}',
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                      SizedBox(width: 14),
                      Text(
                        '${menuItem[index]['title']}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Color(0xFF234777),
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 14,
                    color: Color(0x89000000),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
