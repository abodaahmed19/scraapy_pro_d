import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/screens/permisions/domain/entities/import_permit/import_nondanger_waste.dart';
import 'package:scraapy_pro/screens/permisions/presentations/cubit/import_non_danger_waste_cubit.dart';
import 'package:scraapy_pro/screens/permisions/presentations/cubit/import_non_danger_waste_state.dart';
import 'package:scraapy_pro/widgets/custom_text_field.dart';

class ImportNonDangerWast extends StatefulWidget {
  const ImportNonDangerWast({super.key});

  @override
  State<ImportNonDangerWast> createState() => _ImportNonDangerWastState();
}

class _ImportNonDangerWastState extends State<ImportNonDangerWast> {
  final formKey = GlobalKey<FormState>();

  final facilityTypeController = TextEditingController();
  final commercialRegisterController = TextEditingController();
  final zakatIncomeCertificateController = TextEditingController();
  final wasteImagesController = TextEditingController();
  final marketNeedProofController = TextEditingController();
  final nationalAddressController = TextEditingController();
  final headquartersProofController = TextEditingController();
  final nationalCenterLicenseNumberController = TextEditingController();
  final wasteTypeController = TextEditingController();
  final carrierLicenseNumberController = TextEditingController();
  final tempStorageFacilityController = TextEditingController();
  final recyclingFacilitiesController = TextEditingController();

  bool recyclingCommitment = false;
  bool additionalRequirementsAck = false;

  @override
  void dispose() {
    facilityTypeController.dispose();
    zakatIncomeCertificateController.dispose();
    wasteImagesController.dispose();
    marketNeedProofController.dispose();
    commercialRegisterController.dispose();
    nationalAddressController.dispose();
    headquartersProofController.dispose();
    nationalCenterLicenseNumberController.dispose();
    wasteTypeController.dispose();
    carrierLicenseNumberController.dispose();
    tempStorageFacilityController.dispose();
    recyclingFacilitiesController.dispose();
    super.dispose();
  }

