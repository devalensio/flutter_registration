import 'package:flutter/material.dart';

import '../widgets/step_progress_bar.dart';
import '../widgets/create_email_view.dart';
import '../widgets/create_password_view.dart';
import '../widgets/personal_info_view.dart';
import '../widgets/video_call_view.dart';

import '../models/content.dart';
import '../models/user.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => new _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  int _currentStep = 0;
  User _user = User(
    email: '',
    password: '',
    goal: '',
    monthlyIncome: '',
    monthlyExpense: '',
    dateTime: null,
  );

  void goNextStep() {
    setState(() {
      _currentStep++;
    });
  }

  void _addUserEmail(String email) {
    final currentUser = _user;
    currentUser.email = email;

    setState(() {
      _user = currentUser;
    });

    goNextStep();
  }

  void _addUserPassword(String password) {
    final currentUser = _user;
    currentUser.password = password;

    setState(() {
      _user = currentUser;
    });

    goNextStep();
  }

  void _addUserInfo(String goal, String monthlyIncome, String monthlyExpense) {
    final currentUser = _user;
    currentUser.goal = goal;
    currentUser.monthlyIncome = monthlyIncome;
    currentUser.monthlyExpense = monthlyExpense;

    setState(() {
      _user = currentUser;
    });

    goNextStep();
  }

  void _addUserDateTIme(DateTime dateTime) {
    final currentUser = _user;
    currentUser.dateTime = dateTime;

    setState(() {
      _user = currentUser;
    });

    final snackBar = SnackBar(
      content: Text('Thanks for registering...'),
      action: SnackBarAction(
        label: 'close',
        onPressed: () {},
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  List<Content> _mySteps() {
    List<Content> steps = [
      Content(
        title: 'Create Email',
        isActive: _currentStep > 0,
        child: CreateEmailView(
          saveData: _addUserEmail,
          userEmail: _user.email,
        ),
      ),
      Content(
        title: 'Create Password',
        isActive: _currentStep > 1,
        child: CreatePasswordView(
          saveData: _addUserPassword,
          userPassword: _user.password,
        ),
      ),
      Content(
        title: 'Personal Information',
        isActive: _currentStep > 2,
        child: PersonalInfoView(
          saveData: _addUserInfo,
          userGoal: _user.goal,
          userIncome: _user.monthlyIncome,
          userExpense: _user.monthlyExpense,
        ),
      ),
      Content(
        title: 'Schedule Video Call',
        isActive: _currentStep > 3,
        child: VideoCallView(
          saveData: _addUserDateTIme,
          userDateTime: _user.dateTime,
        ),
      ),
    ];

    return steps;
  }

  @override
  Widget build(BuildContext context) {
    List<Content> contentSteps = _mySteps();

    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final AppBar appBar = AppBar(
      backgroundColor: const Color(0xff447cf4),
      elevation: 0,
      title: const Text('Create Account'),
      leading: _currentStep > 0
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => setState(() {
                _currentStep = _currentStep - 1;
              }),
            )
          : null,
    );

    final double totalHeight = (mediaQuery.size.height -
        mediaQuery.padding.top -
        appBar.preferredSize.height -
        // MediaQuery.of(context).viewInsets.bottom -
        120);

    return Scaffold(
      appBar: appBar,
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                alignment: Alignment.center,
                child: StepProgressBar(
                  contents: contentSteps,
                  activeColor: Colors.green[300],
                  inactiveColor: Colors.grey[300],
                  currentStep: _currentStep,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
              Container(
                height: totalHeight,
                alignment: Alignment.center,
                child: contentSteps[_currentStep].child,
              )
            ],
          ),
        ),
      ),
    );
  }
}
