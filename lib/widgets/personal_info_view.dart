import 'package:flutter/material.dart';

import './dropdown.dart';

class PersonalInfoView extends StatelessWidget {
  final Function handleSubmit;

  PersonalInfoView(
    this.handleSubmit,
  );

  final deviceTypes = ["Mac", "Windows", "Mobile"];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Personal Information',
            style: Theme.of(context).textTheme.headline2,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Please fill in the information below and your goal for digital saving',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(
            height: 50,
          ),
          Dropdown(
            placeholder: 'Goal for activation',
            value: null,
            options: deviceTypes,
          ),
          const SizedBox(
            height: 20,
          ),
          Dropdown(
            placeholder: 'Monthly Income',
            value: null,
            options: deviceTypes,
          ),
          const SizedBox(
            height: 20,
          ),
          Dropdown(
            placeholder: 'Monthly expense',
            value: null,
            options: deviceTypes,
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
