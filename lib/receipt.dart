// utils/pdf_generator.dart
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:whitematrix/cart.dart';


Future<void> generatePdfReceipt(Cart cart) async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          children: [
            pw.Text('Receipt', style: pw.TextStyle(fontSize: 24)),
            pw.Divider(),
            pw.ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final product = cart.items[index];
                return pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text(product.name),
                    pw.Text('\$${product.price.toStringAsFixed(2)}'),
                  ],
                );
              },
            ),
            pw.Divider(),
            pw.Text('Total: \$${cart.totalPrice.toStringAsFixed(2)}'),
          ],
        );
      },
    ),
  );

  final output = await getApplicationDocumentsDirectory();
  final file = File('${output.path}/receipt.pdf');
  await file.writeAsBytes(await pdf.save());
}
