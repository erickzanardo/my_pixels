import 'package:flutter/material.dart';
import 'package:dashbook/dashbook.dart';

import './stories/like_button_story.dart' as LikeButton;

void main() {
  final dashbook = Dashbook();

  LikeButton.addStories(dashbook);

  runApp(dashbook);
}
