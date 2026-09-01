import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/screens/permisions/domain/entities/import_permit/import_danger_waste.dart';
import 'package:scraapy_pro/screens/permisions/presentations/cubit/import_danger_waste_cubit.dart';
import 'package:scraapy_pro/screens/permisions/presentations/cubit/import_danger_waste_state.dart';
import 'package:scraapy_pro/widgets/custom_text_field.dart';

class ImportDangerWaste extends StatefulWidget {
  const ImportDangerWaste({super.key});

  @override
  State<ImportDangerWaste> createState() => _ImportDangerWasteState();
}

class _ImportDangerWasteState extends State<ImportDangerWaste> {
  final formKey = GlobalKey<FormState>();

  final premiseTypeController = TextEditingController();
  final commercialRegisterController = TextEditingController();
  final nationalAddressController = TextEditingController();
  final headquartersProofController = TextEditingController();
  final zakatIncomeCertificateController = TextEditingController();
  final nationalCenterPermitController = TextEditingController();
  final wasteTypeController = TextEditingController();
  final internationalApprovalsController = TextEditingController();
  final resourceRiskReportController = TextEditingController();
  final laboratoryReportController = TextEditingController();
  final logisticsDescriptionController = TextEditingController();
  final collectionMethodController = TextEditingController();
  final carrierLicenseNumber = TextEditingController();
  final tempStorageFacilityController = TextEditingController();
  final emergencyResponsePlanController = TextEditingController();
  final marketNeedProofController = TextEditingController();

  final Map<TextEditingController, PlatformFile> pickedFiles = {};

  bool industrialUseCommitment = false;
  bool categoryComplianceAck = false;
  bool modificationAck = false;

  @override
  void dispose() {
    premiseTypeController.dispose();
    commercialRegisterController.dispose();
    nationalAddressController.dispose();
    headquartersProofController.dispose();
    zakatIncomeCertificateController.dispose();
    nationalCenterPermitController.dispose();
    wasteTypeController.dispose();
    internationalApprovalsController.dispose();
    resourceRiskReportController.dispose();
    laboratoryReportController.dispose();
    logisticsDescriptionController.dispose();
    collectionMethodController.dispose();
    carrierLicenseNumber.dispose();
    tempStorageFacilityController.dispose();
    emergencyResponsePlanController.dispose();
    marketNeedProofController.dispose();
    super.dispose();
  }

