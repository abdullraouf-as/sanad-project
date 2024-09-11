import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanad/cubit/auth_cubit.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: BlocListener<AuthCubit, bool>(
        listener: (context, state) {
          if (state) {
            Navigator.pushReplacementNamed(context, '/home');
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text('Sign In Failed')));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(labelText: 'Username')),
              TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthCubit>().signIn(
                      _usernameController.text, _passwordController.text);
                },
                child: Text('Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
