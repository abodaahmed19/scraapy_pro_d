import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/widgets/custom_text_field.dart';

class ImportNonDangerWast extends StatefulWidget {
  const ImportNonDangerWast({super.key});

  @override
  State<ImportNonDangerWast> createState() => _ImportNonDangerWastState();
}

class _ImportNonDangerWastState extends State<ImportNonDangerWast> {
  final headquartersProofController = TextEditingController();
  final zakatIncomeCertificateController = TextEditingController();
  final wasteImagesController = TextEditingController();
  final marketNeedProofController = TextEditingController();

  @override
  void dispose() {
    headquartersProofController.dispose();
    zakatIncomeCertificateController.dispose();
    wasteImagesController.dispose();
    marketNeedProofController.dispose();
    super.dispose();
  }

  Future<void> _pickUploadFile(TextEditingController controller) async {
    final FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.name.isNotEmpty) {
      controller.text = result.files.single.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(

          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.0),
            child: SingleChildScrollView(
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
                  const CustomTextField(
                    label: 'نوع المنشأة',
                    hint: 'اختر نوع المنشأة',
                    suffixIcon:   Icon(Icons.keyboard_arrow_down, color: Colors.grey),

                  ),

                  // 2. Commercial Register (رقم السجل التجاري)
                  const CustomTextField(
                    label: 'رقم السجل التجاري',
                    hint: 'ادخل رقم السجل التجاري',
                  ),

                  // 3. National Address (العنوان الوطني)
                  const CustomTextField(
                    label: 'العنوان الوطني',
                    hint: 'ادخل العنوان الوطني',
                  ),

                  // 4. Proof of Headquarters - File Upload (إثبات المقر)

                  CustomTextField(
                    label: 'إثبات المقر',
                    hint: 'ارفع صك الملكية',
                    readOnly: true,
                    onTap: () => _pickUploadFile(headquartersProofController),
                    suffixIcon:   Icon(Icons.upload_file_outlined, color: Colors.black54, size: 20),
                    controller: headquartersProofController,
                  ),
                  // 5. Zakat & Income Certificate - File Upload (شهادة الزكاة والدخل)

                  CustomTextField(
                    label: 'شهادة الزكاة والدخل',
                    hint: 'ارفع شهادة الزكاة والدخل',
                    readOnly: true,
                    onTap: () => _pickUploadFile(zakatIncomeCertificateController),
                    suffixIcon:   Icon(Icons.upload_file_outlined, color: Colors.black54, size: 20),
                    controller: zakatIncomeCertificateController,
                  ),
                  // 6. National Center Permit (تصريح المركز الوطني (موان))
                  const CustomTextField(
                    label: 'تصريح المركز الوطني (موان)',
                    hint: 'ادخل رقم ترخيص المركز الوطني',
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
                  const CustomTextField(
                    label: 'نوع النفايات',
                    hint: 'ادخل نوع النفايات',
                    suffixIcon:   Icon(Icons.keyboard_arrow_down, color: Colors.grey),

                  ),

                  // 2. Commercial Register (رقم السجل التجاري)
                  CustomTextField(
                    label: 'صور النفايا',
                    hint: 'ارفع صور الفايا',
                    readOnly: true,
                    onTap: () => _pickUploadFile(wasteImagesController),
                    suffixIcon:   Icon(Icons.upload_file_outlined, color: Colors.black54, size: 20),
                    controller: wasteImagesController,
                  ),

                  CustomTextField(
                    label: 'احتياج السوق المحلي',
                    hint: 'اشرح ضرورة اسيراد هذا النوع لسد فجوة في السوق المحلي',
                    readOnly: true,
                    onTap: () => _pickUploadFile(marketNeedProofController),
                    suffixIcon:   Icon(Icons.upload_file_outlined, color: Colors.black54, size: 20),
                    controller: marketNeedProofController,
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
                          Checkbox(value: false, onChanged: (val){}),
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

                  const CustomTextField(
                    label: 'بيانات الناقل',
                    hint: 'ادخل رقم رخصة الناقل',
                  ),
                  const CustomTextField(
                    label: 'منشأة التخزين المؤقت (في حالة وجود تخزين)',
                    hint: 'ادخل بيانات منشأة تخزين مؤقتة مرخصة من قبل المركز',
                  ),
                  const CustomTextField(
                    label: 'مرافق التدوير',
                    hint: 'وضع توافر المرافق الجاهزة لمعالجة كميات النفايات المستوردة',
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
                          Checkbox(value: false, onChanged: (val){}),
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

                ],
              ),
            ),
          )
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