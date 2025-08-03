// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:mobile_scanner/mobile_scanner.dart';

class MultiBarcodeScanner extends StatefulWidget {
  const MultiBarcodeScanner({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<MultiBarcodeScanner> createState() => _MultiBarcodeScannerState();
}

class _MultiBarcodeScannerState extends State<MultiBarcodeScanner> {
  final MobileScannerController cameraController = MobileScannerController();
  final Set<String> scannedCodes = {};

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ======== الكاميرا ========
        SizedBox(
          width: widget.width ?? 300,
          height: widget.height ?? 300,
          child: Stack(
            children: [
              MobileScanner(
                controller: cameraController,
                onDetect: (capture) {
                  for (final barcode in capture.barcodes) {
                    final code = barcode.rawValue;
                    if (code != null && !scannedCodes.contains(code)) {
                      scannedCodes.add(code);

                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text('تم قراءة باركود'),
                          content: Text(code),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('تم'),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                },
              ),
              // ======== زرار الفلاش ========
              Positioned(
                top: 8,
                right: 8,
                child: ValueListenableBuilder<TorchState>(
                  valueListenable: cameraController.torchState,
                  builder: (context, state, child) {
                    return IconButton(
                      icon: Icon(
                        state == TorchState.off
                            ? Icons.flash_off
                            : Icons.flash_on,
                        color: state == TorchState.off
                            ? Colors.grey
                            : Colors.yellow,
                      ),
                      iconSize: 30,
                      onPressed: () => cameraController.toggleTorch(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),

        // ======== عدد الباركودات ========
        const SizedBox(height: 12),
        Text(
          'عدد الباركودات: ${scannedCodes.length}',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        // ======== عرض الأكواد ========
        const SizedBox(height: 8),
        Expanded(
          child: ListView(
            children: scannedCodes.map((code) => Text(code)).toList(),
          ),
        ),
      ],
    );
  }
}
