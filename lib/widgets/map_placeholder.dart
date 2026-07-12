import 'package:flutter/material.dart';

class MapPlaceholder extends StatelessWidget {
  const MapPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(8),
        image: const DecorationImage(
          image: NetworkImage(
            'https://maps.googleapis.com/maps/api/staticmap?center=24.7136,46.6753&zoom=12&size=600x300&maptype=roadmap&key=YOUR_API_KEY',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // If network image fails or we don't have API key, show a fallback
          Center(
            child: Icon(Icons.map, size: 50, color: Colors.black26),
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.my_location, size: 16),
              label: const Text('تحديد الموقع الحالي', style: TextStyle(fontFamily: 'Cairo')),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF234777),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
