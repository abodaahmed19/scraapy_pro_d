import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/widgets/custom_text_field.dart';



class SubscriptionsScreen extends StatelessWidget {
   SubscriptionsScreen({super.key});

   List<FeatureCategory> categories = [
    FeatureCategory(
      title: 'المميزات الأساسية للتشغيل',
      icon: Icons.dashboard_outlined,
      items: [
        'إدارة العمليات اليومية',
        'لوحة تحكم رئيسية',
        'تقارير أساسية',
        'دعم فني على مدار الساعة',
      ],
    ),
    FeatureCategory(
      title: 'المحفظة والخدمات المالية',
      icon: Icons.account_balance_wallet_outlined,
      items: [
        'محفظة إلكترونية',
        'تحويل الأموال',
        'سجل المعاملات المالية',
        'فواتير إلكترونية',
      ],
    ),
    FeatureCategory(
      title: 'الخدمات التشغيلية واللوجستية',
      icon: Icons.local_shipping_outlined,
      items: [
        'إدارة الشحنات',
        'تتبع المركبات',
        'جدولة الرحلات',
        'إدارة المستودعات',
      ],
    ),
    FeatureCategory(
      title: 'التقارير والتحليلات المتقدمة',
      icon: Icons.bar_chart_outlined,
      items: [
        'تقارير الأداء التفصيلية',
        'تحليل البيانات',
        'مؤشرات الأداء الرئيسية',
        'تصدير التقارير',
      ],
    ),
    FeatureCategory(
      title: 'الحسابات والربط التقني',
      icon: Icons.people_outline,
      items: [
        'إدارة الحسابات',
        'API للتكامل',
        'ربط الأنظمة الخارجية',
        'إعدادات متقدمة',
      ],
    ),
    FeatureCategory(
      title: 'الحوافز والعروض الترويجية',
      icon: Icons.card_giftcard_outlined,
      items: [
        'برنامج النقاط',
        'العروض الموسمية',
        'كوبونات الخصم',
        'مكافآت الولاء',
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        // backgroundColor: const Color(0xFFF5F5F5),

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomAppBar(title: 'الإشتراكات'),
              ),
              // SizedBox(height: 100,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 600,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    padding: EdgeInsets.zero,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: BasicPlanCard(context,index),
                      );
                    },
                  ),
                ),
              ),

              SizedBox(height: 24,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Icon(Icons.circle,color: AppColors.terquaz,size: 8,),
                    SizedBox(width: 8,),
                    Text('للإطلاع علي باقي مميزات الباقة',style:
                    TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: AppColors.primary),),

                  ],
                ),
              ),
              SizedBox(height: 16,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text('المميزات',style:
                TextStyle(fontWeight: FontWeight.w600,fontSize: 14),),
              ),
              SizedBox(height: 4,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: CustomTextField(hint: 'ابحث عن الميزة'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0),
                    itemCount: categories.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index){
                  return  Padding(
                    padding:  EdgeInsets.only(bottom: 16.0),
                    child: CollapseWidget(title: categories[index].title,  icon: Icons.dashboard_outlined,
                        headers: ['الأساسية', 'المتقدمة', 'الإحترافية', 'الشاملة'],
                        rows: [
                          FeatureRowData(
                            title: 'ربط تقني (API) أساسي',
                            values: [true, true, true, true],
                          ),
                          FeatureRowData(
                            title: 'حسابات الفروع',
                            values: ['03', '03', '03', '03'],
                          ),
                          FeatureRowData(
                            title: 'تخصيص لوحة تحكم',
                            values: ['أساسي', 'أساسي', 'أساسي', 'أساسي'],
                          ),
                          FeatureRowData(
                            title: 'دمج مع أنظمة خارجية (SAP)',
                            values: [false, true, true, true],
                          ),
                        ],),
                  );
                }),
              ),
              SizedBox(height: 30,)


            ],
          ),
        )
      ),
    );
  }
}

// ── Basic Plan Card ──────────────────────────────────────────────────────────

