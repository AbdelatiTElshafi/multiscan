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
    return SizedBox(
      width: widget.width ?? 300,
      height: widget.height ?? 300,
      child: Stack(
        children: [
          // ======== الكاميرا ========
          MobileScanner(
            controller: cameraController,
            onDetect: (capture) {
              for (final barcode in capture.barcodes) {
                final code = barcode.rawValue;
                if (code != null && !scannedCodes.contains(code)) {
                  setState(() {
                    scannedCodes.add(code);
                  });
                  debugPrint('Barcode: $code');
                }
              }
            },
          ),

          // ======== زر الفلاش في الأعلى يمين ========
          Positioned(
            top: 8,
            right: 8,
            child: ValueListenableBuilder<TorchState>(
              valueListenable: cameraController.torchState,
              builder: (context, state, child) {
                return IconButton(
                  icon: Icon(
                    state == TorchState.off ? Icons.flash_off : Icons.flash_on,
                    color:
                        state == TorchState.off ? Colors.grey : Colors.yellow,
                  ),
                  iconSize: 30,
                  onPressed: () => cameraController.toggleTorch(),
                );
              },
            ),
          ),

          // ======== عداد الأكواد في الأسفل يسار ========
          Positioned(
            bottom: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.qr_code, color: Colors.white, size: 20),
                  const SizedBox(width: 6),
                  Text(
                    '${scannedCodes.length}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
