import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_phn_auth/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'otp_screen.dart';

class PhoneAuth extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => phoneAuthState();
}

class phoneAuthState extends State<PhoneAuth> {
  TextEditingController phoneController = TextEditingController();

  SendOtp() async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91${phoneController.text}",
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          Get.snackbar("Error", e.message.toString());
        },
        codeSent: (String vid, int? token) {
          Get.to(OTPScreen(vid: vid));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message.toString());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Phone Auth"), centerTitle: true),
      body: Column(
        children: [
          Text("Welcome to Phone Auth"),
          SizedBox(height: 20),
          Text_Field_Widget(
            controller: phoneController,
            label: "Phone Number",
            hint: "Enter Phone Number",
          ),
          SizedBox(height: 10),
          login_button(),
        ],
      ),
    );
  }

  Widget login_button() {
    return ElevatedButton(
      onPressed: () {
        SendOtp();
      },
      child: Text("Generate Otp"),
    );
  }
}