  Future<void> _pickUploadFile(TextEditingController controller) async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.name.isNotEmpty) {
      pickedFiles[controller] = result.files.single;
      controller.text = result.files.single.name;
    }
  }

  FormData _buildImportFormData(ImportDangerWasteModel model) {
    final formData = FormData();
    formData.fields.addAll([
      MapEntry('facility_type', model.facilityType),
      MapEntry('commercial_register', model.commercialRegister),
      MapEntry('national_address', model.nationalAddress),
      MapEntry(
          'national_center_license_number', model.nationalCenterLicenseNumber),
      MapEntry('waste_type', model.wasteType),
      MapEntry('industrial_use_commitment', '${model.industrialUseCommitment}'),
      MapEntry('logistics_description', model.logisticsDescription),
      MapEntry('collection_transport_method', model.collectionTransportMethod),
      MapEntry('carrier_license_number', model.carrierLicenseNumber),
      MapEntry('temporary_storage_facility', model.temporaryStorageFacility),
      MapEntry('market_need_proof', model.marketNeedProof),
      MapEntry('category_compliance_ack', '${model.categoryComplianceAck}'),
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
    addFile(internationalApprovalsController, 'basel_agreement_approval');
    addFile(resourceRiskReportController, 'material_risk_report');
    addFile(laboratoryReportController, 'lab_report');
    addFile(emergencyResponsePlanController, 'emergency_plan');

    return formData;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ImportDangerWastePermissionsCubit>(),
      child: BlocListener<ImportDangerWastePermissionsCubit, ImportDangerWastePermissionsState>(
        listener: (context, state) {
          if (state is ImportDangerWasteSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('تم إرسال الطلب بنجاح'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.of(context).pop();
          } else if (state is ImportDangerWasteError) {
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
                  Text('استيراد النفايات الخطرة',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: AppColors.primary),),
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
                    suffixIcon:   Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                    controller: premiseTypeController,
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
                    controller: nationalCenterPermitController,
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

                  // 1. Dropdown Field (نوع النفايات)
                  CustomTextField(
                    label: 'نوع النفايات',
                    hint: 'ادخل نوع النفايات',
                    suffixIcon:   Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                    controller: wasteTypeController,
                  ),
                  CustomTextField(
                    label: 'الموافقات الدولية (نازل)',
                    hint: 'ارفع الموافقات المطلوبة',
                    readOnly: true,
                    onTap: () => _pickUploadFile(internationalApprovalsController),
                    suffixIcon:   Icon(Icons.upload_file_outlined, color: Colors.black54, size: 20),
                    controller: internationalApprovalsController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),

                  CustomTextField(
                    label: 'تقرير مخاطر الموارد',
                    hint: 'ارفع تقرير مخاطر الموارد',
                    readOnly: true,
                    onTap: () => _pickUploadFile(resourceRiskReportController),
                    suffixIcon:   Icon(Icons.upload_file_outlined, color: Colors.black54, size: 20),
                    controller: resourceRiskReportController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    label: 'التقرير المخبري',
                    hint: 'ارفع تقرير مخبر معتمد (خلال اخر 3 اشهر)',
                    readOnly: true,
                    onTap: () => _pickUploadFile(laboratoryReportController),
                    suffixIcon:   Icon(Icons.upload_file_outlined, color: Colors.black54, size: 20),
                    controller: laboratoryReportController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  Text('تعهد الاستخدام الصناعي*',style: TextStyle(
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
                                value: industrialUseCommitment,
                                onChanged: (val) => setState(
                                    () => industrialUseCommitment = val ?? false),
                              ),
                          SizedBox(width: 6,),
                          Container(
                            width: MediaQuery.of(context).size.width *0.7,
                            child: Text(
                                textAlign: TextAlign.start,
                                'أقر باستخدام المواد المستوردة في العملية الصناعية بنسبة 100% دون تحويلها إلى نفايات',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,
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
                  const SizedBox(height: 16),

                  // 2. طريقة الجمع والنقل
                  CustomTextField(
                    label: 'طريقة الجمع والنقل',
                    hint: 'حدد آلية التعامل الفني مع النفايات الخطرة',
                    controller: collectionMethodController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // 3. بيانات الناقل
                  CustomTextField(
                    label: 'بيانات الناقل',
                    hint: 'ادخل رقم رخصة الناقل',
                    controller: carrierLicenseNumber,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // 4. منشأة التخزين المؤقت (في حالة وجود تخزين)
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

                  ///////////////////////////////////////////////////////////////////
                  SizedBox(height: 16,),

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
                  const SizedBox(height: 12),

                  CustomTextField(
                    label: 'خطة الاستجابة للطوارئ',
                    hint: 'ارفع ملف خطة الاستجابة لحالات الطوارئ أثناء الجمع والنقل',
                    readOnly: true,
                    onTap: () => _pickUploadFile(emergencyResponsePlanController),
                    suffixIcon: Icon(Icons.upload_file_outlined, color: Colors.black54, size: 20),
                    controller: emergencyResponsePlanController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  // 2. إثبات احتياج السوق (Text Field)
                  CustomTextField(
                    label: 'إثبات احتياج السوق',
                    hint: 'حدد آلية التعامل الفني مع النفايات الخطرة',
                    controller: marketNeedProofController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  Text('اقرار مطابقة الفئة*',style: TextStyle(
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
                                value: categoryComplianceAck,
                                onChanged: (val) => setState(
                                    () => categoryComplianceAck = val ?? false),
                              ),
                          SizedBox(width: 6,),
                          Container(
                            width: MediaQuery.of(context).size.width *0.7,
                            child: Text(
                                textAlign: TextAlign.start,
                                'ْاقر بأن نوع النفايات مطابق للفئة المسموح للمركبة بنقلها',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,
                                color:Colors.black )),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text('إقرار التعديلات *',style: TextStyle(
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
                                'أوافق على حق المركز في تعديل المتطلبات أو طلب بيانات إضافية في أي وقت دون إشعار مسبق',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,
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
                  BlocBuilder<ImportDangerWastePermissionsCubit,
                      ImportDangerWastePermissionsState>(
                    builder: (context, state) {
                      final isLoading =
                          state is ImportDangerWasteLoading;
                      return MainAppBtn(
                          title: 'تقديم طلب',
                          onTap: isLoading
                              ? null
                              : () async {
                                  if (!formKey.currentState!
                                      .validate()) {
                                    return;
                                  }

                                  if (!industrialUseCommitment) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                            'يجب الإقرار بالاستخدام الصناعي الكامل'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                  if (!categoryComplianceAck) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('يجب الإقرار بمطابقة الفئة'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                  if (!modificationAck) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('يجب الموافقة على التعديلات'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  }
                                  if (!industrialUseCommitment ||
                                      !categoryComplianceAck ||
                                      !modificationAck) {
                                    return;
                                  }

                                  final ImportDangerWasteModel
                                      importDangerWasteModel =
                                      ImportDangerWasteModel(
                                    facilityType:
                                        premiseTypeController.text,
                                    commercialRegister:
                                        commercialRegisterController.text,
                                    nationalAddress:
                                        nationalAddressController.text,
                                    facilityProof:
                                        headquartersProofController.text,
                                    zakatCertificate:
                                        zakatIncomeCertificateController
                                            .text,
                                    nationalCenterLicenseNumber:
                                        nationalCenterPermitController
                                            .text,
                                    wasteType: wasteTypeController.text,
                                    baselAgreementApproval:
                                        internationalApprovalsController
                                            .text,
                                    materialRiskReport:
                                        resourceRiskReportController
                                            .text,
                                    labReport:
                                        laboratoryReportController.text,
                                    industrialUseCommitment:
                                        industrialUseCommitment,
                                    logisticsDescription:
                                        logisticsDescriptionController
                                            .text,
                                    collectionTransportMethod:
                                        collectionMethodController.text,
                                    carrierLicenseNumber:
                                        carrierLicenseNumber.text,
                                    temporaryStorageFacility:
                                        tempStorageFacilityController
                                            .text,
                                    emergencyPlan:
                                        emergencyResponsePlanController
                                            .text,
                                    marketNeedProof:
                                        marketNeedProofController.text,
                                    categoryComplianceAck:
                                        categoryComplianceAck,
                                    modificationAck: modificationAck,
                                    products: const <ProductModel>[],
                                  );

                                  context
                                      .read<ImportDangerWastePermissionsCubit>()
                                      .importingDangerWaste(
                                          _buildImportFormData(
                                              importDangerWasteModel));
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
                              : null);
                    },
                  ),
                  SizedBox(height: 24,),


                  ], // children
                ), // Column
              ), // Form
            ), // SingleChildScrollView
          ), // Padding
        ), // Scaffold
      ), // Directionality
      ),
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