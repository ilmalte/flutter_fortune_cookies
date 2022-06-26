import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fortune_cookies/home/cookie/api.dart';

import '../../core/style.dart';
import 'model.dart';
import 'widget.dart';

class CookieRoute extends StatefulWidget {
  const CookieRoute({Key? key}) : super(key: key);

  @override
  State<CookieRoute> createState() => _CookieRouteState();
}

const _iconSize = 90.0;
const _iconLocation = Icons.cookie;

class _CookieRouteState extends State<CookieRoute> {
  List<Cookie> toBeOpenCookies = [];
  Cookie? openedCookie;

  String getAuthorCookie(openedCookie) {
    return openedCookie.author;
  }

  String getTextCookie(openedCookie) {
    return openedCookie.text;
  }

  Cookie? getRandomCookieOrNull() {
    // generates a new Random object
    final _random = Random();

    if (toBeOpenCookies.isEmpty) {
      return null;
    }
    // generate a random index based on the list length
    // and use it to retrieve the element
    return toBeOpenCookies[_random.nextInt(toBeOpenCookies.length)];
  }

  openCookie() async {
    final api = CookiesApi();
    if (toBeOpenCookies.isEmpty) {
      toBeOpenCookies = await api.getAll();
    }
    setState(() {
      openedCookie = getRandomCookieOrNull();
    });
    return;
  }

  copyToClipboard() {
    print("TODO: copy to clipboard");
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onLongPress: () => copyToClipboard(),
        onTap: () => openCookie(),
        child: Container(
          color: fourthColor,
          height: 400.0,
          width: 300.0,
          child: Center(
            child: _buildChild(),
          ),
        ),
      ),
    );
  }

  Widget welcomeWidget() {
    return const Center(
      child: Icon(
        _iconLocation,
        size: _iconSize,
        color: primaryColor,
      ),
    );
  }

  Widget _buildChild() {
    if (getRandomCookieOrNull() == null) {
      return welcomeWidget();
    }
    return CookieWidget(
      cookie: Cookie(
        author: getAuthorCookie(openedCookie),
        text: getTextCookie(openedCookie),
      ),
    );
  }
}
