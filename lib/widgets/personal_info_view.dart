import 'package:flutter/material.dart';

class PersonalInfoView extends StatelessWidget {
  final Function handleSubmit;

  PersonalInfoView(
    this.handleSubmit,
  );

  final deviceTypes = ["Mac", "Windows", "Mobile"];

  Widget _dropdownWidget(
      String placeholder, String value, List<String> options) {
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Text(placeholder),
              value: value,
              isDense: true,
              onChanged: (newValue) {},
              items: options.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        );
      },
    );
  }

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
          _dropdownWidget('Goal for activation', null, deviceTypes),
          const SizedBox(
            height: 20,
          ),
          _dropdownWidget('Monthly Income', null, deviceTypes),
          const SizedBox(
            height: 20,
          ),
          _dropdownWidget('Monthly expense', null, deviceTypes),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blue[200]),
                  ),
                  onPressed: handleSubmit,
                  child: Text('Next'),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
