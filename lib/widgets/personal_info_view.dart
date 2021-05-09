import 'package:flutter/material.dart';

import './dropdown.dart';

class PersonalInfoView extends StatefulWidget {
  final Function handleSubmit;

  PersonalInfoView(
    this.handleSubmit,
  );

  static final _formKey = GlobalKey<FormState>();

  @override
  _PersonalInfoViewState createState() => _PersonalInfoViewState();
}

class _PersonalInfoViewState extends State<PersonalInfoView> {
  final goalList = ["Buy a House", "Buy a Car", "Marriage"];

  final monthlyIncomeList = ['1.000.000', '5.000.000', '10.000.000'];

  final monthlyExpenseList = ['1.000.000', '2.000.000', '3.000.000'];

  String _goalInput;

  String _incomeInput;

  String _expenseInput;

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
            if (PersonalInfoView._formKey.currentState.validate()) {
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
    return Container(
      width: double.infinity,
      child: Form(
        key: PersonalInfoView._formKey,
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
              value: _goalInput,
              options: goalList,
              onChanged: (String value) => setState(() {
                _goalInput = value;
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            Dropdown(
              placeholder: 'Monthly Income',
              value: _incomeInput,
              options: monthlyIncomeList,
              onChanged: (String value) => setState(() {
                _incomeInput = value;
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            Dropdown(
              placeholder: 'Monthly expense',
              value: _expenseInput,
              options: monthlyExpenseList,
              onChanged: (String value) => setState(() {
                _expenseInput = value;
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            Spacer(),
            _submitButton(),
          ],
        ),
      ),
    );
  }
}
