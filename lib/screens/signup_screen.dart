import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/rounded_text_field.dart';
import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _createAccount() {
    // Basic interaction: require a name before moving to the dashboard.
    final name = _nameController.text.trim();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) => HomeScreen(userName: name.isEmpty ? 'Lucy' : name),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('trusty.',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark)),
                  Image.asset(
                    'assets/images/signup_character.png',
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Text('Sign Up', style: AppTextStyles.heading),
              const SizedBox(height: 24),
              RoundedTextField(
                label: 'Your name',
                hint: 'e.g. Lucy',
                controller: _nameController,
              ),
              RoundedTextField(
                label: 'Email Address',
                hint: 'example@gmail.com',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              RoundedTextField(
                label: 'Password',
                hint: 'example_1',
                controller: _passwordController,
                obscure: true,
              ),
              const SizedBox(height: 8),
              GradientButton(
                text: 'Create account',
                onPressed: _createAccount,
              ),
              const SizedBox(height: 20),
              Row(
                children: const [
                  Expanded(child: Divider(color: AppColors.textGrey)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('Or sign up with',
                        style: AppTextStyles.subheading),
                  ),
                  Expanded(child: Divider(color: AppColors.textGrey)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _SocialButton(
                      icon: Icons.g_mobiledata_rounded,
                      label: 'Google',
                      onTap: _createAccount,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _SocialButton(
                      icon: Icons.facebook_rounded,
                      label: 'Facebook',
                      onTap: _createAccount,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _SocialButton(
      {required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: AppColors.textDark),
      label: Text(label, style: AppTextStyles.body),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 14),
        side: const BorderSide(color: AppColors.fieldFill, width: 2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
