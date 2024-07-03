// Automatic FlutterFlow imports
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<void> pindahpdf(
  String? namaKepalaKeluarga,
  String? nik,
  String? nomorKK,
  String? alamatLama,
  String? alamatTujuan,
  String? nomorTelepon,
  String? alasanMengajukan,
) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Padding(
          padding: const pw.EdgeInsets.all(16),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Center(
                child: pw.Column(
                  children: [
                    pw.Text(
                      'PEMERINTAH KABUPATEN MAGELANG',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'KECAMATAN MUNTILAN',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'DESA CONGKRANG',
                      style: pw.TextStyle(
                          fontSize: 14, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'Jln. Tentara Pelajar, Muntilan, No.Telp +628444490 Kode Pos 545371',
                      style: pw.TextStyle(fontSize: 12),
                      textAlign: pw.TextAlign.center,
                    ),
                    pw.SizedBox(height: 8),
                    pw.Divider(thickness: 2),
                    pw.SizedBox(height: 8),
                    pw.Text(
                      'SURAT KETERANGAN PINDAH',
                      style: pw.TextStyle(
                          fontSize: 18, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.Text(
                      'No : ...............................................',
                      style: pw.TextStyle(fontSize: 12),
                    ),
                    pw.SizedBox(height: 16),
                  ],
                ),
              ),
              pw.Text('Yang bertanda tangan di bawah ini :'),
              pw.SizedBox(height: 16),
              pw.Text('1. Nama Kepala Keluarga: $namaKepalaKeluarga'),
              pw.Text('2. NIK: $nik'),
              pw.Text('3. Nomor KK: $nomorKK'),
              pw.Text('4. Alamat Lama: $alamatLama'),
              pw.Text('5. Alamat Tujuan: $alamatTujuan'),
              pw.Text('6. Nomor Telepon: $nomorTelepon'),
              pw.Text('7. Alasan Mengajukan: $alasanMengajukan'),
              pw.SizedBox(height: 16),
              pw.Text(
                  'Congrang, ${DateTime.now().toLocal().toString().split(' ')[0]}'),
              pw.Text('Mengetahui'),
              pw.Text('Kepala Desa Congkrang'),
              pw.SizedBox(height: 32),
              pw.Text('______________________'),
            ],
          ),
        );
      },
    ),
  );

  final pdfSaved = await pdf.save();

  await Printing.layoutPdf(onLayout: (PdfPageFormat format) async => pdfSaved);
}
