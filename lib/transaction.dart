import 'package:flutter/material.dart';

class Transaction {
  IconData icon;
  String description;
  String amount;
  String currency;
  String date;
  String type;

  Transaction(
      {this.icon,
      this.amount,
      this.currency,
      this.date,
      this.description,
      this.type});
}
