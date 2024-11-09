import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  
  final String url;

  const WebViewScreen({super.key, required this.url});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  final WebViewController _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {},
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onHttpError: (HttpResponseError error) {},
        onWebResourceError: (WebResourceError error) {},
        // onNavigationRequest: (NavigationRequest request) {
        //   if (request.url.startsWith('https://www.youtube.com/')) {
        //     return NavigationDecision.prevent;
        //   }
        //   return NavigationDecision.navigate;
        // },
      ),
    );

  @override
  Widget build(BuildContext context) {
    _controller.loadRequest(Uri.parse(widget.url));
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'WebView',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: WebViewWidget(controller: _controller)
    );
  }
}
