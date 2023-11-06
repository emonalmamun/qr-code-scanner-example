import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner_example/utils/my_qr_code_scanner/dialog/my_dialog.dart';

class QRViewExample extends StatefulWidget {
  static const String routeName = '/QRViewExample';
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    ///default design
    // return Scaffold(
    //   body: Column(
    //     children: <Widget>[
    //       Expanded(flex: 4, child: _buildQrView(context)),
    //       Expanded(
    //         flex: 1,
    //         child: FittedBox(
    //           fit: BoxFit.contain,
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             children: <Widget>[
    //               if (result != null)
    //                 Text('Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
    //               else
    //                 const Text('Scan a code'),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: <Widget>[
    //                   Container(
    //                     margin: const EdgeInsets.all(8),
    //                     child: ElevatedButton(
    //                         onPressed: () async {
    //                           await controller?.toggleFlash();
    //                           setState(() {});
    //                         },
    //                         child: FutureBuilder(
    //                           future: controller?.getFlashStatus(),
    //                           builder: (context, snapshot) {
    //                             return Text('Flash: ${snapshot.data}');
    //                           },
    //                         )),
    //                   ),
    //                   Container(
    //                     margin: const EdgeInsets.all(8),
    //                     child: ElevatedButton(
    //                         onPressed: () async {
    //                           await controller?.flipCamera();
    //                           setState(() {});
    //                         },
    //                         child: FutureBuilder(
    //                           future: controller?.getCameraInfo(),
    //                           builder: (context, snapshot) {
    //                             if (snapshot.data != null) {
    //                               return Text(
    //                                   'Camera facing ${describeEnum(snapshot.data!)}');
    //                             } else {
    //                               return const Text('loading');
    //                             }
    //                           },
    //                         )),
    //                   )
    //                 ],
    //               ),
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 crossAxisAlignment: CrossAxisAlignment.center,
    //                 children: <Widget>[
    //                   Container(
    //                     margin: const EdgeInsets.all(8),
    //                     child: ElevatedButton(
    //                       onPressed: () async {
    //                         await controller?.pauseCamera();
    //                       },
    //                       child: const Text('pause',
    //                           style: TextStyle(fontSize: 20)),
    //                     ),
    //                   ),
    //                   Container(
    //                     margin: const EdgeInsets.all(8),
    //                     child: ElevatedButton(
    //                       onPressed: () async {
    //                         await controller?.resumeCamera();
    //                       },
    //                       child: const Text('resume',
    //                           style: TextStyle(fontSize: 20)),
    //                     ),
    //                   )
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // );
    ///custom design
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children:[
          // Expanded(flex: 4, child: _buildQrView(context)),
          // Expanded(
          //   flex: 1,
          //   child: FittedBox(
          //     fit: BoxFit.contain,
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: <Widget>[
          //         if (result != null)
          //           Text('Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
          //         else
          //           const Text('Scan a code'),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: <Widget>[
          //             Container(
          //               margin: const EdgeInsets.all(8),
          //               child: ElevatedButton(
          //                   onPressed: () async {
          //                     await controller?.toggleFlash();
          //                     setState(() {});
          //                   },
          //                   child: FutureBuilder(
          //                     future: controller?.getFlashStatus(),
          //                     builder: (context, snapshot) {
          //                       return Text('Flash: ${snapshot.data}');
          //                     },
          //                   )),
          //             ),
          //             Container(
          //               margin: const EdgeInsets.all(8),
          //               child: ElevatedButton(
          //                   onPressed: () async {
          //                     await controller?.flipCamera();
          //                     setState(() {});
          //                   },
          //                   child: FutureBuilder(
          //                     future: controller?.getCameraInfo(),
          //                     builder: (context, snapshot) {
          //                       if (snapshot.data != null) {
          //                         return Text(
          //                             'Camera facing ${describeEnum(snapshot.data!)}');
          //                       } else {
          //                         return const Text('loading');
          //                       }
          //                     },
          //                   )),
          //             )
          //           ],
          //         ),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: <Widget>[
          //             Container(
          //               margin: const EdgeInsets.all(8),
          //               child: ElevatedButton(
          //                 onPressed: () async {
          //                   await controller?.pauseCamera();
          //                 },
          //                 child: const Text('pause',
          //                     style: TextStyle(fontSize: 20)),
          //               ),
          //             ),
          //             Container(
          //               margin: const EdgeInsets.all(8),
          //               child: ElevatedButton(
          //                 onPressed: () async {
          //                   await controller?.resumeCamera();
          //                 },
          //                 child: const Text('resume',
          //                     style: TextStyle(fontSize: 20)),
          //               ),
          //             )
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // )
          SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
            child: _buildQrView(context),
          ),
          Positioned(
            left: 20,
            bottom: 20,
            // child: ElevatedButton.icon(
            //     onPressed: () async {
            //       await controller?.toggleFlash();
            //       setState(() {});
            //     },
            //     icon: FutureBuilder(
            //       future: controller?.getFlashStatus(),
            //       builder: (context, snapshot) {
            //         return snapshot.data == false ? const Icon(Icons.flash_off) : const Icon(Icons.flash_on);
            //       },
            //     ),
            //     label: FutureBuilder(
            //       future: controller?.getFlashStatus(),
            //       builder: (context, snapshot) {
            //         //return Text('Flash: ${snapshot.data}');
            //         return snapshot.data == true ? const Text('Flash: On') : const Text('Flash: Off');
            //       },
            //     )
            // ),
            child: FutureBuilder(
              future: controller?.getCameraInfo(),
              builder: (context, snapshot){
                if(snapshot.data != null){
                  return describeEnum(snapshot.data!) == "back" ?
                  ElevatedButton.icon(
                      onPressed: () async {
                        await controller?.toggleFlash();
                        setState(() {});
                      },
                      icon: FutureBuilder(
                        future: controller?.getFlashStatus(),
                        builder: (context, snapshot) {
                          return snapshot.data == false ? const Icon(Icons.flash_off) : const Icon(Icons.flash_on);
                        },
                      ),
                      label: FutureBuilder(
                        future: controller?.getFlashStatus(),
                        builder: (context, snapshot) {
                          //return Text('Flash: ${snapshot.data}');
                          return snapshot.data == true ? const Text('Flash: On') : const Text('Flash: Off');
                        },
                      )
                  )
                    :
                  ElevatedButton.icon(
                      onPressed: null,
                      icon: FutureBuilder(
                        future: controller?.getFlashStatus(),
                        builder: (context, snapshot) {
                          return snapshot.data == false ? const Icon(Icons.flash_off) : const Icon(Icons.flash_on);
                        },
                      ),
                      label: FutureBuilder(
                        future: controller?.getFlashStatus(),
                        builder: (context, snapshot) {
                          //return Text('Flash: ${snapshot.data}');
                          return snapshot.data == true ? const Text('Flash: On') : const Text('Flash: Off');
                        },
                      )
                  );
                }else{
                  return const Text('loading');
                }
              },
            ),
          ),
          Positioned(
            right: 20,
            bottom: 20,
            child: ElevatedButton.icon(
                onPressed: () async {
                  await controller?.flipCamera();
                  setState(() {});
                },
                icon: FutureBuilder(
                  future: controller?.getCameraInfo(),
                  builder: (context, snapshot) {
                    //return snapshot.data == "back" ? const Icon(Icons.photo_camera_back) : const Icon(Icons.photo_camera_front);
                    if (snapshot.data != null) {
                      //return Text('Camera facing ${describeEnum(snapshot.data!)}');
                      return describeEnum(snapshot.data!) == "back" ? const Icon(Icons.photo_camera_back) : const Icon(Icons.photo_camera_front);
                    } else {
                      return const Text('loading');
                    }
                  },
                ),
                // label: FutureBuilder(
                //   future: controller?.getCameraInfo(),
                //   builder: (context, snapshot) {
                //     //return Text('Flash: ${snapshot.data}');
                //     return snapshot.data == 'front' ? const Text('Flash: front') : const Text('Flash: back');
                //   },
                // )
                label: FutureBuilder(
                future: controller?.getCameraInfo(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return Text('Camera facing ${describeEnum(snapshot.data!)}');
                  } else {
                    return const Text('loading');
              }
            },
          ),
            ),
          ),
          Positioned(
            top: 40,
            child: result != null ?
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}', style: const TextStyle(color: Colors.white),),
            )
                :
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Scan a code', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 250.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller){
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData){
      setState((){
        result = scanData;
        controller.pauseCamera();
      });

      MyDialog.dialog(context: context, result: result!.code,function: (){
        Navigator.of(context).pop();
        controller.resumeCamera();
      });

    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
