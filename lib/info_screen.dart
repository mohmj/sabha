import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InfoScreen extends StatelessWidget {
    WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Info"),),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: WebView(
              initialUrl: 'https://www.bing.com',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated:(WebViewController webViewController){
                _controller=webViewController;
              },
            ),),
          ],
        ),
      ),
    );
  }
}


// class InfoScreen extends StatelessWidget {
//   static const String id="info_screen";
//
//   WebViewController _controller;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(""),),
//       body: Expanded(
//           child: WebView(
//             initialUrl: 'https://www.google.com',
//             javascriptMode: JavascriptMode.unrestricted,
//             onWebViewCreated:(WebViewController webViewController){
//               _controller=webViewController;
//             },
//           ),
//       ),
//     );
//   }
// }
