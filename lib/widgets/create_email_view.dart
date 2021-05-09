import 'package:flutter/material.dart';

import '../extensions/extension.dart';

class CreateEmailView extends StatefulWidget {
  static final _formKey = GlobalKey<FormState>();
  final Function saveData;
  final String userEmail;

  CreateEmailView({
    this.saveData,
    this.userEmail,
  });

  @override
  _CreateEmailViewState createState() => _CreateEmailViewState();
}

class _CreateEmailViewState extends State<CreateEmailView> {
  String _emailInput = '';

  @override
  void initState() {
    if (widget.userEmail.isNotEmpty) {
      setState(() {
        _emailInput = widget.userEmail;
      });
    }
    super.initState();
  }

  Widget _emailTextField() {
    return TextFormField(
      initialValue: _emailInput,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Email',
        filled: true,
        fillColor: Colors.grey[200],
        prefixIcon: const Icon(Icons.email),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey[400]),
        ),
      ),
      onChanged: (String value) => setState(() {
        _emailInput = value;
      }),
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
            if (CreateEmailView._formKey.currentState.validate()) {
              widget.saveData(_emailInput);
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
        key: CreateEmailView._formKey,
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
