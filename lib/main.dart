import 'package:flutter/material.dart';
import 'mobile.dart' if(dart.libray.html) 'web.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton(
        child: Text('Create Resume'),
        onPressed: _createResume,
      ),
    ));
  }

  Future<void> _createResume() async {
    PdfDocument document = PdfDocument();
    final page = document.pages.add();
    page.graphics.drawString(
      'M.AKILA',
      PdfStandardFont(PdfFontFamily.helvetica, 30),
    );

    PdfGrid grid = PdfGrid();

    grid.style = PdfGridStyle(
        font: PdfStandardFont(PdfFontFamily.helvetica, 30),
        cellPadding: PdfPaddings(left: 5, right: 2, top: 2, bottom: 2));

    grid.columns.add(count: 4);
    grid.headers.add(1);

    PdfGridRow header = grid.headers[0];
    header.cells[0].value = 'Class/Course';
    header.cells[1].value = 'School/University';
    header.cells[2].value = 'Percentage';
    header.cells[3].value = 'Year';

    PdfGridRow row = grid.rows.add();

    row.cells[0].value = 'B.E';
    row.cells[1].value = 'Anna University';
    row.cells[2].value = '80';
    row.cells[3].value = '2011';

    row = grid.rows.add();
    row.cells[0].value = 'HSC';
    row.cells[1].value = 'NLC Girls High School';
    row.cells[2].value = '80';
    row.cells[3].value = '2007';
    row = grid.rows.add();
    row.cells[0].value = 'SSLC';
    row.cells[1].value = 'NLC Girls High School';
    row.cells[2].value = '80';
    row.cells[3].value = '2005';

    grid.draw(page: page, bounds: const Rect.fromLTWH(0, 50, 0, 0));
    // page: document.pages.add(), bounds: const Rect.fromLTWH(0, 0, 0, 0));
    page.graphics.drawString(
        'Technologies : Love to explore  and  love to code.',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          20,
        ),
        bounds: const Rect.fromLTWH(0, 600, 0, 0));

    page.graphics.drawString(
        'Thanks in Advance',
        PdfStandardFont(
          PdfFontFamily.helvetica,
          20,
        ),
        bounds: const Rect.fromLTWH(0, 650, 0, 0));
    List<int> bytes = document.save();
    document.dispose();

    saveAndLaunchFile(bytes, 'resume.pdf');
  }
}
