import 'package:flutter/cupertino.dart';

class MediaQueryHelper {
  final BuildContext context;
  MediaQueryHelper(this.context);

  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
  double get topPadding => MediaQuery.of(context).padding.top;
  double get bottomPadding => MediaQuery.of(context).padding.bottom;
}