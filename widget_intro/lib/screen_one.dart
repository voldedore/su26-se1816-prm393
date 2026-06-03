import 'package:flutter/material.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  // State de luu data cua cac input
  String _txtVal1 = '';
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool _checkBox1Val = true;
  int _radioVal = 0;
  bool _switchVal = false;
  double _sliderVal = 50;

  @override
  void dispose() {
    phoneNumberController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                'Input widgets (Nhập liệu)',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text(
                'TextField',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email', // Label cho input
                  hintText: 'Enter your email...',
                ),
                onChanged: (value) => setState(() => _txtVal1 = value),
              ), // email
              Text('Du lieu da nhap: $_txtVal1'),
              TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  label: Text('Phone number'),
                  hintText: 'Enter your phone number...',
                ),
                controller: phoneNumberController,
                onChanged: (v) => setState(() {}),
              ), // sdt
              Text('Typed number: ${phoneNumberController.text}'),

              Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (v) {},
                      decoration: InputDecoration(label: Text('Username')),
                      controller: userNameController,
                      validator: (inputValue) {
                        print('Gia tri cua v: $inputValue');
                        if (inputValue == null || inputValue.isEmpty) {
                          return 'Vui long nhap username';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      onChanged: (v) {},
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password', // Label cho input
                        hintText: 'Enter your password...',
                      ),
                      validator: (inputValue) {
                        if (inputValue == null || inputValue.isEmpty) {
                          return 'Vui long nhap pwd';
                        }
                        return null;
                      },
                    ), // password
                    FilledButton(
                      onPressed: () {
                        print('button pressed');
                        // validation
                        if (formKey.currentState!.validate()) {
                          print('The form is valid');
                        } else {
                          print('Invalid');
                        }
                      },
                      child: Text('Submit'),
                    ),
                  ],
                ),
              ),
              // TextEditingController
              Divider(),
              /* ------------ CHECKBOX ------------ */
              Text(
                'Checkbox',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              // 1st approach
              CheckboxListTile(
                title: Text('CheckboxListTile'),
                value: _checkBox1Val,
                onChanged: (v) {
                  setState(() {
                    _checkBox1Val = v!;
                  });
                },
              ),
              // 2nd approach
              ListTile(
                title: Text('Checkbox inside ListTile'),
                leading: Checkbox(value: false, onChanged: (v) {}),
              ),
              // 3rd approach
              Row(
                children: [
                  Text('Checkbox in Rows'),
                  Checkbox(value: false, onChanged: (v) {}),
                  Checkbox(value: true, onChanged: (v) {}),
                  Checkbox(value: null, onChanged: (v) {}, tristate: true),
                ],
              ),
              Text('Checkbox value: $_checkBox1Val'),
              Divider(),
              /** ----------- RADIO --------------- */
              Text('Radio', style: Theme.of(context).textTheme.headlineSmall),
              RadioGroup<int>(
                onChanged: (v) {
                  setState(() {
                    _radioVal = v!;
                  });
                },
                groupValue: _radioVal,
                child: Column(
                  children: [
                    RadioListTile(value: false, title: Text('Xang 95')),
                    RadioListTile(value: 5, title: Text('Option E5')),
                    RadioListTile(value: 10, title: Text('Option E10')),
                  ],
                ),
              ),
              Text('Radio value: $_radioVal'),
              Divider(),
              /* ------------- SWITCH --------------- */
              Text('Switch', style: Theme.of(context).textTheme.headlineSmall),
              Switch(
                value: _switchVal,
                onChanged: (v) {
                  setState(() {
                    _switchVal = v;
                  });
                },
              ),
              SwitchListTile(
                value: false,
                onChanged: (v) {},
                title: Text('SwitchListTile'),
              ),
              Text('Switch value: $_switchVal'),
              Divider(),
              /* ------------- SLIDER ---------------- */
              Text('Slider', style: Theme.of(context).textTheme.headlineSmall),
              Slider(
                value: _sliderVal,
                min: 0,
                max: 50,
                divisions: 10,
                onChanged: (v) {
                  setState(() {
                    _sliderVal = v;
                  });
                },
              ),
              Text('Slider value: $_sliderVal'),
              Divider(),
            ],
          ),
        ),
      ), // -> Column(children: [Text('Screen one')]) Alt + Enter -> Wrap
    );
  }
}
