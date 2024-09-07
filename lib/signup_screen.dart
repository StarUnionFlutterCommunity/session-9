import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/auth_controller.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var key = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  
  var authController = Get.put(AuthController());

  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               TextFormField(
                controller: emailController,
                
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (!GetUtils.isEmail(value ?? '')) {
                    return "Email is not valid";
                  } else {
                    return null;
                  }
                },
              
              ),
              const SizedBox(height: 16),
               TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),

                ),
                validator: (value) {
                  if (!GetUtils.isLengthGreaterThan(value, 6)) {
                    return "Password must be at least 7 characters long";
                  } else {
                    return null;
                  }
                },
              
              ),
              const SizedBox(height: 16),
               TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (!GetUtils.isLengthGreaterThan(value, 6) && value == passwordController.text) {
                    return "Password must be at least 7 characters long";
                  } else {
                    return null;
                  }
                },
              
             
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (key.currentState!.validate()) {
                      authController.signup(emailController.text.trim(), passwordController.text);
                  
                  }
                
                },
                child: const Text('Sign Up'),
              ),
              TextButton(
                onPressed: () {
                  // Navigate back to login screen
                  Get.back();
                },
                child: const Text('Already have an account? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}