Widget BasicPlanCard(BuildContext context,int index) {
  final includedFeatures = [
    '01شهر + 15 يوم إضافي',
    'إصدار مانيفيست',
    'شهادات (تدوير/إتلاف/إستلام)',
  ];

  final excludedFeatures = [
    'لوحة تحكم متقدمة ومؤشرات أداء',
    'مدير حساب مخصص',
    'علامة شريك معتمد',
    'تحليل المنافسين (منقدم)',
  ];

  return Stack(
    clipBehavior: Clip.none,
    // alignment: Alignment.topCenter,
    children: [
      SizedBox(
        width: 350,
        height: 600,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              index == 1?
              BoxShadow(
                color: const Color(0xFF1ABC9C).withOpacity(0.15),
                blurRadius: 20,
                offset: const Offset(0, 6),
              ):
              BoxShadow(
                color: Colors.black.withOpacity(0.07),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),


            ],
            ////////////////
            border:index == 1? Border.all(color: const Color(0xFF1ABC9C), width: 1.5):null,


          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      index == 1? SvgPicture.asset(AppImages.mostOrdered):
                       Icon(Icons.rocket_launch_outlined,
                          color: Color(0xFF244075), size: 28),

                      Container(
                        padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: index ==1? Color(0x33189491)
                              :Color(0x14244075),
                          borderRadius: BorderRadius.circular(8),
                          // border: Border.all(color: const Color(0xFFBFDBFE)),
                        ),
                        child:  Text(
                          index == 1? 'للشركات المتوسطة':

                          'للمبتدئين',
                          style: TextStyle(
                            fontSize: 12,
                            color:index == 1? Color(0xFF189491): Color(0xFF244075),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'الأساسية',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'للشركات الجديدة في مرحلة التجربة والانطلاق',
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 12),
                      RichText(
                        text: const TextSpan(
                          style: TextStyle(fontFamily: 'Cairo'),
                          children: [
                            TextSpan(
                              text: '1،200',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF244075),
                              ),
                            ),
                            TextSpan(
                              text: '  ريال/سنويا',
                              style: TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),
                const Divider(height: 1, color: Color(0xFFF0F0F0)),
                const SizedBox(height: 16),

                // Included features
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: includedFeatures
                        .map((f) => _FeatureRow(label: f, included: true))
                        .toList(),
                  ),
                ),

                const SizedBox(height: 8),

                // Excluded features
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: excludedFeatures
                        .map((f) => _FeatureRow(label: f, included: false))
                        .toList(),
                  ),
                ),

                const SizedBox(height: 20),

                // CTA button
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: index == 1?Color(0xFF179993) : Color(0xFF1B4F72),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'اختر الباقة',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
      index == 1?
      Positioned(
        top: -15,
        left: 0,
        right: 0,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFF1ABC9C),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF1ABC9C).withOpacity(0.4),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child:  Text(
              'الأكثر طلباً',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ):SizedBox(),
    ],
  );
}

// ── Advanced Plan Card ───────────────────────────────────────────────────────


// ── Shared Feature Row ───────────────────────────────────────────────────────

class _FeatureRow extends StatelessWidget {
  final String label;
  final bool included;
  final bool dark;

  const _FeatureRow({
    required this.label,
    required this.included,
    this.dark = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(
              color: included ? (dark
                  ? Colors.white.withOpacity(0.15)
                  : const Color(0xFFE8F8F0))
                  : const Color(0xFFFEEBEB),
              shape: BoxShape.circle,
            ),
            child: Icon(
              included ? Icons.check : Icons.close,
              size: 13,
              color: included ? const Color(0xFF1ABC9C) : Colors.red[300],
            ),
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: dark
                    ? Colors.white
                    : included
                    ? Colors.black87
                    : Colors.grey[400],
              ),
              textAlign: TextAlign.right,
              overflow: TextOverflow.ellipsis,
            ),
          ),

        ],
      ),
    );
  }
}



// ── Data Model ───────────────────────────────────────────────────────────────

class FeatureCategory {
  final String title;
  final IconData icon;
  final List<String> items;

  const FeatureCategory({
    required this.title,
    required this.icon,
    required this.items,
  });
}

const categories = [
  FeatureCategory(
    title: 'المميزات الأساسية للتشغيل',
    icon: Icons.dashboard_outlined,
    items: [
      'إدارة العمليات اليومية',
      'لوحة تحكم رئيسية',
      'تقارير أساسية',
      'دعم فني على مدار الساعة',
    ],
  ),
  FeatureCategory(
    title: 'المحفظة والخدمات المالية',
    icon: Icons.account_balance_wallet_outlined,
    items: [
      'محفظة إلكترونية',
      'تحويل الأموال',
      'سجل المعاملات المالية',
      'فواتير إلكترونية',
    ],
  ),
  FeatureCategory(
    title: 'الخدمات التشغيلية واللوجستية',
    icon: Icons.local_shipping_outlined,
    items: [
      'إدارة الشحنات',
      'تتبع المركبات',
      'جدولة الرحلات',
      'إدارة المستودعات',
    ],
  ),
  FeatureCategory(
    title: 'التقارير والتحليلات المتقدمة',
    icon: Icons.bar_chart_outlined,
    items: [
      'تقارير الأداء التفصيلية',
      'تحليل البيانات',
      'مؤشرات الأداء الرئيسية',
      'تصدير التقارير',
    ],
  ),
  FeatureCategory(
    title: 'الحسابات والربط التقني',
    icon: Icons.people_outline,
    items: [
      'إدارة الحسابات',
      'API للتكامل',
      'ربط الأنظمة الخارجية',
      'إعدادات متقدمة',
    ],
  ),
  FeatureCategory(
    title: 'الحوافز والعروض الترويجية',
    icon: Icons.card_giftcard_outlined,
    items: [
      'برنامج النقاط',
      'العروض الموسمية',
      'كوبونات الخصم',
      'مكافآت الولاء',
    ],
  ),
];



