import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactModel extends StateNotifier{
  final String name;
  final String phoneNum;
  final String email;
  ContactModel({

    required this.name,
    required this.phoneNum,
    required this.email
  }) : super(null);
}