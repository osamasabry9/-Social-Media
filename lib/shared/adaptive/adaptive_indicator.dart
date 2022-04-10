import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AdaptiveIndicator extends StatelessWidget {
  late String os;

  AdaptiveIndicator({
    Key? key,
    required this.os,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_this
    if(this.os =='android') return const CircularProgressIndicator();
    return const CupertinoActivityIndicator();
  }
}
