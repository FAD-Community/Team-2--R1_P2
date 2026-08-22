import 'package:flutter/material.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String description;
  final IconData icon;
  final Color iconBackgroundColor;
  final Color iconColor;

  const OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
    required this.icon,
    required this.iconBackgroundColor,
    required this.iconColor,
  });
}