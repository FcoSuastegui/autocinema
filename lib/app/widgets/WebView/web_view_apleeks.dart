import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:autocinema/app/widgets/Loading/loading_apleeks.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewApleeks extends StatefulWidget {
  final String url;
  final String title;

  const WebViewApleeks({
    Key key,
    @required this.url,
    this.title,
  }) : super(key: key);

  @override
  _WebViewApleeksState createState() => _WebViewApleeksState();
}

class _WebViewApleeksState extends State<WebViewApleeks> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    Completer<WebViewController> _webcontroller = Completer<WebViewController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? 'Titulo no disponible'),
        actions: <Widget>[
          _NavigationControls(_webcontroller.future),
        ],
      ),
      body: SafeArea(
        child: Builder(
          builder: (BuildContext context) {
            return Stack(
              children: [
                WebView(
                  initialUrl: widget.url,
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                    _webcontroller.complete(webViewController);
                  },
                  javascriptChannels: <JavascriptChannel>[
                    _toasterJavascriptChannel(context),
                  ].toSet(),
                  navigationDelegate: (NavigationRequest request) {
                    print('allowing navigation to $request');
                    return NavigationDecision.navigate;
                  },
                  onPageStarted: (String url) {
                    LoadingApleeks.show(context);
                    print('Page started loading: $url');

                    //controller.loading = true;
                  },
                  onPageFinished: (String url) {
                    LoadingApleeks.hide(context);
                    print('Page finished loading: $url');
                    //controller.loading = false;
                  },
                  gestureNavigationEnabled: true,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
      name: 'Toaster',
      onMessageReceived: (JavascriptMessage message) => Scaffold.of(context).showSnackBar(
        SnackBar(content: Text(message.message)),
      ),
    );
  }
}

class _NavigationControls extends StatelessWidget {
  const _NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder: (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady = snapshot.connectionState == ConnectionState.done;
        final WebViewController controller = snapshot.data;
        return Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: !webViewReady
                  ? null
                  : () async => await controller.canGoBack()
                      ? await controller.goBack()
                      : Scaffold.of(context).showSnackBar(
                          const SnackBar(content: Text("Sin historial")),
                        ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: !webViewReady
                  ? null
                  : () async => await controller.canGoForward()
                      ? await controller.goForward()
                      : Scaffold.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Ningún elemento en el historial"),
                          ),
                        ),
            ),
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: !webViewReady ? null : () => controller.reload(),
            ),
          ],
        );
      },
    );
  }
}