// class CollapseWidget extends StatelessWidget {
//   final String title;
//   final IconData icon;
//   final List<String> items;
//
//   const CollapseWidget({
//     super.key,
//     required this.title,
//     required this.icon,
//     required this.items,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.ltr,
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(color: const Color(0xFFE0E0E0)),
//         ),
//         child: ExpansionTile(
//           tilePadding: const EdgeInsets.symmetric(horizontal: 14),
//           childrenPadding: const EdgeInsets.fromLTRB(14, 0, 14, 12),
//           shape: const Border(),
//           leading: const Icon(Icons.keyboard_arrow_down, color: Colors.black54),
//           trailing: Container(
//             width: 36,
//             height: 36,
//             decoration: BoxDecoration(
//               color: const Color(0x33244075),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: Icon(icon, size: 18,),
//           ),
//           title: Text(
//             title,
//             textAlign: TextAlign.right,
//             style: const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w600,
//               color: Colors.black87,
//             ),
//           ),
//           children: items
//               .map((item) => Padding(
//             padding: const EdgeInsets.only(bottom: 8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 Text(item,
//                     style: const TextStyle(
//                         fontSize: 13, color: Colors.black87)),
//                 const SizedBox(width: 8),
//                 const Icon(Icons.check_circle_outline,
//                     size: 16, color: Color(0xFF1ABC9C)),
//               ],
//             ),
//           ))
//               .toList(),
//         ),
//       ),
//     );
//   }
// }


class FeatureRowData {
  final String title;
  final List<dynamic> values; // bool أو String

  FeatureRowData({
    required this.title,
    required this.values,
  });
}
class CollapseWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<String> headers; // أسماء الباقات
  final List<FeatureRowData> rows;

  const CollapseWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.headers,
    required this.rows,
  });

  Widget _buildValue(dynamic value) {
    if (value is bool) {
      return

        Container(
          width: 22,
          height: 22,
          decoration: BoxDecoration(
            color: value ? Color(0x1A244075) : Color(0x1AFB0000),
            shape: BoxShape.circle,
          ),
          child: Icon(
            value ? Icons.check : Icons.close,
            size: 13,
            color: value ? Colors.blue : Colors.red,
          ),
        );


        Icon(
        value ? Icons.check_circle : Icons.cancel,
        size: 18,
        color: value ? Colors.blue : Colors.red,
      );
    } else {
      return Text(
        value.toString(),
        style: const TextStyle(fontSize: 12),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color(0xFFE0E0E0)),
        ),
        child: ExpansionTile(
          enableFeedback: false,
          shape: const RoundedRectangleBorder(
            side: BorderSide.none,
          ),
          collapsedShape: const RoundedRectangleBorder(
            side: BorderSide.none,
          ),

          backgroundColor: Colors.transparent,
          collapsedBackgroundColor: Colors.transparent,

          title: Text( title, textAlign: TextAlign.right, style:
          TextStyle( fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87, ), ),
          leading: const Icon(Icons.keyboard_arrow_down, color: Colors.black54), trailing: Container( width: 36, height: 36, decoration: BoxDecoration( color: const Color(0x33244075),
          borderRadius: BorderRadius.circular(8), ), child: Icon(icon, size: 18,), ),
          children: [
            SizedBox(height: 22,),
            // 🔹 Header Row
            Container(
              height: 44,
              color: Color(0x1A244075),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Row(
                  children: [
                    ...headers.map(
                          (h) => Expanded(
                        child: Center(
                          child: Text(
                            h,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(child: SizedBox(child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text('الميزة',textAlign: TextAlign.start,)),)), // مكان اسم الميزة

                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),

            // const Divider(),

            // 🔹 Data Rows
            ...rows.map(
                  (row) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                child: Row(
                  children: [


                    // Values
                    ...row.values.map(
                          (v) => Expanded(
                        child: Center(child: _buildValue(v)),
                      ),
                    ),
                    // Feature name
                    Expanded(
                      child: Text(
                        row.title,
                        textAlign: TextAlign.right,style: TextStyle(
                          fontSize: 8,fontWeight: FontWeight.w500
                      ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

