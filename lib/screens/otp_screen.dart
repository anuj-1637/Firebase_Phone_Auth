import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_phn_auth/screens/wrapper.dart';
import 'package:firebase_phn_auth/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPScreen extends StatefulWidget {
  String vid;
  OTPScreen({required this.vid});
  @override
  State<StatefulWidget> createState() => otpState();
}

class otpState extends State<OTPScreen> {
  TextEditingController controller = TextEditingController();
  String label = "OTP";
  String hint = "Enter OTP";

  signUp() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.vid,
      smsCode: controller.text,
    );
    try {
      await FirebaseAuth.instance.signInWithCredential(credential).then((
        value,
      ) {
        Get.offAll(Wrapper());
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message.toString());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OTP Screen"), centerTitle: true),
      body: Column(
        children: [
          Text(" Welcome to OTP Screen"),
          SizedBox(height: 20),
          Text_Field_Widget(controller: controller, label: label, hint: hint),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget verifyButton() {
    return ElevatedButton(
      onPressed: () {
        signUp();
      },
      child: Text("Verify Otp"),
    );
  }
}
