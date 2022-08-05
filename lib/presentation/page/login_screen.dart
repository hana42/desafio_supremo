import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../injection.dart';
import '../blocs/login/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginBloc _bloc = sl<LoginBloc>();

  late String email;
  late String password;

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login page'),
      ),
      body: body(),
    );
  }

  Widget body() {
    return   BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [form()],
            ),
          );
        },
      );
  }

  Widget form() {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
            labelText: 'Email',
            suffixIcon: const Icon(Icons.email),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          onChanged: handleEmailChange,
        ),
        const SizedBox(height: 10.0),
        TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: const Icon(Icons.donut_small),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          onChanged: handlePasswordChange,
        ),
        ElevatedButton(child: const Text('Login'), onPressed: doLogin)
      ],
    );
  }

  void doLogin() {
    _bloc.add(DoLogin(email: email, password: password));
  }

  void handleEmailChange(String value) => setState(() => email = value);

  void handlePasswordChange(String value) => setState(() => password = value);
}