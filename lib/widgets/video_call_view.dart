import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import './pulsating_cicle_icon.dart';

import './dropdown.dart';

class VideoCallView extends StatelessWidget {
  final Function handleSubmit;

  VideoCallView(
    this.handleSubmit,
  );

  final deviceTypes = ["Mac", "Windows", "Mobile"];

  Widget _iosDatePicker() {
    return CupertinoDatePicker(
      initialDateTime: DateTime.now(),
      onDateTimeChanged: (DateTime newdate) {
        print(newdate);
        // setState(() {
        //   dateTime = newdate.day.toString() +
        //       '/' +
        //       newdate.month.toString() +
        //       '/' +
        //       newdate.year.toString() +
        //       ' ' +
        //       newdate.hour.toString() +
        //       ' hrs ' +
        //       newdate.minute.toString() +
        //       ' mins';
        // });
      },
      // use24hFormat: true,
      maximumDate: DateTime(2021, 12, 30),
      minimumYear: DateTime.now().year,
      maximumYear: DateTime.now().year + 10,
      minuteInterval: 1,
      mode: CupertinoDatePickerMode.date,
    );
  }

  Future<void> bottomSheet(BuildContext context, Widget child,
      {double height}) {
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
          height: height ?? MediaQuery.of(context).size.height / 3,
          child: child),
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
          PulsatingCircleIcon(),
          const SizedBox(
            height: 30,
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
                onPressed: () {
                  bottomSheet(context, _iosDatePicker());
                },
                child: Text('Next'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