  Future<void> _pickUploadFile(TextEditingController controller) async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.name.isNotEmpty) {
      pickedFiles[controller] = result.files.single;
      controller.text = result.files.single.name;
    }
  }

  final Map<TextEditingController, PlatformFile> pickedFiles = {};

  FormData _buildImportFormData(ImportNondangerWasteModel model) {
    final formData = FormData();
    formData.fields.addAll([
      MapEntry('facility_type', model.facilityType),
      MapEntry('commercial_register', model.commercialRegister),
      MapEntry('national_address', model.nationalAddress),
      MapEntry(
          'national_center_license_number', model.nationalCenterLicenseNumber),
      MapEntry('waste_type', model.wasteType),
      MapEntry('market_need', model.marketNeed),
      MapEntry('recycling_commitment', '${model.recyclingCommitment}'),
      MapEntry('carrier_license_number', model.carrierLicenseNumber),
      MapEntry('temporary_storage_license', model.temporaryStorageLicense),
      MapEntry('recycling_facilities', model.recyclingFacilities),
      MapEntry('additional_requirements_ack',
          '${model.additionalRequirementsAck}'),
    ]);

    if (model.products.isNotEmpty) {
      formData.fields.add(MapEntry(
        'products',
        jsonEncode(model.products.map((p) => p.toJson()).toList()),
      ));
    }

    void addFile(TextEditingController controller, String apiField) {
      final PlatformFile? picked = pickedFiles[controller];
      if (picked == null) return;
      if (picked.path != null) {
        formData.files.add(MapEntry(
          apiField,
          MultipartFile.fromFileSync(picked.path!, filename: picked.name),
        ));
      } else if (picked.bytes != null) {
        formData.files.add(MapEntry(
          apiField,
          MultipartFile.fromBytes(picked.bytes!, filename: picked.name),
        ));
      }
    }

    addFile(headquartersProofController, 'facility_proof');
    addFile(zakatIncomeCertificateController, 'zakat_certificate');
    addFile(wasteImagesController, 'waste_images');

    return formData;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ImportNonDangerWasteCubit>(),
      child: BlocListener<ImportNonDangerWasteCubit, ImportNonDangerWasteState>(
        listener: (context, state) {
          if (state is ImportDangerNonWasteSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('تم إرسال الطلب بنجاح'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pop(context);
          } else if (state is ImportDangerNonWasteError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        child: Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Section Header

                  CustomAppBar(title: 'الأذونات'),
                  Text('استيراد النفايات غير الخطرة',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: AppColors.primary),),
                  SizedBox(height: 16,),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.circle, color: AppColors.terquaz, size: 8),

                      const SizedBox(width: 8),

                      const Text(
                        'بيانات المنشأة',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // 1. Dropdown Field (نوع المنشأة)
                   CustomTextField(
                    label: 'نوع المنشأة',
                    hint: 'اختر نوع المنشأة',
                    controller: facilityTypeController,
                    suffixIcon:   Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },

                  ),

                  // 2. Commercial Register (رقم السجل التجاري)
                  CustomTextField(
                    label: 'رقم السجل التجاري',
                    hint: 'ادخل رقم السجل التجاري',
                    controller: commercialRegisterController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),

                  // 3. National Address (العنوان الوطني)
                  CustomTextField(
                    label: 'العنوان الوطني',
                    hint: 'ادخل العنوان الوطني',
                    controller: nationalAddressController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),

                  // 4. Proof of Headquarters - File Upload (إثبات المقر)

                  CustomTextField(
                    label: 'إثبات المقر',
                    hint: 'ارفع صك الملكية',
                    readOnly: true,
                    onTap: () => _pickUploadFile(headquartersProofController),
                    suffixIcon:   Icon(Icons.upload_file_outlined, color: Colors.black54, size: 20),
                    controller: headquartersProofController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  // 5. Zakat & Income Certificate - File Upload (شهادة الزكاة والدخل)

                  CustomTextField(
                    label: 'شهادة الزكاة والدخل',
                    hint: 'ارفع شهادة الزكاة والدخل',
                    readOnly: true,
                    onTap: () => _pickUploadFile(zakatIncomeCertificateController),
                    suffixIcon:   Icon(Icons.upload_file_outlined, color: Colors.black54, size: 20),
                    controller: zakatIncomeCertificateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  // 6. National Center Permit (تصريح المركز الوطني (موان))
                  CustomTextField(
                    label: 'تصريح المركز الوطني (موان)',
                    hint: 'ادخل رقم ترخيص المركز الوطني',
                    controller: nationalCenterLicenseNumberController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  /////////////////////////////////////////////////////////////////


                  Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.circle, color: AppColors.terquaz, size: 8),

                      const SizedBox(width: 8),

                      const Text(
                        'التفاصيل الفنية للشحنة',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // 1. Dropdown Field (نوع المنشأة)
                  CustomTextField(
                    label: 'نوع النفايات',
                    hint: 'ادخل نوع النفايات',
                    controller: wasteTypeController,
                    suffixIcon:   Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },

                  ),

                  // 2. Commercial Register (رقم السجل التجاري)
                  CustomTextField(
                    label: 'صور النفايا',
                    hint: 'ارفع صور الفايا',
                    readOnly: true,
                    onTap: () => _pickUploadFile(wasteImagesController),
                    suffixIcon:   Icon(Icons.upload_file_outlined, color: Colors.black54, size: 20),
                    controller: wasteImagesController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),

                  CustomTextField(
                    label: 'احتياج السوق المحلي',
                    hint: 'اشرح ضرورة اسيراد هذا النوع لسد فجوة في السوق المحلي',
                    readOnly: true,
                    onTap: () => _pickUploadFile(marketNeedProofController),
                    suffixIcon:   Icon(Icons.upload_file_outlined, color: Colors.black54, size: 20),
                    controller: marketNeedProofController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  Text('تعهد التدوير*',style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color:  Colors.black87,
                    fontFamily: 'Cairo',
                  ),),
                  SizedBox(height: 16,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xFFF4F4F4),
                      border: Border.all(color: Color(0x33000000)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20),
                      child: Row(

                        children: [
                          Checkbox(
                                value: recyclingCommitment,
                                onChanged: (val) => setState(
                                    () => recyclingCommitment = val ?? false),
                              ),
                          SizedBox(width: 6,),
                          Container(
                            width: MediaQuery.of(context).size.width *0.7,
                            child: Text(
                                textAlign: TextAlign.start,
                                'أتعهد بتدوير 100% من كميات النفايات المستوردة وعدم ردم أي كمية منها',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,
                                color:Colors.black )),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  ///////////////////////////////////////////////////////////////////
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.circle, color: AppColors.terquaz, size: 8),

                      const SizedBox(width: 8),

                      const Text(
                        'اللوجستيات والنقل',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  CustomTextField(
                    label: 'بيانات الناقل',
                    hint: 'ادخل رقم رخصة الناقل',
                    controller: carrierLicenseNumberController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    label: 'منشأة التخزين المؤقت (في حالة وجود تخزين)',
                    hint: 'ادخل بيانات منشأة تخزين مؤقتة مرخصة من قبل المركز',
                    controller: tempStorageFacilityController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    label: 'مرافق التدوير',
                    hint: 'وضع توافر المرافق الجاهزة لمعالجة كميات النفايات المستوردة',
                    controller: recyclingFacilitiesController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),




                  ///////////////////////////////////////////////////////////////////
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.circle, color: AppColors.terquaz, size: 8),

                      const SizedBox(width: 8),

                      const Text(
                        'المرافقات والملاحظات القانونية',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  Text('اقرار المتطلبات الإضافية*',style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color:  Colors.black87,
                    fontFamily: 'Cairo',
                  ),),
                  SizedBox(height: 16,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Color(0xFFF4F4F4),
                      border: Border.all(color: Color(0x33000000)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 20),
                      child: Row(

                        children: [
                          Checkbox(
                                value: additionalRequirementsAck,
                                onChanged: (val) => setState(() =>
                                    additionalRequirementsAck = val ?? false),
                              ),
                          SizedBox(width: 6,),
                          Container(
                            width: MediaQuery.of(context).size.width *0.7,
                            child: Text(
                                textAlign: TextAlign.start,
                                'أقر بعلمي بأن للمركز الحق في تعديل المتطلبات أو طلب بيانات إضافية في أي وقت دون إشعار مسبق',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,
                                color:Colors.black )),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),


                  Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(Icons.circle, color: AppColors.terquaz, size: 8),

                      const SizedBox(width: 8),

                      const Text(
                        'بيانات المنتج',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.grey4),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          const Text(
                            'لم يتم إضافة أي منتجات بعد في السوق. يمكنك البدء بإضافة منتج جديد لعرض بياناته هنا.',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 10,
                              color:Color(0xFFFF0000),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16,),
                          MainAppBtn(title: 'إضافة منتج جديد',btnColor: AppColors.primary,haveGradient: false,),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24,),
                  BlocBuilder<ImportNonDangerWasteCubit, ImportNonDangerWasteState>(
                    builder: (context,state) {
                      final isLoading =
                      state is ImportDangerNonWasteLoading;
                      return MainAppBtn(
                        title: 'تقديم طلب',
                        onTap: isLoading
                            ? null
                            :()async {
                          if (!formKey.currentState!.validate()) return;

                          if (!recyclingCommitment) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('يجب الإقرار بالتعهد بالتدوير'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                          if (!additionalRequirementsAck) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('يجب الإقرار بالمتطلبات الإضافية'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                          if (!recyclingCommitment ||
                              !additionalRequirementsAck) {
                            return;
                          }

                          final ImportNondangerWasteModel
                          importNondangerWasteModel =
                          ImportNondangerWasteModel(
                            facilityType: facilityTypeController.text.trim(),
                            commercialRegister: commercialRegisterController.text,
                            nationalAddress: nationalAddressController.text,
                            facilityProof: headquartersProofController.text,
                            zakatCertificate: zakatIncomeCertificateController.text,
                            nationalCenterLicenseNumber: nationalCenterLicenseNumberController.text,
                            wasteType: wasteTypeController.text,
                            wasteImages: wasteImagesController.text,
                            marketNeed: marketNeedProofController.text,
                            recyclingCommitment: recyclingCommitment,
                            carrierLicenseNumber: carrierLicenseNumberController.text,
                            temporaryStorageLicense: tempStorageFacilityController.text,
                            recyclingFacilities: recyclingFacilitiesController.text,
                            additionalRequirementsAck: additionalRequirementsAck,
                            products: const <ProductModel>[],
                          );

                          context
                              .read<ImportNonDangerWasteCubit>()
                              .importingNonDangerWaste(
                              _buildImportFormData(
                                  importNondangerWasteModel));
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
                              : null
                      );
                    }
                  ),
                  SizedBox(height: 24,),

                ],
              ), // Column
              ), // Form
            ), // SingleChildScrollView
          ), // Padding
        ), // Scaffold
      ), // Directionality
      ), // BlocListener
    ); // BlocProvider

  }
}






/// Helper component for top text labels matching the design style
class FormLabel extends StatelessWidget {
  final String text;

  const FormLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 13,
        color: Colors.black87,
      ),
    );
  }
}

/// Standard Reusable Text Field Component

/// Reusable File Upload Field Component (with upload icon)
class CustomUploadField extends StatelessWidget {
  final String label;
  final String hint;

  const CustomUploadField({
    super.key,
    required this.label,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        FormLabel(text: label),
        const SizedBox(height: 8),
        Container(
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFFF9FAFB),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.grey4),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                hint,
                style: const TextStyle(color: AppColors.grey4, fontSize: 13),
              ),
              const Icon(Icons.upload_file_outlined, color: Colors.black54, size: 20),
            ],
          ),
        ),
      ],
    );
  }
}