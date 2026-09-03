import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';
import 'package:scraapy_pro/screens/quotes/domain/entities/quotes_list_model.dart';
import 'package:scraapy_pro/screens/quotes/presentation/cubit/quotes_list_cubit.dart';
import 'package:scraapy_pro/screens/quotes/presentation/cubit/quotes_list_state.dart';





// ── Data Models ───────────────────────────────────────────────────────────────

class QuoteItem {
  final int id;
  final String name;
  int quantity;
  final double price;

  QuoteItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
  });

  double get total => quantity * price;
}

Future<void> _printQuotesPdf(BuildContext context, QuotesListModel model) async {
  final cairoFont = pw.Font.ttf(
    await rootBundle.load('assets/fonts/Cairo-Regular.ttf'),
  );
  final doc = pw.Document(
    theme: pw.ThemeData.withFont(
      base: cairoFont,
      bold: pw.Font.ttf(
        await rootBundle.load('assets/fonts/Cairo-Bold.ttf'),
      ),
    ),
  );

  pw.MultiPage buildSectionPage({
    required String title,
    required ProductRentalServiceQuote section,
  }) {
    return pw.MultiPage(
      header: (context) => pw.Text(
        title,
        textDirection: pw.TextDirection.rtl,
        style: pw.TextStyle(
          fontSize: 16,
          fontWeight: pw.FontWeight.bold,
          color: PdfColors.blueGrey800,
        ),
      ),
      build: (context) => [
        pw.TableHelper.fromTextArray(
          headers: ['الاسم', 'الكمية', 'السعر', 'الإجمالي'],
          data: [
            for (final item in section.items)
              [
                item.name,
                '${item.quantity}',
                _fmt(item.price),
                _fmt(item.totalPrice),
              ],
          ],
          headerStyle: pw.TextStyle(
            color: PdfColors.white,
            fontWeight: pw.FontWeight.bold,
          ),
          headerDecoration: const pw.BoxDecoration(
            color: PdfColors.blueGrey700,
          ),
          cellStyle: pw.TextStyle(fontSize: 11),
          cellAlignments: {
            0: pw.Alignment.centerRight,
            1: pw.Alignment.center,
            2: pw.Alignment.center,
            3: pw.Alignment.center,
          },
          border: pw.TableBorder.all(
            color: PdfColors.grey300,
            width: 0.5,
          ),
        ),
        pw.SizedBox(height: 8),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(
              '₨ ${_fmt(section.totalPrice)}',
              style: pw.TextStyle(
                fontSize: 13,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.blueGrey800,
              ),
            ),
            pw.Text(
              'الإجمالي',
              style: pw.TextStyle(
                fontSize: 13,
                fontWeight: pw.FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  doc.addPage(buildSectionPage(title: 'السوق', section: model.products));
  doc.addPage(buildSectionPage(title: 'الإيجار', section: model.rentals));
  doc.addPage(buildSectionPage(title: 'الخدمات', section: model.services));

  final subtotal = model.products.totalPrice +
      model.rentals.totalPrice +
      model.services.totalPrice;
  final commission = double.parse(model.grand_commission);
  final fees = double.parse(model.grand_service_fees);
  final vat = double.parse(model.tax_amount);
  final grandTotal = double.parse(model.grandTotal);

  doc.addPage(
    pw.MultiPage(
      build: (context) => [
        pw.SizedBox(height: 8),
        _pdfSummaryRow(('الإجمالي الفرعي', _fmt(subtotal))),
        _pdfSummaryRow(('العمولة', _fmt(commission))),
        _pdfSummaryRow(('الرسوم', _fmt(fees))),
        _pdfSummaryRow(('القيمة المضافة', _fmt(vat))),
        pw.Divider(),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(
              '₨ ${_fmt(grandTotal)}',
              style: pw.TextStyle(
                fontSize: 14,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.blueGrey800,
              ),
            ),
            pw.Text(
              'إجمالي السعر',
              style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
            ),
          ],
        ),
      ],
    ),
  );

  final bytes = await doc.save();

  try {
    await Printing.layoutPdf(
      onLayout: (format) async => bytes,
      name: 'عرض_السعر.pdf',
    );
  } catch (_) {
    if (context.mounted) {
      await _savePdfAndNotify(context, bytes);
    }
  }
}

Future<void> _savePdfAndNotify(BuildContext context, Uint8List bytes) async {
  try {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/عرض_السعر.pdf');
    await file.writeAsBytes(bytes);

    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم حفظ ملف PDF بنجاح: ${file.path}')),
    );
  } catch (e) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تعذر حفظ ملف PDF: $e')),
    );
  }
}

