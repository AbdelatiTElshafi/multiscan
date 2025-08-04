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
    super.key,
    this.width,
    this.height,
    this.onSubmit,
    this.onScanAction,
  });

  final double? width;
  final double? height;
  final Future<void> Function()? onSubmit;

  /// Action triggered every time a new scan is added
  final Future<void> Function(List<String> scannedCodes)? onScanAction;

  @override
  State<MultiBarcodeScanner> createState() => _MultiBarcodeScannerState();
}

class _MultiBarcodeScannerState extends State<MultiBarcodeScanner> {
  final MobileScannerController cameraController = MobileScannerController();
  final List<String> scannedCodes = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: Stack(
        children: [
          /// ✅ الكاميرا
          MobileScanner(
            controller: cameraController,
            onDetect: (capture) {
              final barcodes = capture.barcodes;
              for (final barcode in barcodes) {
                final code = barcode.rawValue ?? '';
                if (code.isNotEmpty && !scannedCodes.contains(code)) {
                  setState(() {
                    scannedCodes.add(code);
                  });

                  /// ✅ Call onScanAction
                  if (widget.onScanAction != null) {
                    widget.onScanAction!(List.from(scannedCodes));
                  }
                }
              }
            },
          ),

          /// ✅ زرار الفلاش
          Positioned(
            top: 16,
            right: 16,
            child: IconButton(
              icon: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, state, _) {
                  return Icon(
                    state == TorchState.on ? Icons.flash_on : Icons.flash_off,
                    color: state == TorchState.on ? Colors.yellow : Colors.grey,
                  );
                },
              ),
              onPressed: () => cameraController.toggleTorch(),
            ),
          ),

          /// ✅ عدد الأكواد على الشمال تحت
          Positioned(
            bottom: 16,
            left: 16,
            child: Row(
              children: [
                const Icon(Icons.qr_code, color: Colors.white),
                const SizedBox(width: 6),
                Text(
                  '${scannedCodes.length}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          /// ✅ زرار صح على اليمين تحت
          Positioned(
            bottom: 16,
            right: 16,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(14),
                backgroundColor: Colors.green,
              ),
              onPressed: () async {
                if (widget.onSubmit != null) {
                  await widget.onSubmit!();
                }
              },
              child: const Icon(Icons.check, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
