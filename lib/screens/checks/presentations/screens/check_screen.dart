import 'package:flutter/material.dart';
import 'package:scraapy_pro/screens/checks/presentations/widgets/checkItem.dart';

class CheckScreen extends StatelessWidget {
  const CheckScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CheckItem(),
    );
  }
}
