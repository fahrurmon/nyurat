// Automatic FlutterFlow imports
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<void> genPDF(
  String? namaPelapor,
  String? nikPelapor,
  String? nikAlmarhum,
  String? namaAlmarhum,
  String? umurAlmarhum,
  String? tempatKematian,
  String? jenisKelamin,
  DateTime? tanggalKematian,
  String? alasanMengajukan,
) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Padding(
          padding: const pw.EdgeInsets.all(32),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Header Section
              pw.Center(
                child: pw.Column(
                  children: [
                    pw.Text(
                      'PEMERINTAH KABUPATEN MAGELANG',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      'KECAMATAN MUNTILAN',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Text(
                      'DESA CONGKRANG',
                      style: pw.TextStyle(
                        fontSize: 12,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 16),
              pw.Center(
                child: pw.Text(
                  'SURAT KETERANGAN KEMATIAN',
                  style: pw.TextStyle(
                    fontSize: 16,
                    fontWeight: pw.FontWeight.bold,
                    decoration: pw.TextDecoration.underline,
                  ),
                ),
              ),
              pw.Center(
                child: pw.Text(
                  'Nomor: 218/KD-RHT/SKK/IX/2024',
                  style: pw.TextStyle(fontSize: 12),
                ),
              ),
              pw.SizedBox(height: 16),

              // Body Section
              pw.Text(
                'Yang bertanda Tangan dibawah ini, Kepala Desa CONGKRANG Menerangkan dengan sesungguhnya bahwa:',
                style: pw.TextStyle(fontSize: 12),
              ),
              pw.SizedBox(height: 16),
              pw.Text('Identitas Pelapor:',
                  style: pw.TextStyle(
                      fontSize: 12, fontWeight: pw.FontWeight.bold)),
              pw.Text('Nama: $namaPelapor', style: pw.TextStyle(fontSize: 12)),
              pw.Text('NIK: $nikPelapor', style: pw.TextStyle(fontSize: 12)),
              pw.SizedBox(height: 16),
              pw.Text('Identitas Almarhum:',
                  style: pw.TextStyle(
                      fontSize: 12, fontWeight: pw.FontWeight.bold)),
              pw.Text('NIK: $nikAlmarhum', style: pw.TextStyle(fontSize: 12)),
              pw.Text('Nama: $namaAlmarhum', style: pw.TextStyle(fontSize: 12)),
              pw.Text('Umur: $umurAlmarhum', style: pw.TextStyle(fontSize: 12)),
              pw.Text('Tempat Kematian: $tempatKematian',
                  style: pw.TextStyle(fontSize: 12)),
              pw.Text('Jenis Kelamin: $jenisKelamin',
                  style: pw.TextStyle(fontSize: 12)),
              pw.Text(
                'Tanggal Kematian: ${tanggalKematian != null ? tanggalKematian.toLocal().toString().split(' ')[0] : 'N/A'}',
                style: pw.TextStyle(fontSize: 12),
              ),
              pw.SizedBox(height: 16),
              pw.Text('Alasan Mengajukan:',
                  style: pw.TextStyle(
                      fontSize: 12, fontWeight: pw.FontWeight.bold)),
              pw.Text(alasanMengajukan ?? 'N/A',
                  style: pw.TextStyle(fontSize: 12)),
              pw.SizedBox(height: 32),
              pw.Text(
                'Adalah benar-benar warga Desa Congkrang Kecamatan Muntilan dan Yang bersangkutan Telah Meninggal Dunia pada hari ${tanggalKematian?.day ?? ''} ${tanggalKematian?.month ?? ''} ${tanggalKematian?.year ?? ''} Jam ${tanggalKematian?.hour ?? ''}.${tanggalKematian?.minute ?? ''} Wib di Desa Congkrang Kecamatan Muntilan Kabupaten Magelang Serta di Makamkan dipemakaman umum ( TPU ) Desa Congkrang',
                style: pw.TextStyle(fontSize: 12),
              ),
              pw.SizedBox(height: 16),
              pw.Text(
                'Demikian Surat keterangan ini kami buat dengan sebenarnya untuk dipergunakan seperlunya.',
                style: pw.TextStyle(fontSize: 12),
              ),
              pw.SizedBox(height: 32),
              pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Text(
                  'Congkrang, ${DateTime.now().day} ${DateTime.now().month} ${DateTime.now().year}',
                  style: pw.TextStyle(fontSize: 12),
                ),
              ),
              pw.SizedBox(height: 32),
              pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Text(
                  'Kepala Desa Congkrang',
                  style: pw.TextStyle(fontSize: 12),
                ),
              ),
              pw.SizedBox(height: 64),
              pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Text(
                  'SL MUKHILS, S.HI',
                  style: pw.TextStyle(
                    fontSize: 12,
                    fontWeight: pw.FontWeight.bold,
                    decoration: pw.TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );

  final pdfBytes = await pdf.save();

  await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => pdfBytes,
  );
}
