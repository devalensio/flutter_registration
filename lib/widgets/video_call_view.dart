import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './pulsating_cicle_icon.dart';

import './dropdown.dart';

class VideoCallView extends StatefulWidget {
  static final _formKey = GlobalKey<FormState>();
  final Function saveData;
  final DateTime userDateTime;

  const VideoCallView({@required this.saveData, @required this.userDateTime});

  @override
  _VideoCallViewState createState() => _VideoCallViewState();
}

class _VideoCallViewState extends State<VideoCallView> {
  String _selectedDate;
  String _selectedTime;

  void _androidDatePicker() async {
    final DateTime pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2021, 12, 30),
    );

    if (pickerDate != null) {
      setState(() {
        _selectedDate =
            '${pickerDate.year.toString()}-${pickerDate.month.toString().padLeft(2, '0')}-${pickerDate.day.toString().padLeft(2, '0')}';
      });
    }
  }

  void _androidTimePicker() async {
    final TimeOfDay pickerTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickerTime != null) {
      setState(() {
        _selectedTime =
            '${pickerTime.hour.toString().padLeft(2, '0')}:${pickerTime.minute.toString().padLeft(2, '0')}';
      });
    }
  }

  Widget _iosDateTimePicker(String type) {
    return CupertinoDatePicker(
      initialDateTime: DateTime.now(),
      maximumDate: DateTime(2021, 12, 30),
      minimumYear: DateTime.now().year,
      maximumYear: DateTime.now().year,
      minuteInterval: 1,
      mode: type == 'date'
          ? CupertinoDatePickerMode.date
          : CupertinoDatePickerMode.time,
      onDateTimeChanged: (DateTime pickerDate) {
        setState(() {
          if (type == 'date') {
            _selectedDate =
                '${pickerDate.year.toString()}-${pickerDate.month.toString().padLeft(2, '0')}-${pickerDate.day.toString().padLeft(2, '0')}';
            return;
          }
          _selectedTime =
              '${pickerDate.hour.toString().padLeft(2, '0')}:${pickerDate.minute.toString().padLeft(2, '0')}';
        });
      },
    );
  }

  Future<void> _bottomSheet(BuildContext context, Widget child) {
    return showModalBottomSheet(
      isScrollControlled: false,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(13),
          topRight: Radius.circular(13),
        ),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height / 3,
        child: child,
      ),
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
            if (VideoCallView._formKey.currentState.validate()) {
              final DateTime dt =
                  DateTime.parse('$_selectedDate $_selectedTime:00');
              widget.saveData(dt);
            }
          },
          child: Text('Next'),
        ),
      ),
    );
  }

  @override
  void initState() {
    if (widget.userDateTime != null) {
      final String date =
          '${widget.userDateTime.year.toString()}-${widget.userDateTime.month.toString().padLeft(2, '0')}-${widget.userDateTime.day.toString().padLeft(2, '0')}';
      final String time =
          '${widget.userDateTime.hour.toString().padLeft(2, '0')}:${widget.userDateTime.minute.toString().padLeft(2, '0')}';

      setState(() {
        _selectedDate = date;
        _selectedTime = time;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Form(
        key: VideoCallView._formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PulsatingCircleIcon(),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Schedule Video Call',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Choose the date and time that you preferred, we will send a link via email to make a video call on the scheduled date and time',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Platform.isIOS
                    ? _bottomSheet(context, _iosDateTimePicker('date'))
                    : _androidDatePicker();
              },
              child: Dropdown(
                placeholder: 'Date',
                value: _selectedDate,
                options: _selectedDate != null ? [_selectedDate] : [],
                onChanged: (_) {},
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Platform.isIOS
                    ? _bottomSheet(context, _iosDateTimePicker('time'))
                    : _androidTimePicker();
              },
              child: Dropdown(
                placeholder: 'Time',
                value: _selectedTime,
                options: _selectedTime != null ? [_selectedTime] : [],
                onChanged: (_) {},
              ),
            ),
            Spacer(),
            _submitButton(),
          ],
        ),
      ),
    );
  }
}
