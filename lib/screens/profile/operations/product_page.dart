import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scraapy_pro/const/app_colors.dart';
import 'package:scraapy_pro/const/app_images.dart';
import 'package:scraapy_pro/const/main_app_btn.dart';
import 'package:scraapy_pro/core/main_app_bar/main_app_bar.dart';


class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String? selectedQuantity;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
       
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(title: 'صفحة المنتج'),
              _buildProductCard(),
              const SizedBox(height: 10),
              _buildDetailsCard(),
              const SizedBox(height: 10),
              _buildQuantityCard(),
              const SizedBox(height: 10),
              _buildPaymentCard(),
              const SizedBox(height: 80),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomButtons(),
      ),
    );
  }

  Widget _buildProductCard() {
    return _card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              // Product Image Placeholder
              Container(
                width: 55,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: AppColors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: 
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),

                  child: Image.network(
                      fit: BoxFit.cover,
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIQnMHxY_0y_eunSe_HKhYM40gaUrzJLqY8GC2sr0mCj3A98sooLVL7tI&s'),
                )
                // const Icon(Icons.inventory_2_outlined, color: Colors.grey, size: 36),
              ),
              const SizedBox(width: 12),
              // Product Info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'منتج مستعمل',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 4),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(color: Colors.black87, fontSize: 13),
                      children: [
                        TextSpan(text: 'سعر الوحدة'+ ' '+':'+" "),

                        TextSpan(
                          text: 'SAR 2000',
                          style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF1A5276)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            height: 30,
            child: MainAppBtn(
              padding: EdgeInsets.all(4),
              btnColor: Color(0x33189491),
              border: Border.all(color: Color(0x80189491)),
              haveGradient: false,
              title: 'جاهز للشحن الفوري',titleStyle: TextStyle(fontSize: 10,color:Color(
                0xFF189491) ),),
          )

        ],
      ),
    );
  }

  Widget _buildDetailsCard() {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _sectionTitle('تفاصيل المنتج'),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _detailItem(AppImages.quantity, 'الكمية المتوفرة', '24')),
              const SizedBox(width: 12),
              Expanded(child: _detailItem(AppImages.pin, 'السعودية', 'الرياض')),
            ],
          ),
          const SizedBox(height: 12),
          _detailItem(AppImages.ship, 'الشحن والخدمات اللوجستية', 'توصيل خلال 2-3 أيام عمل'),
        ],
      ),
    );
  }

  Widget _detailItem(String icon, String title, String subtitle) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 33,width: 33,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0x14244075),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(icon,fit: BoxFit.fill,width: 16,height: 16,)
        ),
        const SizedBox(width: 8),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
            const SizedBox(height: 2),
            Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ],
        ),

      ],
    );
  }

  Widget _buildQuantityCard() {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('عدد الوحدات'),
          const SizedBox(height: 12),
          DropdownButtonFormField<String>(
            value: selectedQuantity,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              hintText: 'اختر عدد الوحدات',
              hintStyle: const TextStyle(color: Colors.grey),
            ),
            items: List.generate(10, (i) => '${i + 1}')
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (v) => setState(() => selectedQuantity = v),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                'بمكنك كتابة العدد او اختياره يدويا',
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),
              SizedBox(width: 4),
              Icon(Icons.info_outline, size: 14, color: Colors.grey),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentCard() {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle('طريقة الدفع'),
          const SizedBox(height: 16),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _paymentChip('Apple Pay', Colors.black, Colors.white),
              const SizedBox(width: 8),
              _paymentChip('Mastercard', const Color(0xFFEB001B), Colors.white),
              const SizedBox(width: 8),
              _paymentChip('VISA', const Color(0xFF1A1F71), Colors.white),
              const SizedBox(width: 8),
              _paymentChip('mada', const Color(0xFF007A4D), Colors.white),
            ],
          ),
        ],
      ),
    );
  }

  Widget _paymentChip(String label, Color bg, Color fg) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(color: fg, fontSize: 11, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildBottomButtons() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          MainAppBtn(title: 'أضف إلى السلة'),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    // backgroundColor: const Color(0xFF1B4F72),
                    backgroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text(
                    'أضف الى المفضلة',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
              const SizedBox(width: 8),

              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    side: const BorderSide(color: Color(0xFF1B4F72)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text(
                    'طلب عرض سعر',
                    style: TextStyle(color: Color(0xFF1B4F72), fontSize: 14),
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CircleAvatar(radius: 4, backgroundColor: AppColors.terquaz),

        const SizedBox(width: 6),

        Text(title, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600,color: AppColors.primary)),
      ],
    );
  }

  Widget _card({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
          border: Border.all(color: Color(0x33000000)),
          borderRadius: BorderRadius.circular(12),

        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6, offset: const Offset(0, 2))],
      ),
      child: child,
    );
  }
}