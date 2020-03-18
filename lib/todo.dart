import 'package:flutter/cupertino.dart';

class Todo{
  Todo({this.title, this.isDone = false});

  @required String title;
  bool isDone;
}