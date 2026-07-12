import 'package:flutter/material.dart';
import '../../widgets/responsive_layout.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('المفضلة'),
        centerTitle: true,
      ),
      body: ResponsiveLayout(
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: 3,
          itemBuilder: (context, index) {
            return _buildFavoriteCard(context);
          },
        ),
      ),
    );
  }

  Widget _buildFavoriteCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: const BorderSide(color: Colors.black12),
      ),
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Container(
                height: 180,
                decoration: const BoxDecoration(
                  color: Color(0xFFF4F4F4),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                ),
                child: Center(
                  child: Icon(Icons.image_outlined, size: 80, color: Colors.grey[300]),
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: const Icon(Icons.favorite, color: Colors.red, size: 20),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'فك نقل وعفش',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, fontFamily: 'Cairo'),
                    ),
                    Text(
                      '1500 ﷼',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF234777)),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.inventory_2_outlined, size: 16, color: Colors.grey),
                        SizedBox(width: 8),
                        Text('28 الكمية المتوفرة', style: TextStyle(color: Colors.grey, fontSize: 14)),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),
                        SizedBox(width: 4),
                        Text('الرياض', style: TextStyle(color: Colors.grey, fontSize: 14)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF234777),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text('عرض', style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
