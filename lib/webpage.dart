import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {

  WebPage(this._context);

  final String _context;

  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Leitor QRCode"),
      ),
      body: WebView(
        initialUrl: widget._context,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
