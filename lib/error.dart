import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  final error;

  final String title;

  const Error({Key key, this.title = "Error occurred!", this.error = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.redAccent, borderRadius: BorderRadius.circular(16.0)),
        margin: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 32.0),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(Icons.error, color: Colors.black38, size: 72.0),
            const SizedBox(height: 18.0),
            Text(this.title,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(color: Colors.white)),
            const SizedBox(height: 12.0),
            Text(
              error.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .body2
                  .copyWith(color: Colors.white60),
            ),
          ],
        ),
      ),
    );
  }
}
