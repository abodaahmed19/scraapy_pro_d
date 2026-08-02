import 'package:flutter/material.dart';
import 'package:scraapy_pro/authentication/presentation/screens/login_screen.dart';
import 'package:scraapy_pro/core/di/injection.dart';
import 'package:scraapy_pro/core/helpers/cache_service.dart';
import 'package:scraapy_pro/core/storage/session_storage_keys.dart';


class DeleteAccountDialog {

  Widget logout(BuildContext context) {

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      elevation: 0,
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top Drag Handle Indicator
            Container(
              width: 100,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 34),

            // Question Text
            const Text(
              'هل انت متاكد من حذف الحساب؟',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),

            // Action Buttons Row
            Row(
              children: [
                // Cancel Button (إلغاء)
                Expanded(
                  child: SizedBox(
                    height: 42,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFFD1D5DB), width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text(
                        'إلغاء',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Confirm Delete Button (تأكيد الحذف)
                Expanded(
                  child: SizedBox(
                    height: 42,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFF2424), // Bright red
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        final storage = getIt<SecureStorage>();
                        storage.delete(SessionStorageKeys.token).then((val){
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => ScrappyLoginScreen()),
                                (route) => false,
                          );
                        });
                      },
                      child: const Text(
                        'تأكيد الحذف',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}