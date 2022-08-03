import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smm_app/providers/pages_provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class InfoPageScreen extends StatefulWidget {
  final int id;
  const InfoPageScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<InfoPageScreen> createState() => _InfoPageScreenState();
}

class _InfoPageScreenState extends State<InfoPageScreen> {
  late PagesProvider _pagesProvider;
  late WebViewController _webViewController;

  @override
  void didChangeDependencies() async {
    _pagesProvider = Provider.of<PagesProvider>(context);
    await _pagesProvider.getPages(context);
    super.didChangeDependencies();
  }

  void _loadHtmlFromAssets() async {
    log('Page ID -> ${_pagesProvider.pages.firstWhere((element) => element.id! == widget.id).id}');
    _webViewController.loadUrl(Uri.dataFromString(
            _pagesProvider.pages
                .firstWhere((element) => element.id! == widget.id)
                .data!,
            mimeType: 'text/html',
            encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id == 2 ? 'Privacy Policy' : 'Terms & Conditions'),
      ),
      body: SingleChildScrollView(
        primary: true,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: const Color(0xFFF9F9F9),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: WebView(
              zoomEnabled: true,
              initialUrl: 'about:blank',
              onWebViewCreated: (controller) {
                _webViewController = controller;
                _loadHtmlFromAssets();
              },
            ),
          ),
        ),
      ),
    );
  }
}
