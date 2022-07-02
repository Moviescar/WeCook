import 'package:flutter/material.dart';

class ShowElement {
  TextOverflow? _overflow;
  int? _maxLines;

  ShowElement(overflow, maxLines){
    _overflow = _overflow;
    _maxLines = maxLines;
  }

  int? get maxLines => _maxLines;

  set maxLines(int? value) {
    _maxLines = value;
  }

  TextOverflow? get overflow => _overflow;

  set overflow(TextOverflow? value) {
    _overflow = value;
  }
}