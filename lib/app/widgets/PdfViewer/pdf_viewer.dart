import 'package:flutter/material.dart';
import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';

class PdfViewer extends StatefulWidget {
  final String path, title;
  const PdfViewer({
    this.title,
    @required this.path,
  });

  @override
  _PdfViewerState createState() => _PdfViewerState();
}

class _PdfViewerState extends State<PdfViewer> {
  bool isLoading = true;
  String message = '';

  PDFDocument document;

  @override
  void initState() {
    super.initState();
    _init();
  }

  _init() async {
    try {
      print(widget.path);
      document = await PDFDocument.fromURL(widget.path);
    } catch (e) {
      message = e.toString();
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title ?? 'Titulo disponible',
          style: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontSize: 18,
          ),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : message.isEmpty
              ? PDFViewer(
                  document: document,
                  showPicker: false,
                )
              : Center(
                  child: Text(message),
                ),
    );
  }

  String getErrorMessage(String v) {
    print(v);
    Map<String, dynamic> message = {
      'Exception: Error reading PDF!': 'Error, no se puede leer el documento pdf.',
      'Invalid argument(s): No host specified in URI':
          'Error, no se ha especificado una path valido.'
    };

    print(message.containsKey(v));
    return message[v] ?? '';
  }
}
