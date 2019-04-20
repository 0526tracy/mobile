import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class InvertedButton extends StatelessWidget {
  const InvertedButton({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).cardColor,
      elevation: 5.0,
      minWidth: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      child: Text(
        title.toUpperCase(),
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {},
    );
  }
}
