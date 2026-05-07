import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb, defaultTargetPlatform;
import 'package:flutter/services.dart';
import 'package:ganache_lab/models/recipe.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:share_plus/share_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:url_launcher/url_launcher.dart';

class ExportHubSheet extends StatelessWidget {
  final Recipe recipe;

  const ExportHubSheet({super.key, required this.recipe});

  // --- UTILS ---

  void _showLoadingDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        content: Row(
          children: [
            const CircularProgressIndicator(),
            const SizedBox(width: 20),
            Expanded(child: Text(message)),
          ],
        ),
      ),
    );
  }

  String _toSnakeCase(String text) {
    return text
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9\s]'), '')
        .trim()
        .replaceAll(RegExp(r'\s+'), '_');
  }

  String _generateSummaryText() {
    String s = "RECETTE : ${recipe.title}\n";
    s += "--------------------------------\n";
    s += "DONNEES D'EQUILIBRAGE :\n";
    s += "- Aw : ${recipe.awValue.toStringAsFixed(3)}\n";
    s += "- MG : ${(recipe.fatPercentage * 100).toStringAsFixed(1)}%\n";
    s += "- Sucre : ${(recipe.sugarPercentage * 100).toStringAsFixed(1)}%\n";
    s += "- EST : ${(recipe.solidsPercentage * 100).toStringAsFixed(1)}%\n";
    return s;
  }

  // --- PDF HELPERS ---

  pw.Widget _pdfContainer({
    required String title,
    required List<pw.Widget> children,
    pw.Font? iconFont,
    int? iconCode,
  }) {
    return pw.Container(
      margin: const pw.EdgeInsets.only(bottom: 15),
      padding: const pw.EdgeInsets.all(12),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: PdfColors.grey300, width: 1),
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(12)),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            children: [
              if (iconFont != null && iconCode != null) ...[
                pw.Text(
                  String.fromCharCode(iconCode),
                  style: pw.TextStyle(
                    font: iconFont,
                    fontSize: 16,
                    color: PdfColor.fromInt(0xff89511f),
                  ),
                ),
                pw.SizedBox(width: 8),
              ],
              pw.Text(
                title,
                style: pw.TextStyle(
                  fontSize: 14,
                  fontWeight: pw.FontWeight.bold,
                  color: PdfColor.fromInt(0xff89511f),
                ),
              ),
            ],
          ),
          pw.SizedBox(height: 10),
          ...children,
        ],
      ),
    );
  }

  pw.Widget _pdfDataRow(
    String name,
    String value, {
    bool isBold = false,
    bool showDivider = true,
  }) {
    return pw.Column(
      children: [
        pw.Padding(
          padding: const pw.EdgeInsets.symmetric(vertical: 3),
          child: pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(name, style: const pw.TextStyle(fontSize: 10)),
              pw.Text(
                value,
                style: pw.TextStyle(
                  fontSize: 10,
                  fontWeight:
                      isBold ? pw.FontWeight.bold : pw.FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
        if (showDivider) pw.Divider(color: PdfColors.grey100, thickness: 0.5),
      ],
    );
  }

  // --- PDF GENERATION ---

  Future<pw.Document> _generatePdf() async {
    final pdf = pw.Document();
    pw.Font? font;
    pw.Font? fontBold;
    pw.Font? iconFont;

    try {
      debugPrint("Chargement des polices PDF...");
      font = await PdfGoogleFonts.robotoRegular();
      fontBold = await PdfGoogleFonts.robotoBold();
      debugPrint("Polices chargées.");
    } catch (e) {
      debugPrint("Fallback polices PDF : $e");
    }

    // Chargement des images (Logo + QR Code)
    pw.MemoryImage? logoImage;
    pw.MemoryImage? qrImage;
    try {
      final ByteData logoData = await rootBundle.load(
        'assets/icon/Ganache.lab_material_logo.png',
      );
      logoImage = pw.MemoryImage(logoData.buffer.asUint8List());

      final ByteData qrData = await rootBundle.load(
        'assets/png/instragram_qr_code.jpg',
      );
      qrImage = pw.MemoryImage(qrData.buffer.asUint8List());
    } catch (e) {
      debugPrint("Erreur chargement images PDF : $e");
    }

    final primaryColor = PdfColor.fromInt(0xff89511f);

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        theme: pw.ThemeData.withFont(base: font, bold: fontBold),
        build: (pw.Context context) {
          return [
            // Header
            pw.Center(
              child: pw.Column(
                children: [
                  if (logoImage != null)
                    pw.Image(logoImage, width: 100, height: 100),
                  pw.SizedBox(height: 10),
                  pw.Text(
                    recipe.title,
                    style: pw.TextStyle(
                      fontSize: 22,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    "Crée par Ganache.lab",
                    style: const pw.TextStyle(
                      fontSize: 10,
                      color: PdfColors.grey600,
                    ),
                  ),
                ],
              ),
            ),

            pw.SizedBox(height: 20),

            _pdfContainer(
              title: "Ingrédients",
              iconFont: iconFont,
              iconCode: 0xe8b0,
              children: [
                if (recipe.chocolateWeight > 0)
                  _pdfDataRow(
                    "Chocolat (${recipe.chocolateType})",
                    "${recipe.chocolateWeight.toStringAsFixed(1)} g",
                    isBold: true,
                  ),
                if (recipe.milkChocolateWeight > 0)
                  _pdfDataRow(
                    "Chocolat Lait",
                    "${recipe.milkChocolateWeight.toStringAsFixed(1)} g",
                    isBold: true,
                  ),
                _pdfDataRow(
                  "Crème Liquide 35%",
                  "${recipe.creamWeight.toStringAsFixed(1)} g",
                ),
                _pdfDataRow(
                  "Matière Sucrante",
                  "${recipe.sugarWeight.toStringAsFixed(1)} g",
                ),
                _pdfDataRow(
                  "Beurre Laitier 82%",
                  "${recipe.butterWeight.toStringAsFixed(1)} g",
                  showDivider: false,
                ),
                pw.Divider(
                  borderStyle: pw.BorderStyle.dashed,
                  color: primaryColor,
                  thickness: 0.5,
                ),
                _pdfDataRow(
                  "Poids Total",
                  "${recipe.totalWeight.toStringAsFixed(1)} g",
                  isBold: true,
                  showDivider: false,
                ),
              ],
            ),

            _pdfContainer(
              title: "Résumé des paramètres",
              iconFont: iconFont,
              iconCode: 0xe8b8,
              children: [
                _pdfDataRow("Application", recipe.application),
                _pdfDataRow("Chocolat utilisé", recipe.chocolateType),
                _pdfDataRow(
                  "Température de travail",
                  "${recipe.temperature.toStringAsFixed(0)} °C",
                  showDivider: false,
                ),
              ],
            ),

            _pdfContainer(
              title: "Instructions",
              children: [
                pw.Text(
                  'Méthode à chaud',
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                ),
                pw.Text(
                  'Verser la crème à 80°C sur les pistoles de couverture non-fondues. Émulsionner au mixeur. Utiliser à la température d\'utilisation indiquée dans "Résumé des paramètres"',
                ),
              ],
            ),

            _pdfContainer(
              title: "Données d'équilibrage",
              iconFont: iconFont,
              iconCode: 0xe0e9,
              children: [
                _pdfDataRow(
                  "Matière Grasse Totale",
                  "${(recipe.fatPercentage * 100).toStringAsFixed(1)} %",
                ),
                _pdfDataRow(
                  "Sucre Total",
                  "${(recipe.sugarPercentage * 100).toStringAsFixed(1)} %",
                ),
                _pdfDataRow(
                  "Extrait Sec Total",
                  "${(recipe.solidsPercentage * 100).toStringAsFixed(1)} %",
                ),
                _pdfDataRow(
                  "Eau (Humidité)",
                  "${(recipe.waterPercentage * 100).toStringAsFixed(1)} %",
                ),
                _pdfDataRow(
                  "Pouvoir Sucrant (POD)",
                  recipe.sweeteningPower.toStringAsFixed(1),
                  showDivider: false,
                ),
                pw.Divider(
                  borderStyle: pw.BorderStyle.dashed,
                  color: primaryColor,
                  thickness: 0.5,
                ),
                _pdfDataRow(
                  "Activité de l'eau (Aw)",
                  recipe.awValue.toStringAsFixed(3),
                  isBold: true,
                  showDivider: false,
                ),
              ],
            ),

            pw.Spacer(),

            // Footer avec QR Code et Lien interactif
            pw.Row(
              children: [
                if (qrImage != null)
                  pw.Column(
                    children: [
                      pw.UrlLink(
                        destination:
                            'https://www.instagram.com/ganache.lab_app/',
                        child: pw.Text(
                          "Suivez Ganache.lab sur Instagram",
                          style: const pw.TextStyle(
                            fontSize: 7,
                            color: PdfColors.blue700,
                            decoration: pw.TextDecoration.underline,
                          ),
                        ),
                      ),
                      pw.SizedBox(height: 4),
                      pw.Image(qrImage, width: 120, height: 120),
                    ],
                  ),
              ],
            ),
          ];
        },
      ),
    );
    return pdf;
  }

  // --- ACTIONS ---

  Future<void> _handleDownload(BuildContext context) async {
    _showLoadingDialog(context, "Génération du PDF...");

    try {
      // Un léger délai pour laisser le temps à l'UI d'afficher le loader
      await Future.delayed(const Duration(milliseconds: 300));
      
      final pdf = await _generatePdf();
      final bytes = await pdf.save();
      final fileName = "${_toSnakeCase(recipe.title)}.pdf";

      if (kIsWeb) {
        // Sur le Web, on utilise Printing.sharePdf qui déclenche un téléchargement
        await Printing.sharePdf(bytes: bytes, filename: fileName);
        if (context.mounted) {
          Navigator.pop(context); // Ferme le dialogue
          Navigator.pop(context); // Ferme le bottom sheet
        }
        return;
      }

      // Code pour les plateformes natives (macOS, iOS, Android)
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/$fileName');
      if (!await file.parent.exists()) {
        await file.parent.create(recursive: true);
      }
      await file.writeAsBytes(bytes, flush: true);

      if (context.mounted) {
        Navigator.pop(context); // Ferme le dialogue
        Navigator.pop(context); // Ferme le bottom sheet
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Fichier enregistré dans Documents"),
            action: SnackBarAction(
              label: "OUVRIR",
              onPressed: () => launchUrl(Uri.file(file.path)),
            ),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context); // Ferme le dialogue
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erreur : $e")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // Détecte si on est sur un navigateur sur ordinateur (Desktop)
    final bool isWebDesktop =
        kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.macOS ||
            defaultTargetPlatform == TargetPlatform.windows ||
            defaultTargetPlatform == TargetPlatform.linux);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 25),

          // Le bouton Partager n'est affiché que si on n'est PAS sur le Web Desktop
          if (!isWebDesktop)
            ListTile(
              leading: const Icon(Symbols.share, color: Colors.blue),
              title: const Text("Partager"),
              onTap: () async {
                _showLoadingDialog(context, "Préparation du partage...");
                try {
                  // Un léger délai pour laisser le temps à l'UI d'afficher le loader
                  await Future.delayed(const Duration(milliseconds: 300));
                  
                  final pdf = await _generatePdf();
                  final bytes = await pdf.save();
                  final fileName = "${_toSnakeCase(recipe.title)}.pdf";

                  if (context.mounted) {
                    Navigator.pop(context); // Ferme le dialogue
                    Navigator.pop(context); // Ferme le bottom sheet
                  }

                  // ignore: deprecated_member_use
                  await Share.shareXFiles([
                    XFile.fromData(
                      bytes,
                      name: fileName,
                      mimeType: 'application/pdf',
                    ),
                  ], subject: recipe.title);
                } catch (e) {
                  if (context.mounted) {
                    Navigator.pop(context); // Ferme le dialogue
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Erreur : $e")),
                    );
                  }
                }
              },
            ),

          ListTile(
            leading: const Icon(Symbols.file_download, color: Colors.orange),
            title: const Text("Télécharger"),
            onTap: () => _handleDownload(context),
          ),

          ListTile(
            leading: const Icon(Symbols.print, color: Colors.green),
            title: const Text("Imprimer"),
            onTap: () async {
              _showLoadingDialog(context, "Préparation de l'impression...");

              try {
                // Délai initial pour voir le loader
                await Future.delayed(const Duration(milliseconds: 300));

                final pdf = await _generatePdf();
                final bytes = await pdf.save();

                if (context.mounted) {
                  Navigator.pop(context); // Ferme le dialogue
                  Navigator.pop(context); // Ferme le bottom sheet
                }

                // Délai de sécurité pour macOS avant d'ouvrir le dialogue natif
                await Future.delayed(const Duration(milliseconds: 500));

                // On ne met pas 'await' ici car sur macOS le dialogue natif 
                // peut bloquer l'exécution asynchrone de Flutter
                Printing.layoutPdf(
                  onLayout: (format) => bytes,
                  name: _toSnakeCase(recipe.title),
                );
              } catch (e) {
                if (context.mounted) {
                  // On vérifie si le dialogue est encore là avant de pop
                  // (en cas d'erreur avant le premier pop)
                  Navigator.of(context, rootNavigator: true).pop();
                  debugPrint("Erreur impression : $e");
                }
              }
            },
          ),

          ListTile(
            leading: Icon(Symbols.send, color: colorScheme.primary),
            title: const Text("Partager le texte"),
            onTap: () async {
              _showLoadingDialog(context, "Génération du résumé...");
              
              await Future.delayed(const Duration(milliseconds: 300));
              
              if (context.mounted) {
                Navigator.pop(context); // Ferme le dialogue
                Navigator.pop(context); // Ferme le bottom sheet
              }
              // ignore: deprecated_member_use
              Share.share(_generateSummaryText());
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
