import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewDemo extends StatelessWidget {
  Completer<WebViewController> ctrl = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Web View Demo'),
        ),
        body: Container(child: createWebView(ctrl)));
  }
}

createWebView(Completer<WebViewController> ctrl) {
  return WebView(
    onWebViewCreated: (WebViewController c) {
      ctrl.complete(c);
    },
    initialUrl: 'http://info.cern.ch/hypertext/WWW/TheProject.html',
    javascriptMode: JavascriptMode.unrestricted,
  );
}
