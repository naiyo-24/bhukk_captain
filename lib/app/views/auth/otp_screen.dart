import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../controllers/auth_controller.dart';
import '../../widgets/app_bar.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find<AuthController>();
    final TextEditingController otpController = TextEditingController();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Verify OTP',
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Icon and Title
                      const Icon(
                        Icons.verified_user,
                        size: 80,
                        color: Colors.orange,
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'Verify Your Phone',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Obx(() => Text(
                            'Enter the 6-digit code sent to ${controller.phoneNumber.value}',
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          )),
                      const SizedBox(height: 32),

                      // OTP Input Field
                      PinCodeTextField(
                        appContext: context,
                        length: 6,
                        controller: otpController,
                        onChanged: (value) {
                          // Handle OTP input changes
                        },
                        onCompleted: (value) async {
                          // Auto-verify when 6 digits are entered
                          final success = await controller.verifyOtp(value);
                          if (success) {
                            Get.offAllNamed('/home');
                          }
                        },
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(12),
                          fieldHeight: 60,
                          fieldWidth: 45,
                          activeFillColor: Colors.white,
                          activeColor: Colors.orange,
                          selectedColor: Colors.orange,
                          inactiveColor: Colors.grey.shade300,
                        ),
                        keyboardType: TextInputType.number,
                        enableActiveFill: false,
                        animationType: AnimationType.fade,
                      ),
                      const SizedBox(height: 24),

                      // Error Message
                      Obx(() => controller.errorMessage.value.isNotEmpty
                          ? Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.red.shade50,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Colors.red.shade200),
                              ),
                              child: Text(
                                controller.errorMessage.value,
                                style: TextStyle(color: Colors.red.shade700),
                                textAlign: TextAlign.center,
                              ),
                            )
                          : const SizedBox.shrink()),
                      const SizedBox(height: 24),

                      // Verify Button
                      Obx(() => ElevatedButton(
                            onPressed: controller.isLoading.value
                                ? null
                                : () async {
                                    if (otpController.text.length != 6) {
                                      controller.errorMessage.value = 'Please enter a 6-digit OTP';
                                      return;
                                    }
                                    
                                    final success = await controller.verifyOtp(otpController.text);
                                    if (success) {
                                      Get.offAllNamed('/home');
                                    }
                                  },
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: controller.isLoading.value
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                    ),
                                  )
                                : const Text(
                                    'Verify OTP',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          )),
                      const SizedBox(height: 24),

                      // Resend OTP
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Didn't receive the code? ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextButton(
                            onPressed: controller.isLoading.value
                                ? null
                                : () async {
                                    controller.clearError();
                                    final success = await controller.sendOtp(controller.phoneNumber.value);
                                    if (success) {
                                      Get.snackbar(
                                        'OTP Sent',
                                        'A new OTP has been sent to your phone number',
                                        backgroundColor: Colors.green.shade50,
                                        colorText: Colors.green.shade700,
                                        snackPosition: SnackPosition.TOP,
                                      );
                                    }
                                  },
                            child: const Text(
                              'Resend',
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),

                      // Demo OTP Hint
                      Container(
                        margin: const EdgeInsets.only(top: 32),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.orange.shade50,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.orange.shade200),
                        ),
                        child: const Column(
                          children: [
                            Text(
                              'Demo Mode',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.orange,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Use OTP: 123456 for testing',
                              style: TextStyle(
                                color: Colors.orange,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}