pw.Widget _pdfSummaryRow((String, String) row) {
  return pw.Padding(
    padding: const pw.EdgeInsets.symmetric(vertical: 4),
    child: pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Text(row.$2, style: const pw.TextStyle(fontSize: 12)),
        pw.Text(
          row.$1,
          style: const pw.TextStyle(fontSize: 12, color: PdfColors.grey700),
        ),
      ],
    ),
  );
}

String _fmt(double value) {
  return value.toStringAsFixed(2);
}

// ── Page ──────────────────────────────────────────────────────────────────────

class QuotesListPage extends StatelessWidget {
  const QuotesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<QuotesListCubit>()..getQuotesList(),
      child: const _QuotesListPageView(),
    );
  }
}

class _QuotesListPageView extends StatelessWidget {
  const _QuotesListPageView();

  @override
  Widget build(BuildContext context) {
    print(';;;;;;;;;;;;;;;;;;;;;;;;');
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const CustomAppBar(title: 'إصدار عرض سعر'),
              Expanded(
                child: BlocBuilder<QuotesListCubit, QuotesListState>(
                  builder: (context, state) {
                    if (state is QuotesListLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (state is QuotesListError) {
                      return Center(child: Text(state.message));
                    }

                    if (state is QuotesListLoaded) {
                      return _buildContent(context, state);
                    }

                    return const SizedBox();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, QuotesListLoaded state) {
    final marketItems = state.response.products.items
        .map((i) => QuoteItem(
              id: i.id,
              name: i.name,
              quantity: i.quantity,
              price: i.price,
            ))
        .toList();

    final rentalItems = state.response.rentals.items
        .map((i) => QuoteItem(
              id: i.id,
              name: i.name,
              quantity: i.quantity,
              price: i.price,
            ))
        .toList();

    final serviceItems = state.response.services.items
        .map((i) => QuoteItem(
              id: i.id,
              name: i.name,
              quantity: i.quantity,
              price: i.price,
            ))
        .toList();

    final marketTotal = state.response.products.totalPrice;
    final rentalTotal = state.response.rentals.totalPrice;
    final serviceTotal = state.response.services.totalPrice;
    final subtotal = marketTotal + rentalTotal + serviceTotal;
    final commission = double.parse(state.response.grand_commission);
    final fees = double.parse(state.response.grand_service_fees);
    final vat = double.parse(state.response.tax_amount);
    final grandTotal = double.parse(state.response.grandTotal);

    return SingleChildScrollView(
      child: Column(
        children: [
          _buildCard(
            context,
            children: [
              const SizedBox(height: 16),
              _buildSection(
                context,
                title: 'السوق',
                items: marketItems,
                total: marketTotal,
              ),
              const SizedBox(height: 24),
              _buildSection(
                context,
                title: 'الإيجار',
                items: rentalItems,
                total: rentalTotal,
              ),
              const SizedBox(height: 24),
              _buildSection(
                context,
                title: 'الخدمات',
                items: serviceItems,
                total: serviceTotal,
              ),
            ],
          ),
          const SizedBox(height: 16),
          _buildSummaryCard(context,
              subtotal: subtotal,
              commission: commission,
              fees: fees,
              vat: vat,
              grandTotal: grandTotal),
          const SizedBox(height: 16),
          _buildPrintButton(context, state.response),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required List<QuoteItem> items,
    required double total,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Section title
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

             CircleAvatar(
                radius: 4, backgroundColor: AppColors.terquaz),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 17, fontWeight: FontWeight.bold, color: Colors.black87),
            ),

          ],
        ),
        const SizedBox(height: 12),

        // Table

        _buildMobileList(items),

        const SizedBox(height: 12),

        // Total row
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            border: Border.all(color: const Color(0xFFE8E8E8)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₨ ${total.toStringAsFixed(2)}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 14),
              ),
              const Text(
                'الإجمالي',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ],
          ),
        ),
      ],
    );
  }




  Widget _buildMobileList(List<QuoteItem> items) {
    return Column(
      children: items.map((item) {
        return _QuoteItemRow(
          key: ValueKey(item.id),
          item: item,
        );
      }).toList(),
    );
  }

  Widget _buildSummaryCard(
    BuildContext context, {
    required double subtotal,
    required double commission,
    required double fees,
    required double vat,
    required double grandTotal,
  }) {
    return _buildCard(
        context,
        children: [
      _summaryRow(context, 'الإجمالي الفرعي', '₨ ${subtotal.toStringAsFixed(2)}'),
      _summaryRow(context, 'العمولة', '₨ ${commission.toStringAsFixed(2)}'),
      _summaryRow(context, 'الرسوم', '₨ ${fees.toStringAsFixed(2)}'),
      _summaryRow(context, 'القيمة المضافة', '₨ ${vat.toStringAsFixed(2)}'),
      _summaryRow(context, 'التاريخ', '02-09-2026'),
      const Divider(height: 24),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'إجمالي السعر',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            '₨ ${grandTotal.toStringAsFixed(2)}',
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B4F72)),
          ),

        ],
      ),
    ]);
  }

  Widget _summaryRow(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(fontSize: 14, color: Colors.black54)),
          Text(value,
              style: const TextStyle(fontSize: 14, color: Colors.black87)),

        ],
      ),
    );
  }

  Widget _buildPrintButton(BuildContext context, QuotesListModel model) {
    return MainAppBtn(

      haveGradient: false,
      onTap: () => _printQuotesPdf(context, model),
      title: 'طباعة',child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.print_outlined,color: AppColors.white,),
        SizedBox(width: 10,),
        Text('طباعة',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.white),),


      ],
    ),);
  }

  Widget _buildCard(BuildContext context, {required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: children,
      ),
    );
  }
}

