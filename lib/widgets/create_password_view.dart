import 'package:flutter/material.dart';

import '../extensions/extension.dart';

class CreatePasswordView extends StatefulWidget {
  final Function handleSubmit;

  CreatePasswordView(
    this.handleSubmit,
  );

  @override
  _CreatePasswordViewState createState() => _CreatePasswordViewState();
}

class _CreatePasswordViewState extends State<CreatePasswordView> {
  static final _formKey = GlobalKey<FormState>();

  String _passwordInput = '';

  bool _isObscure = true;
  bool _hasLowercase = false;
  bool _hasUppercase = false;
  bool _hasDigits = false;
  bool _hasMinLength = false;

  List<Map<String, Object>> get _complexityItems {
    return [
      {
        'title': 'a',
        'subTitle': 'Lowercase',
        'isPassed': _hasLowercase,
      },
      {
        'title': 'A',
        'subTitle': 'Uppercase',
        'isPassed': _hasUppercase,
      },
      {
        'title': '123',
        'subTitle': 'Number',
        'isPassed': _hasDigits,
      },
      {
        'title': '9+',
        'subTitle': 'Characters',
        'isPassed': _hasMinLength,
      },
    ];
  }

  String get complexityText {
    int complexityCounter = _complexityItems.fold(0, (previousValue, element) {
      if (element['isPassed']) {
        return previousValue + 1;
      }
      return previousValue;
    });

    switch (complexityCounter) {
      case 1:
        return 'Very Weak';
      case 2:
        return 'Weak';
      case 3:
        return 'Strong';
      case 4:
        return 'Very Strong';
      default:
        return '';
    }
  }

  void _passwordChecker(String password) {
    this.setState(() {
      _hasUppercase = password.contains(new RegExp(r'[A-Z]'));
      _hasDigits = password.contains(new RegExp(r'[0-9]'));
      _hasLowercase = password.contains(new RegExp(r'[a-z]'));
      _hasMinLength = password.length > 8;
      _passwordInput = password;
    });
  }

  Widget _passwordTextField() {
    return TextFormField(
      obscureText: _isObscure,
      decoration: InputDecoration(
        hintText: 'Create Password',
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[400]),
        ),
        suffixIcon: GestureDetector(
          onTap: () => setState(() {
            _isObscure = !_isObscure;
          }),
          child: Icon(
            _isObscure ? Icons.visibility : Icons.visibility_off,
            color: Colors.blue,
          ),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (v) {
        if (!v.isValidPassword) return 'Password must include the complexity.';
        return null;
      },
      onChanged: _passwordChecker,
    );
  }

  Widget _submitButton() {
    return Container(
      width: double.infinity,
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
              Colors.blue[100].withOpacity(0.6),
            ),
          ),
          onPressed: () {
            if (_formKey.currentState.validate()) {
              widget.handleSubmit();
            }
          },
          child: Text('Next'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(complexityText);
    return Container(
      width: double.infinity,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Create Password',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Password will be used to login to account',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 20,
            ),
            _passwordTextField(),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyText1,
                children: <TextSpan>[
                  const TextSpan(text: 'Complexity '),
                  TextSpan(
                    text: complexityText,
                    style: TextStyle(color: Colors.yellow),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: _complexityItems
                  .map(
                    (item) => Expanded(
                      child: Column(
                        children: [
                          item['isPassed']
                              ? Container(
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Colors.green[300],
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                )
                              : Text(
                                  item['title'],
                                  style: Theme.of(context).textTheme.headline2,
                                ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            item['subTitle'],
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
            Spacer(),
            _submitButton(),
          ],
        ),
      ),
    );
  }
}
