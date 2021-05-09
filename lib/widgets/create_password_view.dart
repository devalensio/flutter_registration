import 'package:flutter/material.dart';

class PasswordScreen extends StatelessWidget {
  final Function handleSubmit;

  PasswordScreen(
    this.handleSubmit,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
          Container(
            child: TextField(
              keyboardType: TextInputType.visiblePassword,
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
                  onTap: () {
                    // _togglevisibility();
                  },
                  child: Icon(
                    true ? Icons.visibility : Icons.visibility_off,
                    color: Colors.blue,
                  ),
                ),
              ),
              onSubmitted: (_) {
                print('deva');
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Spacer(),
          Container(
            width: double.infinity,
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue[200]),
                ),
                onPressed: handleSubmit,
                child: Text('Next'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
