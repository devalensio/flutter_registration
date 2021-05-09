import 'package:flutter/material.dart';

class User {
  String email;
  String password;
  String goal;
  String monthlyIncome;
  String monthlyExpense;
  DateTime dateTime;

  User({
    this.email,
    this.password,
    this.goal,
    this.monthlyExpense,
    this.monthlyIncome,
    this.dateTime,
  });
}
