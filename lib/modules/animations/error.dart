import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage(
      {this.size = 300,
      Key,
      required this.errorMessage,
      required this.onRetry});
  final double size;
  final String errorMessage;
  final VoidCallback onRetry;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('assets/lottie/error.json', width: size),
        Text(errorMessage),
        ElevatedButton(child: Text('Try Again'), onPressed: onRetry)
      ],
    ));
  }
}
