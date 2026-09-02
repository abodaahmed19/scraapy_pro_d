import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/permisions/domain/entities/export_permit/export_danger_waste.dart';
import 'package:scraapy_pro/screens/permisions/presentations/cubit/export_danger_waste_cubit.dart';
import 'package:scraapy_pro/screens/permisions/presentations/cubit/export_danger_waste_state.dart';
import 'package:scraapy_pro/widgets/custom_text_field.dart';

class ExportDangerWast extends StatefulWidget {
  const ExportDangerWast({super.key});

  @override
  State<ExportDangerWast> createState() => _ExportDangerWastState();
}

class _ExportDangerWastState extends State<ExportDangerWast> {
  final formKey = GlobalKey<FormState>();

  final facilityTypeController = TextEditingController();
  final commercialRegisterController = TextEditingController();
  final nationalAddressController = TextEditingController();
  final headquartersProofController = TextEditingController();
  final zakatIncomeCertificateController = TextEditingController();
  final mwanLicenseNumberController = TextEditingController();
  final wasteTypeController = TextEditingController();
  final internationalApprovalsController = TextEditingController();
  final resourceRiskReportController = TextEditingController();
  final laboratoryReportController = TextEditingController();
  final transportDocumentController = TextEditingController();
  final logisticsDescriptionController = TextEditingController();
  final collectionTransportMethodController = TextEditingController();
  final carrierLicenseNumberController = TextEditingController();
  final temporaryStorageContractController = TextEditingController();
  final vehiclesAndDriversController = TextEditingController();
  final emergencyResponsePlanController = TextEditingController();
  final noLocalAlternativeProofController = TextEditingController();

  bool usageCommitment = false;
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
    internationalApprovalsController.dispose();
    resourceRiskReportController.dispose();
    laboratoryReportController.dispose();
    transportDocumentController.dispose();
    logisticsDescriptionController.dispose();
    collectionTransportMethodController.dispose();
    carrierLicenseNumberController.dispose();
    temporaryStorageContractController.dispose();
    vehiclesAndDriversController.dispose();
    emergencyResponsePlanController.dispose();
    noLocalAlternativeProofController.dispose();
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

