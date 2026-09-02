import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../config/app_config.dart';

class WebViewScreen extends StatefulWidget {
  const WebViewScreen({super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  int _progress = 0;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(
        JavaScriptMode.unrestricted,
      )
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (progress) {
            if (!mounted) return;
            setState(() {
              _progress = progress;
            });
          },
          onPageStarted: (url) {
            debugPrint('Page Started: $url');
          },
          onPageFinished: (url) {
            debugPrint('Page Finished: $url');
          },
          onWebResourceError: (error) {
            debugPrint('WebViewError: ${error.description}');
          },
          onNavigationRequest: (request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(
        Uri.parse(
          AppConfig.productionUrl,
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            WebViewWidget(
              controller: _controller,
            ),
            if (_progress < 100)
              LinearProgressIndicator(
                value: _progress / 100,
              ),
          ],
        ),
      ),
    );
  }
}
