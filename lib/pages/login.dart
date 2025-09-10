import 'dart:developer';
import 'package:flutter/material.dart';
import '../model/models.dart';
import 'package:flutter_ui_1/pages/register.dart';
import 'package:flutter_ui_1/pages/showtrip.dart';
import 'package:flutter_ui_1/ui_1/login_ui.dart';
import '../config/api_service.dart';
import '../config/user_session.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String text = '';
  bool isLoading = false;

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LoginUI(
      phoneController: phoneController,
      passwordController: passwordController,
      onLogin: login,
      onRegister: register,
      errorMessage: text,
      isLoading: isLoading,
    );
  }

  void register() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const RegisterPage()),
    );
  }

  Future<void> login() async {
    // Validate input fields
    if (phoneController.text.isEmpty || passwordController.text.isEmpty) {
      setState(() {
        text = 'กรุณากรอกเบอร์โทรศัพท์และรหัสผ่าน';
      });
      return;
    }

    setState(() {
      text = '';
      isLoading = true;
    });

    try {
      // เรียก API เพื่อ login
      final result = await ApiService.loginCustomer(
        phone: phoneController.text.trim(),
        password: passwordController.text.trim(),
      );

      log('Login Response: $result');

      // แปลง response เป็น model
      CustomerLoginResponse loginResponse =
          CustomerLoginResponse.fromJson(result);

      if (mounted) {
        // เก็บข้อมูล user session
        UserSession.instance.login(loginResponse.customer);

        // แสดงข้อความสำเร็จ
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'เข้าสู่ระบบสำเร็จ! ยินดีต้อนรับ ${loginResponse.customer.fullname}',
            ),
            backgroundColor: Colors.green,
          ),
        );

        log('Login successful: ${loginResponse.customer.fullname}');
        log('Customer ID: ${loginResponse.customer.idx}');
        log('Email: ${loginResponse.customer.email}');

        // นำไปหน้า showtrip หรือหน้าหลัก
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ShowTripPage()),
        );
      }
    } catch (e) {
      log('Login Error: $e');

      if (mounted) {
        setState(() {
          text = 'เข้าสู่ระบบไม่สำเร็จ: เบอร์โทรศัพท์หรือรหัสผ่านไม่ถูกต้อง';
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('เข้าสู่ระบบไม่สำเร็จ: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }
}
