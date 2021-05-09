import 'package:flutter/material.dart';

import '../extensions/extension.dart';

class CreateEmailView extends StatelessWidget {
  static final _formKey = GlobalKey<FormState>();
  final Function handleSubmit;

  CreateEmailView(
    this.handleSubmit,
  );

  Widget _emailTextField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',
        filled: true,
        fillColor: Colors.grey[200],
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[400]),
        ),
      ),
      validator: (v) {
        if (!v.isValidEmail) return 'Please enter a valid email';
        return null;
      },
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
              handleSubmit();
            }
          },
          child: Text('Next'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.headline1,
                children: <TextSpan>[
                  const TextSpan(text: 'Welcome to \n'),
                  const TextSpan(text: 'GIN '),
                  const TextSpan(
                      text: 'Finans', style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodyText1,
                children: <TextSpan>[
                  const TextSpan(text: 'Welcome to The Bank of The Future \n'),
                  const TextSpan(text: 'Manage and track your accounts on \n'),
                  const TextSpan(text: 'the go.'),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            _emailTextField(),
            Spacer(),
            _submitButton(),
          ],
        ),
      ),
    );
  }
}
