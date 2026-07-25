import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scraapy_pro/const/app_colors.dart';

/// White-outlined text field — matches the original login/register input design.
class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.controller,
    required this.labelKey,
    this.hintKey,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.suffix,
    this.readOnly = false,
    this.onTap,
  });

  final TextEditingController controller;
  final String labelKey;
  final String? hintKey;
  final Widget? prefixIcon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final bool readOnly;
  final VoidCallback? onTap;

  static const _border = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: AppColors.white, width: 1.5),
  );
  static const _focusedBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10)),
    borderSide: BorderSide(color: AppColors.white, width: 2),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      cursorColor: AppColors.white,
      readOnly: readOnly,
      onTap: onTap,
      style: const TextStyle(color: AppColors.white),
      decoration: InputDecoration(
        labelText: labelKey,
        hintText: hintKey,
        hintStyle: const TextStyle(color: AppColors.white),
        labelStyle: const TextStyle(color: AppColors.white),
        prefixIcon: prefixIcon,
        suffix: suffix,
        border: _border,
        enabledBorder: _border,
        focusedBorder: _focusedBorder,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      validator: validator,
    );
  }
}

/// 6-box OTP input row — replaces pin_code_fields with a pure Flutter widget.
class OtpInputRow extends StatefulWidget {
  const OtpInputRow({super.key, required this.onCompleted});

  final ValueChanged<String> onCompleted;

  @override
  State<OtpInputRow> createState() => OtpInputRowState();
}

class OtpInputRowState extends State<OtpInputRow> {
  final _controllers = List.generate(6, (_) => TextEditingController());
  final _focusNodes = List.generate(6, (_) => FocusNode());

  String get code => _controllers.map((c) => c.text).join();

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    for (final f in _focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.length == 1 && index < 5) {
      _focusNodes[index + 1].requestFocus();
    }
    if (code.length == 6) widget.onCompleted(code);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth.isFinite
            ? constraints.maxWidth
            : MediaQuery.of(context).size.width;
        const spacing = 8.0;
        final availableWidth = maxWidth - spacing * 5;
        final boxSize = (availableWidth / 6).clamp(40.0, 60.0);

        return Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(6, (i) {
              return Padding(
                padding: EdgeInsets.only(left: i == 0 ? 0 : spacing),
                child: SizedBox(
                  width: boxSize,
                  height: boxSize * 1.2,
                  child: Focus(
                    onKeyEvent: (node, event) {
                      if (event is KeyDownEvent &&
                          event.logicalKey == LogicalKeyboardKey.backspace &&
                          _controllers[i].text.isEmpty &&
                          i > 0) {
                        _focusNodes[i - 1].requestFocus();
                        return KeyEventResult.handled;
                      }
                      return KeyEventResult.ignored;
                    },
                    child: TextFormField(
                  controller: _controllers[i],
                  focusNode: _focusNodes[i],
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  textAlign: TextAlign.center,
                  cursorColor: AppColors.white,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: const InputDecoration(
                    counterText: '',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: AppColors.white, width: 1.5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(color: AppColors.white, width: 2),
                    ),
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  onChanged: (v) => _onChanged(v, i),
                ),
              ),
            ),
          );
        }),
      ),
    );
  },
);
}
}
