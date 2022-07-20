import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header(this.heading, {super.key});
  final String heading;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          heading,
          style: const TextStyle(fontSize: 24),
        ),
      );
}

class StyledButton extends StatelessWidget {
  const StyledButton({required this.child, required this.onPressed, super.key, required this.text});

  final Widget child;
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                style:  ElevatedButton.styleFrom( // returns ButtonStyle
            primary: Colors.lightBlue,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0)))
                    .copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
                onPressed: onPressed,
                child:
                Text(text, style: TextStyle(color: Colors.white, fontSize: 15)),
              ),
            ]));
    //=> OutlinedButton(
    // style: OutlinedButton.styleFrom(
    //   side: const BorderSide(color: Colors.blue)),
    //onPressed: onPressed,
    //child: child,
    //);
  }
}
//