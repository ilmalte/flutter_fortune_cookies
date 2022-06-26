// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:fortune_cookies/core/style.dart';
import 'package:fortune_cookies/home/cookie/route.dart';

void main() {
  runApp(
    const FortuneCookies(),
  );
}

class FortuneCookies extends StatelessWidget {
  const FortuneCookies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello Cookies',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: secondaryColor,
          title: const Text('Hello Cookies'),
        ),
        body: const CookieRoute(),
        backgroundColor: fourthColor,
      ),
    );
  }
}
