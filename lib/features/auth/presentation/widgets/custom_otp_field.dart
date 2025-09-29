import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OtpTextField extends StatefulWidget {
  const OtpTextField({
    super.key,
    required this.pinController,
    required this.isError,
  });
  final TextEditingController pinController;
  final bool isError;
  @override
  State<OtpTextField> createState() => _OtpTextFieldState();
}

class _OtpTextFieldState extends State<OtpTextField> {
  final formKey = GlobalKey<FormState>();

  final focusedBorderColor = Colors.black;

  final fillColor = const Color.fromRGBO(243, 246, 249, 0);
  final borderColor = Colors.grey[800]!;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultPinTheme = PinTheme(
      margin: EdgeInsets.all(4),
      width: 80,
      height: 80,
      textStyle: TextStyle(
        fontSize: 22,
        color: theme.textTheme.bodyLarge?.color ?? Colors.black,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xffCBCBCB)),
      ),
    );

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              forceErrorState: widget.isError,

              length: 4,
              controller: widget.pinController,
              defaultPinTheme: defaultPinTheme,
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              onCompleted: (pin) {
                debugPrint('onCompleted: $pin');
                if (pin == '1234') {
                  formKey.currentState!.validate();
                  print('object');
                }
              },
              onChanged: (value) {
                debugPrint('onChanged: $value');
              },
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 9),
                    width: 2,
                    height: 35,
                    color: Color.fromRGBO(16, 185, 129, .7),
                  ),
                ],
              ),
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Color(0xffD1FAE5)),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  color: theme.colorScheme.surface,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Color(0xffD1FAE5)),
                ),
              ),
              errorPinTheme: defaultPinTheme.copyBorderWith(
                border: Border.all(color: theme.colorScheme.error),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    widget.pinController.dispose();
    super.dispose();
  }
}
