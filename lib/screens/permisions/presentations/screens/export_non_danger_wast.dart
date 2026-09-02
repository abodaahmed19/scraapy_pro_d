import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/permisions/domain/entities/export_permit/export_nondanger_waste.dart';
import 'package:scraapy_pro/screens/permisions/presentations/cubit/export_non_danger_waste_cubit.dart';
import 'package:scraapy_pro/screens/permisions/presentations/cubit/export_non_danger_waste_state.dart';
import 'package:scraapy_pro/widgets/custom_text_field.dart';

class ExportNonDangerWast extends StatefulWidget {
  const ExportNonDangerWast({super.key});

  @override
  State<ExportNonDangerWast> createState() => _ExportNonDangerWastState();
}

class _ExportNonDangerWastState extends State<ExportNonDangerWast> {
  final formKey = GlobalKey<FormState>();

  final facilityTypeController = TextEditingController();
  final commercialRegisterController = TextEditingController();
  final nationalAddressController = TextEditingController();
  final headquartersProofController = TextEditingController();
  final zakatIncomeCertificateController = TextEditingController();
  final mwanLicenseNumberController = TextEditingController();
  final wasteTypeController = TextEditingController();
  final wasteImagesController = TextEditingController();
  final marketStatusProofController = TextEditingController();
  final logisticsDescriptionController = TextEditingController();
  final collectionTransportMethodController = TextEditingController();
  final carrierLicenseNumberController = TextEditingController();
  final temporaryStorageFacilityController = TextEditingController();

  bool recyclingCommitment = false;
  bool vehicleComplianceAck = false;
  bool modificationAck = false;

  @override
  void dispose() {
    facilityTypeController.dispose();
    commercialRegisterController.dispose();
    nationalAddressController.dispose();
    headquartersProofController.dispose();
    zakatIncomeCertificateController.dispose();
    mwanLicenseNumberController.dispose();
    wasteTypeController.dispose();
    wasteImagesController.dispose();
    marketStatusProofController.dispose();
    logisticsDescriptionController.dispose();
    collectionTransportMethodController.dispose();
    carrierLicenseNumberController.dispose();
    temporaryStorageFacilityController.dispose();
    super.dispose();
  }

  final Map<TextEditingController, PlatformFile> pickedFiles = {};