// ── Item Row (stateful for quantity stepper) ───────────────────────────────────

class _QuoteItemRow extends StatefulWidget {
  final QuoteItem item;

  const _QuoteItemRow({super.key, required this.item});

  @override
  State<_QuoteItemRow> createState() => _QuoteItemRowState();
}

class _QuoteItemRowState extends State<_QuoteItemRow> {
  late int _quantity;

  @override
  void initState() {
    super.initState();
    _quantity = widget.item.quantity;
  }

  void _increment() {
    setState(() {
      _quantity++;
      widget.item.quantity = _quantity;
    });
  }

  void _decrement() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
        widget.item.quantity = _quantity;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE8E8E8)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1B4F72),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    alignment: Alignment.center,
                    child: Text('${item.id}',
                        style: const TextStyle(
                            color: Colors.white, fontSize: 10)),
                  ),
                  const SizedBox(width: 6),

                  Text(item.name,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 13)),

                ],
              ),
              IconButton(
                icon: const Icon(Icons.delete_outline,
                    color: Colors.grey, size: 20),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),

            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('₨ ${(item.total).toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B4F72))),
              Row(
                children: [
                  _StepperButton(
                      icon: Icons.add,
                      onTap: _increment),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text('$_quantity',
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                  ),
                  _StepperButton(
                      icon: Icons.remove,
                      onTap: _decrement),
                ],
              ),
              Text('₨ ${item.price.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.grey, fontSize: 13)),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Stepper Button ────────────────────────────────────────────────────────────

class _StepperButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _StepperButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFDDDDDD)),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Icon(icon, size: 14, color: Colors.black87),
      ),
    );
  }
}



