
import 'package:flutter/material.dart';

class UserAccount {
  final int id;
  final String username, passwordHash;
  final bool isActive;
  final DateTime createdAt;
  final DateTime? lastLoginAt;

  UserAccount({
    required this.id,
    required this.username,
    required this.passwordHash,
    required this.isActive,
    required this.createdAt,
    this.lastLoginAt
  });


  @override String toString() => "$id - $username";
}