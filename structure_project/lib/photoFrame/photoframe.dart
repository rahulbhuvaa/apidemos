

// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:photo_view/photo_view.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

File? backgroundImage;
ScreenshotController screenshotController = ScreenshotController();
bool isStorage = false;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

Future<bool> checkHealthPermissionAndroid() async {
  bool isHealthPermissionAccepted = false;

  bool checkHealth = await Permission.storage.isGranted;

  List<Permission> permissions = [];

  if (!checkHealth) {
    permissions.add(Permission.storage);
  }

  if (permissions.isNotEmpty) {
    Map<Permission, PermissionStatus> statuses = await permissions.request();
    log("PERMISSION STORAGE $statuses");
    if (statuses.containsValue(PermissionStatus.denied) || statuses.containsValue(PermissionStatus.permanentlyDenied)) {
      isHealthPermissionAccepted = false;
    } else {
      isHealthPermissionAccepted = true;
    }
  } else {
    isHealthPermissionAccepted = true;
  }

  return isHealthPermissionAccepted;
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Zoomable Image',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HOMESCREEN());
  }
}

class HOMESCREEN extends StatefulWidget {
  const HOMESCREEN({super.key});

  @override
  State<HOMESCREEN> createState() => _HOMESCREENState();
}

class _HOMESCREENState extends State<HOMESCREEN> {
  Future<void> pickBackgroundImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        backgroundImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Zoomable Image'),
        actions: [
          IconButton(
            onPressed: () async {
              isStorage = await checkHealthPermissionAndroid();
              log("PERMISSION STORAGE $isStorage");
              if (isStorage) {
                pickBackgroundImage();
              }
            },
            icon: const Icon(Icons.add),
          ),
          IconButton(
            onPressed: () async {
              final directory = await getTemporaryDirectory();
              final imagePath = "${directory.path}/frame.jpg";
              screenshotController.captureAndSave(imagePath).then((value) {
                log("IMAGE $value");
                return Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FinalScreen(bytes: value!),
                    ));
              });
            },
            icon: const Icon(Icons.save_as),
          )
        ],
      ),
      body: Center(
        child: ZoomableImageWidget(
          imageUrl: backgroundImage ?? File("path"),
        ),
      ),
    );
  }
}

class ZoomableImageWidget extends StatefulWidget {
  final File imageUrl;

  const ZoomableImageWidget({
    required this.imageUrl,
  });

  @override
  _ZoomableImageWidgetState createState() => _ZoomableImageWidgetState();
}

class _ZoomableImageWidgetState extends State<ZoomableImageWidget> {
  Matrix4 _transformationMatrix = Matrix4.identity();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: MatrixGestureDetector(
        onMatrixUpdate: (
          Matrix4 matrix,
          Matrix4 translationDeltaMatrix,
          Matrix4 scaleDeltaMatrix,
          Matrix4 rotationDeltaMatrix,
        ) {
          setState(() {
            _transformationMatrix = matrix;
          });
        },
        child: Screenshot(
          controller: screenshotController,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (backgroundImage != null)
                Transform(
                  transform: _transformationMatrix,
                  child: Container(
                    height: 200,
                    width: 200,
                    alignment: Alignment.center,
                    child: PhotoView(
                      enablePanAlways: true,
                      imageProvider: FileImage(widget.imageUrl),
                      heroAttributes: PhotoViewHeroAttributes(tag: widget.imageUrl),
                      customSize: MediaQuery.of(context).size,
                      initialScale: PhotoViewComputedScale.contained,
                      minScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.covered * 2,
                      basePosition: Alignment.center,
                      backgroundDecoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                ),
              GestureDetector(
                onDoubleTap: () {
                  setState(() {
                    _transformationMatrix = Matrix4.identity();
                  });
                },
                child: Image.asset(
                  "assert/Template-02.png",
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FinalScreen extends StatefulWidget {
  String bytes;
  FinalScreen({super.key, required this.bytes});

  @override
  State<FinalScreen> createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Share.shareXFiles([XFile(widget.bytes)]);
        },
      ),
      body: Center(child: Image.file(File(widget.bytes))),
    );
  }
}
