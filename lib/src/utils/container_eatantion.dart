import 'package:flutter/material.dart';

extension ContainerExt on Widget {
  InkWell onTab(Function() tab) {
    return InkWell(
      onTap: tab,
      child: this,
    );
  }
}
