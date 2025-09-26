import 'package:flutter/material.dart';
import '../consts/app_consts.dart';
import '../utiles/validations.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding * 2),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 60),
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.lightGrey,
                    child: Icon(
                      Icons.lock_open_rounded,
                      size: 50,
                      color: AppColors.primaryBlue,
                    ),
                  ),
                  const SizedBox(height: 30),

                  const Text(
                    'تسجيل الدخول',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: defaultTitleFontSize * 1.4,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'مرحباً بعودتك! سجل الدخول للمتابعة',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: defaultFontSize,
                      color: AppColors.grey,
                    ),
                  ),
                  const SizedBox(height: 40),

                  CustomTextField(
                    controller: _emailController,
                    hintText: 'البريد الإلكتروني',
                    validator: Validations.validateEmail,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    controller: _passwordController,
                    hintText: 'كلمة المرور',
                    obscureText: true,
                    validator: Validations.validatePassword,
                  ),
          
                  CustomButton(
                    text: 'دخول',
                    onPressed: _login,
                    padding: 20, 
                  ),
                  const SizedBox(height: 40),

                  _buildDivider(), 
                  const SizedBox(height: 20),
                  _buildSocialLoginSection(), 
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('أو', style: TextStyle(color: AppColors.grey)),
        ),
        Expanded(child: Divider()),
      ],
    );
  }

  Widget _buildSocialLoginSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _socialIcon(Icons.email_outlined, color: Colors.redAccent),
        const SizedBox(width: 20),
        _socialIcon(Icons.apple, color: Colors.black),
        const SizedBox(width: 20),
        _socialIcon(Icons.facebook, color: Colors.blue.shade800),
      ],
    );
  }

  Widget _socialIcon(IconData iconData, {required Color color}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300)
      ),
      child: Icon(
        iconData,
        size: 30,
        color: color,
      ),
    );
  }
}