import 'package:flutter/material.dart';
import 'package:fortune_cookies/core/style.dart';

import 'model.dart';

const _rowHeight = 190.0;

class CookieWidget extends StatefulWidget {
  final Cookie cookie;
  const CookieWidget({Key? key, required this.cookie}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CookieWidgetState();
}

class _CookieWidgetState extends State<CookieWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: SizedBox(
          height: _rowHeight,
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: Text(
                widget.cookie.text,
                maxLines: 260,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, color: primaryColor),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.cookie.author,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10, color: thirdColor),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