  FormData _buildExportFormData(ExportDangerWasteModel model) {
    final formData = FormData();
    formData.fields.addAll([
      MapEntry('facility_type', model.facilityType),
      MapEntry('commercial_register', model.commercialRegister),
      MapEntry('national_address', model.nationalAddress),
      MapEntry('mwan_license_number', model.mwanLicenseNumber),
      MapEntry('waste_type', model.wasteType),
      MapEntry('usage_commitment', '${model.usageCommitment}'),
      MapEntry('logistics_description', model.logisticsDescription),
      MapEntry('carrier_license_number', model.carrierLicenseNumber),
      MapEntry('collection_transport_method', model.collectionTransportMethod),
      MapEntry('temporary_storage_contract', model.temporaryStorageContract),
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
    addFile(internationalApprovalsController, 'basel_approval');
    addFile(resourceRiskReportController, 'risk_report');
    addFile(laboratoryReportController, 'lab_report');
    addFile(transportDocumentController, 'manifest_document');
    addFile(vehiclesAndDriversController, 'vehicles_and_drivers_file');
    addFile(emergencyResponsePlanController, 'emergency_plan');
    addFile(noLocalAlternativeProofController, 'no_local_alternative_proof');

    return formData;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ExportDangerWasteCubit>(),
      child: BlocListener<ExportDangerWasteCubit, ExportDangerWasteState>(
        listener: (context, state) {
          if (state is ExportDangerWasteSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('تم إرسال الطلب بنجاح'),
                backgroundColor: Colors.green,
              ),
            );
            Navigator.pop(context);
          } else if (state is ExportDangerWasteError) {
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
                  Text('اصدار النفايات الخطرة',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: AppColors.primary),),
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
                  CustomTextField(
                    label: 'وثيقة النقل',
                    hint: 'ارفع اداة نقل الملف',
                    readOnly: true,
                    onTap: () => _pickUploadFile(transportDocumentController),
                    suffixIcon:   Icon(Icons.upload_file_outlined, color: Colors.black54, size: 20),
                    controller: transportDocumentController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  Text('تعهد الاستخدام *',style: TextStyle(
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
                                value: usageCommitment,
                                onChanged: (val) => setState(
                                    () => usageCommitment = val ?? false),
                              ),
                          SizedBox(width: 6,),
                          Container(
                            width: MediaQuery.of(context).size.width *0.7,
                            child: Text(
                                textAlign: TextAlign.start,
                                'أقر بأن التصدير بغرض المعالجة أو التخلص النهائي لعدم توفر مرافق محلية أو عدم احتياج السوق المحلي',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 10,
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
                    controller: collectionTransportMethodController,
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
                    controller: carrierLicenseNumberController,
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
                    controller: temporaryStorageContractController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),
                  CustomTextField(
                    label: 'بيانات المركبات والسائقين',
                    hint: 'ارفع ملف او جدول البيانات',
                    readOnly: true,
                    onTap: () => _pickUploadFile(vehiclesAndDriversController),
                    suffixIcon: Icon(Icons.upload_file_outlined, color: Colors.black54, size: 20),
                    controller: vehiclesAndDriversController,
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
                    label: 'اثبات عدم توافر بديل محلي',
                    hint: 'ارفع ملف يثبت عدم قدرة المرافق المحلية',
                    readOnly: true,
                    onTap: () => _pickUploadFile(noLocalAlternativeProofController),
                    suffixIcon: Icon(Icons.upload_file_outlined, color: Colors.black54, size: 20),
                    controller: noLocalAlternativeProofController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'هذا الحقل مطلوب';
                      }
                      return null;
                    },
                  ),

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
                  BlocBuilder<ExportDangerWasteCubit, ExportDangerWasteState>(
                    builder: (context, state) {
                      final isLoading = state is ExportDangerWasteLoading;
                      return MainAppBtn(
                        title: 'تقديم طلب',
                        onTap: isLoading
                            ? null
                            : () {
                                if (!formKey.currentState!.validate()) {
                                  return;
                                }

                                if (!usageCommitment) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('يجب الإقرار بتعهد الاستخدام'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }
                                if (!modificationAck) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('يجب الإقرار بالتعديلات'),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                  return;
                                }

                                ExportDangerWasteModel
                                    exportDangerWasteModel =
                                    ExportDangerWasteModel(
                                  facilityType: facilityTypeController.text.trim(),
                                  commercialRegister:
                                      commercialRegisterController.text,
                                  nationalAddress: nationalAddressController.text,
                                  facilityProof:
                                      headquartersProofController.text,
                                  zakatCertificate:
                                      zakatIncomeCertificateController.text,
                                  mwanLicenseNumber:
                                      mwanLicenseNumberController.text,
                                  wasteType: wasteTypeController.text,
                                  baselApproval:
                                      internationalApprovalsController.text,
                                  riskReport:
                                      resourceRiskReportController.text,
                                  labReport: laboratoryReportController.text,
                                  manifestDocument:
                                      transportDocumentController.text,
                                  usageCommitment: usageCommitment,
                                  logisticsDescription:
                                      logisticsDescriptionController.text,
                                  carrierLicenseNumber:
                                      carrierLicenseNumberController.text,
                                  collectionTransportMethod:
                                      collectionTransportMethodController.text,
                                  vehiclesAndDriversFile:
                                      vehiclesAndDriversController.text,
                                  temporaryStorageContract:
                                      temporaryStorageContractController.text,
                                  emergencyPlan:
                                      emergencyResponsePlanController.text,
                                  noLocalAlternativeProof:
                                      noLocalAlternativeProofController.text,
                                  modificationAck: modificationAck,
                                  products: const <ProductModel>[],
                                );

                                context
                                    .read<ExportDangerWasteCubit>()
                                    .exportingDangerWaste(_buildExportFormData(
                                        exportDangerWasteModel));
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
                  SizedBox(height: 24,),

                ],
              ),
            ),
          ),
          )
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