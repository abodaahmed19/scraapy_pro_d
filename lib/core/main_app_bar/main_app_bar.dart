import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBack;
  final bool? haveBack;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onBack, this.haveBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0,top: 50),
      child: Container(
        height: 60,
        // gray background
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Back Arrow (left)
            haveBack == true?
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: onBack ?? () => Navigator.pop(context),
                child: Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    color:Color(0xFFE5E5E5),// you can change color
                    borderRadius: BorderRadius.circular(8), // rounded edges
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 18,
                  ),
                ),
              ),
            ):Container(),

            // Title (center)
            Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}