import 'package:elemes_flix/extensions/media_query_extension.dart';
import 'package:flutter/widgets.dart';

extension ContextExt on BuildContext {
  double heightInPercent(double percent) {
    final height = this.height * (percent / 100);
    return height;
  }

  double widthInPercent(double percent) {
    final width = this.width * (percent / 100);
    return width;
  }
}
