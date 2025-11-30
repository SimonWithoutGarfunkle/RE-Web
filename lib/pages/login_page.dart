import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Se connecter', style: textTheme.headlineLarge),
              const SizedBox(height: 12),
              Text('Gère ton compte RE.', style: textTheme.bodyLarge),
              const SizedBox(height: 24),
              const _LoginForm(),
              const SizedBox(height: 16),
              Row(
                children: [
                  Text('Nouveau?', style: textTheme.bodyMedium),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/subscribe'),
                    child: const Text('Crée ton compte'),
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

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
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
            decoration: const InputDecoration(labelText: 'Mot de passe'),
            obscureText: true,
            validator: (v) => (v == null || v.length < 8) ? 'Minimum 8 caractères' : null,
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Not connected (UI only)')),
                  );
                }
              },
              child: const Text('Se connecter'),
            ),
          ),
        ],
      ),
    );
  }
}
