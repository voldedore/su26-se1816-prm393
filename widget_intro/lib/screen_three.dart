import 'package:flutter/material.dart';

class ScreenThree extends StatefulWidget {
  const ScreenThree({super.key});

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_formkey.currentState!.validate()) {
      print('Login.......');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _userController,
                      decoration: InputDecoration(label: Text('UserName')),
                      validator: (value) {
                        if (value!.length < 3) {
                          return 'username phai co it nhat 3 ky tu ';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(label: Text('Password')),
                      controller: _passwordController,
                    ),
                    FilledButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // Xu ly dang nhap
                          if (_userController.text == 'admin' &&
                              _passwordController.text == '123') {
                            print("Dang nhap thanh cong");
                            // Day ve screen widget LoginSuccessScreen()
                            Navigator.pushNamed(context, '/login_success');
                            Navigator.push
                          } else {
                            print("That bai");
                            // SnackBar
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Username or password incorrect!',
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        }
                      },
                      child: Text('Login'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
