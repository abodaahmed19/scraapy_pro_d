import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/profile/acount_info/domain/entities/address_entity.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/cubit/add_branch_cubit.dart';
import 'package:scraapy_pro/screens/profile/acount_info/presentation/cubit/add_branch_state.dart';
import 'package:scraapy_pro/widgets/custom_text_field.dart';
import 'package:scraapy_pro/widgets/map_placeholder.dart';
import 'package:scraapy_pro/widgets/responsive_layout.dart';

import '../../../../../core/di/injection.dart';


class AddAddressScreen extends StatefulWidget {
   AddAddressScreen({super.key});

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  final formKey = GlobalKey<FormState>();

  final branchNameController = TextEditingController();
  final shipmentNumberController = TextEditingController();
  final responsiblePersonController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final zipCodeController = TextEditingController();
  final onSiteContactController = TextEditingController();
  final cityController = TextEditingController();
  final regionController = TextEditingController();
  final contactPhoneController = TextEditingController();
  final coordinatesController = TextEditingController();

  @override
  void dispose() {
    branchNameController.dispose();
    shipmentNumberController.dispose();
    responsiblePersonController.dispose();
    phoneController.dispose();
    emailController.dispose();
    zipCodeController.dispose();
    onSiteContactController.dispose();
    cityController.dispose();
    regionController.dispose();
    contactPhoneController.dispose();
    coordinatesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: BlocProvider(
        create: (_) => getIt<AddBranchCubit>(),
        child: BlocListener<AddBranchCubit, AddBranchesState>(
          listener: (context, state) {
            if (state is AddBranchesSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Address created successfully')),
              );
              Navigator.of(context)..pop()..pop();
            }
          },
          child: Scaffold(

          body: ResponsiveLayout(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomAppBar(title: 'إضافة عنوان جديد'),
                    Text('إضافة فرع جديد',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: AppColors.primary),),
                    SizedBox(height: 16,),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(Icons.circle, color: AppColors.terquaz, size: 8),
                
                        const SizedBox(width: 8),
                
                        const Text(
                          'البيانات الاساسية',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16,),
                
                     CustomTextField(
                      label: 'اسم الفرع',
                      hint: 'ادخل اسم الفرع',
                      controller: branchNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'هذا الحقل مطلوب';
                        }
                
                        return null;
                      },
                    ),
                     CustomTextField(
                      label: 'رقم الشحنة',
                      hint: 'ادخل رقم الشحنة',
                      controller: shipmentNumberController,
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                           return 'هذا الحقل مطلوب';
                         }
                
                         return null;
                       },
                    ),
                     CustomTextField(
                      label: 'الشخص المسؤول',
                      hint: 'ادخل اسم الشخص',
                      controller: responsiblePersonController,
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                           return 'هذا الحقل مطلوب';
                         }
                
                         return null;
                       },
                    ),
                
                     CustomTextField(
                      label: 'رقم الهاتف',
                      hint: 'ادخل رقم الهاتف',
                      controller: phoneController,
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                           return 'هذا الحقل مطلوب';
                         }
                
                         return null;
                       },
                    ),
                     CustomTextField(
                      label: 'البريد الإلكتروني',
                      hint: 'اسم البريد الإلكتروني',
                      controller: emailController,
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                           return 'هذا الحقل مطلوب';
                         }
                
                         return null;
                       },
                    ),
                     CustomTextField(
                      label: 'الرمز البريدي',
                      hint: 'ادخل الرمز',
                      controller: zipCodeController,
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                           return 'هذا الحقل مطلوب';
                         }
                
                         return null;
                       },
                    ),
                     CustomTextField(
                      label: 'جه الاتصال في الموقع',
                      hint: 'اسم جه الاتصال',
                      controller: onSiteContactController,
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                           return 'هذا الحقل مطلوب';
                         }
                
                         return null;
                       },
                    ),
                
                     CustomTextField(
                      label: 'المدينة (اختياري)',
                      hint: 'اختر المدينة',
                      controller: cityController,
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                           return 'هذا الحقل مطلوب';
                         }
                
                         return null;
                       },
                    ),
                     CustomTextField(
                      label: 'المنطقة المختارة*',
                      hint: 'يملأ تلقائيا من الخريطة/ادخل يدويا',
                      controller: regionController,
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                           return 'هذا الحقل مطلوب';
                         }
                
                         return null;
                       },
                    ),
                
                     CustomTextField(
                      label: 'رقم الإتصال',
                      hint: 'ادخل رقم الاتصال',
                      controller: contactPhoneController,
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                           return 'هذا الحقل مطلوب';
                         }
                
                         return null;
                       },
                    ),
                    const MapPlaceholder(),
                    const SizedBox(height: 12),
                
                     CustomTextField(
                      label: 'إحداثيات الموقع',
                      hint: 'ادخل إحداثيات الموقع',
                      controller: coordinatesController,
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                           return 'هذا الحقل مطلوب';
                         }
                
                         return null;
                       },
                    ),
                    const SizedBox(height: 24),
                
                
                    Row(
                children: [
                  Expanded(
                    child: BlocBuilder<AddBranchCubit, AddBranchesState>(
                      builder: (context, state) {
                        final isLoading = state is AddBranchesLoading;
                        return MainAppBtn(
                          title: 'إضافة فرع',
                          onTap: isLoading
                              ? null
                              : () {
                  if (formKey.currentState!.validate()) {
                    // Form is valid
                    final address = AddressEntity(
                      id: 0,
                      name: branchNameController.text,
                      addressLine1: regionController.text,
                      addressLine2: shipmentNumberController.text,
                      city: cityController.text,
                      province: onSiteContactController.text,
                      zipCode: zipCodeController.text,
                      country: '',
                      longitude: coordinatesController.text,
                      latitude: coordinatesController.text,
                      onSiteContactName: responsiblePersonController.text,
                      onSiteContactPhone: phoneController.text,
                      user: 0,
                      is_default: false,
                    );
                    context.read<AddBranchCubit>().addBranch(address);
                  } else {
                    // Form has errors
                  }
                },
                          child: isLoading
                              ? const Center(
                                  child: SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: AppColors.white,
                                    ),
                                  ),
                                )
                              : null,
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                
                  Container(
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: MainAppBtn(
                    onTap: (){
                
                    },
                    title: 'إلغاء',haveGradient: false,
                    btnColor:AppColors.secBtnColor ,titleStyle: TextStyle(color: Colors.black),
                    border: Border.all(color: AppColors.secBtnBorderColor),
                  )),
                
                ],
                            ),
                
                            const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
          ),
        ),
      ),
    );
  }
}