  Future<void> _pickUploadFile(TextEditingController controller) async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.name.isNotEmpty) {
      pickedFiles[controller] = result.files.single;
      controller.text = result.files.single.name;
    }
  }

  FormData _buildExportFormData(ExportNonDangerWasteModel model) {
    final formData = FormData();
    formData.fields.addAll([
      MapEntry('facility_type', model.facilityType),
      MapEntry('commercial_register', model.commercialRegister),
      MapEntry('national_address', model.nationalAddress),
      MapEntry('mwan_license_number', model.mwanLicenseNumber),
      MapEntry('waste_type', model.wasteType),
      MapEntry('recycling_commitment', '${model.recyclingCommitment}'),
      MapEntry('logistics_description', model.logisticsDescription),
      MapEntry('carrier_license_number', model.carrierLicenseNumber),
      MapEntry('collection_transport_method', model.collectionTransportMethod),
      MapEntry('temporary_storage_facility', model.temporaryStorageFacility),
      MapEntry('vehicle_compliance_ack', '${model.vehicleComplianceAck}'),
      MapEntry('modification_ack', '${model.modificationAck}'),
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
    addFile(wasteImagesController, 'waste_image');
    addFile(marketStatusProofController, 'market_proof');

    return formData;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ExportNonDangerWasteCubit>(),
      child: BlocListener<ExportNonDangerWasteCubit, ExportNonDangerWasteState>(
        listener: (context, state) {
          if (state is ExportNonDangerWasteSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('تم إرسال الطلب بنجاح'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pop(context);
          } else if (state is ExportNonDangerWasteError) {
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
                  Text('اصدار النفايات غير الخطرة',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: AppColors.primary),),
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
                    controller: mwanLicenseNumberController,
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
                    label: 'نوع النفايا',
                    hint: 'ادخل نوع النفايا',
                    controller: wasteTypeController,
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
                    label: 'اثبات حالة السوق والمرافق',
                    hint: 'ارفع ما يثيت عدم احتياج السوق المحلي للفايات',
                    readOnly: true,
                    onTap: () => _pickUploadFile(marketStatusProofController),
                    suffixIcon:   Icon(Icons.upload_file_outlined, color: Colors.black54, size: 20),
                    controller: marketStatusProofController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  Text('تعهد الاستخدام والتدوير *',style: TextStyle(
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
                                'أقر بأن التصدير بغرض التدوير أو المعالجة خارج المملكة نتيجة تعذر معالجتها محليًا',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,
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
                    label: 'وصف الرحلة اللوجستية',
                    hint: 'اكتب وصف تفصيلي لعمليات التخزين والشحن',
                    controller: logisticsDescriptionController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    label: 'طريقة الجمع والنقل',
                    hint: 'حدد الية التعامل الفني مع النفايات الخطرة',
                    controller: collectionTransportMethodController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
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
                    controller: temporaryStorageFacilityController,
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
                        'خطة الطوارئ والإلتزامات',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  Text('مطابقة المركبات *',style: TextStyle(
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
                                value: vehicleComplianceAck,
                                onChanged: (val) => setState(
                                    () => vehicleComplianceAck = val ?? false),
                              ),
                          SizedBox(width: 6,),
                          Container(
                            width: MediaQuery.of(context).size.width *0.7,
                            child: Text(
                                textAlign: TextAlign.start,
                                'أقر بأن نوع النفايات مطابق لفئة النفايات المسموح للمركبات بنقلها بحسب رخصة المركز',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,
                                color:Colors.black )),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12,),
                  Text('حق التعديل *',style: TextStyle(
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
                                value: modificationAck,
                                onChanged: (val) => setState(
                                    () => modificationAck = val ?? false),
                              ),
                          SizedBox(width: 6,),
                          Container(
                            width: MediaQuery.of(context).size.width *0.7,
                            child: Text(
                                textAlign: TextAlign.start,
                                'أقر بعلمي بحق المركز في تعديل المتطلبات أو طلب بيانات إضافية في أي وقت دون إشعار مسبق',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,
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
                  BlocBuilder<ExportNonDangerWasteCubit, ExportNonDangerWasteState>(
                    builder: (context, state) {
                      final isLoading = state is ExportNonDangerWasteLoading;
                      return MainAppBtn(
                        title: 'تقديم طلب',
                        onTap: isLoading
                            ? null
                            : () {
                    if (!formKey.currentState!.validate()) return;

                    if (!recyclingCommitment) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('يجب الإقرار بتعهد الاستخدام والتدوير'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }
                    if (!vehicleComplianceAck) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('يجب الإقرار بمطابقة المركبات'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }
                    if (!modificationAck) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('يجب الإقرار بحق التعديل'),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }

                    ExportNonDangerWasteModel exportNonDangerWasteModel = ExportNonDangerWasteModel(
                        facilityType: facilityTypeController.text.trim(),
                        commercialRegister: commercialRegisterController.text,
                        nationalAddress: nationalAddressController.text,
                        facilityProof: headquartersProofController.text,
                        zakatCertificate: zakatIncomeCertificateController.text,
                        mwanLicenseNumber: mwanLicenseNumberController.text,
                        wasteType: wasteTypeController.text,
                        wasteImage: wasteImagesController.text,
                        marketProof: marketStatusProofController.text,
                        recyclingCommitment: recyclingCommitment,
                        logisticsDescription: logisticsDescriptionController.text,
                        carrierLicenseNumber: carrierLicenseNumberController.text,
                        collectionTransportMethod: collectionTransportMethodController.text,
                        temporaryStorageFacility: temporaryStorageFacilityController.text,
                        vehicleComplianceAck: vehicleComplianceAck,
                        modificationAck: modificationAck,
                        products: const <ProductModel>[]);

                    context
                        .read<ExportNonDangerWasteCubit>()
                        .exportingNonDangerWaste(
                            _buildExportFormData(exportNonDangerWasteModel));
                          },
                        child: isLoading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: AppColors.white,
                                ),
                              )
                            : null,
                      );
                    },
                  ),
                  SizedBox(height: 24,),

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