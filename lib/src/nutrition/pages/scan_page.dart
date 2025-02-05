// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:camera/camera.dart';
// import 'package:my_total_fit/src/common/constents/app_images.dart';
// import 'package:my_total_fit/src/common/global_veriable.dart';
// import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
//
// class ScanScreen extends StatefulWidget {
//   const ScanScreen({super.key});
//
//   @override
//   _ScanScreenState createState() => _ScanScreenState();
// }
//
// class _ScanScreenState extends State<ScanScreen> {
//   XFile? _image;
//   bool _isCameraMode = true; // Default mode
//   bool _isQRScannerMode = true; // Default to QR Scanner
//   String _activeContainer = 'Scan Food'; // Tracks the active button
//   CameraController? _cameraController;
//   List<CameraDescription>? _cameras;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeCamera();
//   }
//
//   Future<void> _initializeCamera() async {
//     _cameras = await availableCameras();
//
//     if (_cameras != null && _cameras!.isNotEmpty) {
//       _cameraController = CameraController(
//         _cameras![0],
//         ResolutionPreset.medium,
//       );
//       await _cameraController?.initialize();
//       if (mounted) {
//         setState(() {});
//       }
//     }
//   }
//
//   void openCamera(String title) {
//     setState(() {
//       _isCameraMode = true;
//       _isQRScannerMode = true;
//       _image = null;
//       _activeContainer = title; // Update active container
//     });
//     _initializeCamera();
//   }
//
//   void openGallery() async {
//     final ImagePicker _picker = ImagePicker();
//     final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//
//     if (image != null) {
//       setState(() {
//         _image = image;
//         _isCameraMode = false;
//         _isQRScannerMode = false;
//         _activeContainer = 'Gallery'; // Update active container
//       });
//     } else {
//       print("No image selected.");
//     }
//   }
//
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   Barcode? result;
//   QRViewController? controller;
//
//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     _cameraController?.dispose();
//     controller?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: const BorderRadius.only(
//         topLeft: Radius.circular(20),
//         topRight: Radius.circular(20),
//       ),
//       child: Stack(
//         fit: StackFit.expand,
//         children: [
//           // QR Scanner with Camera
//           if (_isCameraMode && _cameraController?.value.isInitialized == true)
//             Stack(
//               children: [
//                 CameraPreview(_cameraController!),
//                 if (_isQRScannerMode)
//                   QRView(
//                     key: qrKey,
//                     onQRViewCreated: _onQRViewCreated,
//                     overlay: QrScannerOverlayShape(
//                       borderColor: Colors.red,
//                       borderRadius: 10,
//                       borderLength: 30,
//                       borderWidth: 10,
//                       cutOutSize: MediaQuery.of(context).size.width * 0.8,
//                     ),
//                   ),
//               ],
//             ),
//           // Image from Gallery
//           if (!_isCameraMode && _image != null)
//             Image.file(
//               File(_image!.path),
//               fit: BoxFit.cover,
//             ),
//           // Top Actions
//           Positioned(
//             top: 8,
//             left: 15,
//             right: 15,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CircleAvatar(
//                   radius: 16,
//                   backgroundColor: Colors.black.withOpacity(0.5),
//                   child: IconButton(
//                     icon: const Icon(Icons.close, color: Colors.white, size: 20),
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                 ),
//                 CircleAvatar(
//                   radius: 16,
//                   backgroundColor: Colors.black.withOpacity(0.5),
//                   child: const Icon(Icons.question_mark, color: Colors.white, size: 20),
//                 ),
//               ],
//             ),
//           ),
//           // Bottom Action Buttons
//           Positioned(
//             bottom: 20,
//             left: 15,
//             right: 15,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 customContainer(
//                   context,
//                   icon: AppIcons.scanIcon,
//                   title: 'Scan Food',
//                   isActive: _activeContainer == 'Scan Food',
//                   onTap: () => openCamera('Scan Food'),
//                 ),
//                 customContainer(
//                   context,
//                   icon: AppIcons.barCodeIcon,
//                   title: 'Bar Food',
//                   isActive: _activeContainer == 'Bar Food',
//                   onTap: () => openCamera('Bar Food'),
//                 ),
//                 customContainer(
//                   context,
//                   icon: AppIcons.labelsIcon,
//                   title: 'Labels',
//                   isActive: _activeContainer == 'Labels',
//                   onTap: () => openCamera('Labels'),
//                 ),
//                 customContainer(
//                   context,
//                   icon: AppIcons.galleryIcon,
//                   title: 'Gallery',
//                   isActive: _activeContainer == 'Gallery',
//                   onTap: openGallery,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget customContainer(BuildContext context,
//       {required String icon,
//         required String title,
//         required bool isActive,
//         required VoidCallback onTap}) {
//     return InkWell(
//       onTap: onTap,
//       child: Container(
//         height: 91,
//         width: 75,
//         decoration: BoxDecoration(
//           color: colorScheme(context).outlineVariant.withOpacity(0.3),
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(
//             color: isActive ? Colors.red : Colors.transparent,
//             width: 2,
//           ),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SvgPicture.asset(icon),
//             const SizedBox(height: 10),
//             Text(
//               title,
//               style: const TextStyle(fontSize: 12),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';
import 'package:my_total_fit/src/common/constents/app_images.dart';
import 'package:my_total_fit/src/common/global_veriable.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  XFile? _image;
  bool _isCameraMode = true;
  String _activeContainer = '';
  CameraController? _cameraController;
  List<CameraDescription>? _cameras;

  simpleBarCode()async{
    String? res = await SimpleBarcodeScanner.scanBarcode(
      context,
      barcodeAppBar: const BarcodeAppBar(
        appBarTitle: 'Test',
        centerTitle: false,
        enableBackButton: true,
        backButtonIcon: Icon(Icons.arrow_back_ios),
      ),
      isShowFlashIcon: true,
      delayMillis: 2000,
      cameraFace: CameraFace.back,
    );
    setState(() {
      result = res as String;
    });
  }


  // Future<void> _initializeCamera() async {
  //   _cameras = await availableCameras();
  //
  //   if (_cameras != null && _cameras!.isNotEmpty) {
  //     _cameraController = CameraController(
  //       _cameras![0],
  //       ResolutionPreset.medium,
  //     );
  //     await _cameraController?.initialize();
  //     if (mounted) {
  //       setState(() {});
  //     }
  //   }
  // }

  // void openCamera(String title) {
  //   setState(() {
  //     _isCameraMode = true;
  //     _image = null;
  //     _activeContainer = title; // Update active container
  //   });
  //   _initializeCamera();
  // }
  //
  void openGallery() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = image;
        _isCameraMode = false;
        _activeContainer = 'Gallery'; // Update active container
      });
    } else {
      print("No image selected.");
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  String result = '';

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Center(child: Text(result,style: textTheme(context).titleMedium?.copyWith(letterSpacing: 0,fontWeight: FontWeight.w600),)),
          // Camera Mode
          if (_isCameraMode && _cameraController?.value.isInitialized == true)
            CameraPreview(_cameraController!),

          // Image from Gallery
          if (!_isCameraMode && _image != null)
            Image.file(
              File(_image!.path),
              fit: BoxFit.cover,
            ),
          // Top Actions
          Positioned(
            top: 8,
            left: 15,
            right: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white, size: 20),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                CircleAvatar(
                  radius: 16,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: const Icon(Icons.question_mark, color: Colors.white, size: 20),
                ),
              ],
            ),
          ),
          // Bottom Action Buttons
          Positioned(
            bottom: 20,
            left: 15,
            right: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                customContainer(
                  context,
                  icon: AppIcons.scanIcon,
                  title: 'Scan Food',
                  isActive: _activeContainer == 'Scan Food',
                  onTap: () {
                    simpleBarCode();
                  },
                ),
                customContainer(
                  context,
                  icon: AppIcons.barCodeIcon,
                  title: 'Bar Food',
                  isActive: _activeContainer == 'Bar Food',
                  onTap: () {
                    simpleBarCode();
                  },
                ),
                customContainer(
                  context,
                  icon: AppIcons.labelsIcon,
                  title: 'Labels',
                  isActive: _activeContainer == 'Labels',
                  onTap: () {

                  },
                ),
                customContainer(
                  context,
                  icon: AppIcons.galleryIcon,
                  title: 'Gallery',
                  isActive: _activeContainer == 'Gallery',
                  onTap: openGallery,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget customContainer(BuildContext context,
      {required String icon,
        required String title,
        required bool isActive,
        required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 91,
        width: 75,
        decoration: BoxDecoration(
          color: colorScheme(context).outlineVariant.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isActive ? Colors.red : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(icon),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
