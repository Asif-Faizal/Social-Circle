import 'package:flutter/material.dart';

class InitialScreen extends StatelessWidget {
  const InitialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final emailController = TextEditingController();
    // Create a form key to manage the form state
    final formKey = GlobalKey<FormState>();
    
    // Email validation function
    String? validateEmail(String? value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your email';
      }
      
      final emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
      if (!emailRegExp.hasMatch(value)) {
        return 'Please enter a valid email';
      }
      
      return null; // Return null if validation passes
    }

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome to Social Circle', style: textTheme.displayLarge),
              Text('Enter your email to continue', style: textTheme.bodyLarge),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'example@socialcircle.com',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: validateEmail,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        extendedIconLabelSpacing: 10,
        onPressed: () {
          if (formKey.currentState!.validate()) {
            final email = emailController.text.trim();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Valid email: $email')),
            );
          }
        },
        label: Row(
          children: [
            const Text('Continue'),
            const SizedBox(width: 10),
            const Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
