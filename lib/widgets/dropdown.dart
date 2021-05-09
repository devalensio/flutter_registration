import 'package:flutter/material.dart';

class Dropdown extends StatelessWidget {
  String placeholder;
  String value;
  List<String> options;
  Function onChanged;

  Dropdown({
    @required this.placeholder,
    @required this.value,
    @required this.options,
    @required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      dropdownColor: Colors.white,
      decoration: InputDecoration(
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
      ),
      value: value,
      hint: Text(placeholder),
      onChanged: onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) => value == null ? 'Field cannot be empty' : null,
      items: options.map<DropdownMenuItem<String>>(
        (String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        },
      ).toList(),
    );
  }
}
