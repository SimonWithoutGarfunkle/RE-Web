import 'package:flutter/material.dart';

class SubscribePage extends StatelessWidget {
  const SubscribePage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 540),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Create Account', style: textTheme.headlineLarge),
              const SizedBox(height: 12),
              Text('Subscribe to manage your RE account. UI only.', style: textTheme.bodyLarge),
              const SizedBox(height: 24),
              const _SubscribeForm(),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text('Already have an account?', style: textTheme.bodyMedium),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/login'),
                    child: const Text('Login'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SubscribeForm extends StatefulWidget {
  const _SubscribeForm();

  @override
  State<_SubscribeForm> createState() => _SubscribeFormState();
}

class _SubscribeFormState extends State<_SubscribeForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Email'),
            validator: (v) => (v == null || !v.contains('@')) ? 'Invalid email' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
            validator: (v) => (v == null || v.length < 6) ? 'Min 6 chars' : null,
          ),
          const SizedBox(height: 12),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Confirm password'),
            obscureText: true,
            validator: (v) => (v == null || v.length < 6) ? 'Min 6 chars' : null,
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Account not created (UI only)')),
                  );
                }
              },
              child: const Text('Create account'),
            ),
          ),
        ],
      ),
    );
  }
}
