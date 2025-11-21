import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

// Variabel global untuk menyimpan daftar kamera yang tersedia
late List<CameraDescription> cameras;

// Panggil ini di main() sebelum runApp()
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const CameraApp());
}

class CameraApp extends StatelessWidget {
  const CameraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CameraScreen());
  }
}

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  late CameraDescription _selectedCamera; // Kamera yang sedang aktif
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    if (cameras.isNotEmpty) {
      // Inisialisasi awal dengan kamera belakang (index 0 seringkali kamera belakang)
      _selectedCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );
      _initializeCamera(_selectedCamera);
    }
  }

  // Fungsi untuk menginisialisasi controller kamera
  void _initializeCamera(CameraDescription camera) {
    // Buang controller sebelumnya jika ada
    _controller?.dispose();

    _controller = CameraController(
      camera,
      ResolutionPreset.medium,
      enableAudio: true,
    );

    // Inisialisasi dan simpan Future-nya
    _initializeControllerFuture = _controller!
        .initialize()
        .then((_) {
          if (!mounted) {
            return;
          }
          setState(() {
            _selectedCamera = camera;
          });
        })
        .catchError((Object e) {
          if (e is CameraException) {
            // Tangani error, misalnya izin ditolak
            debugPrint(
              'Error menginisialisasi kamera: ${e.code}\n${e.description}',
            );
          }
        });
  }

  // Fungsi untuk beralih kamera
  void _switchCamera() {
    if (cameras.length < 2) {
      return; // Tidak bisa beralih jika hanya ada satu kamera
    }

    // Cari kamera lain yang belum aktif
    final newCamera = cameras.firstWhere(
      (camera) => camera.lensDirection != _selectedCamera.lensDirection,
    );

    // Inisialisasi ulang dengan kamera yang baru
    _initializeCamera(newCamera);
  }

  @override
  void dispose() {
    // Pastikan controller dibuang saat widget dibuang
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Camera TP')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // Jika inisialisasi selesai, tampilkan preview
            return Stack(
              children: [
                // Pastikan CameraPreview memenuhi ruang yang tersedia
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: CameraPreview(_controller!),
                ),
                // Tombol Switch Camera di atas preview
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 50.0),
                    child: FloatingActionButton(
                      onPressed: _switchCamera,
                      child: const Icon(Icons.switch_camera),
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error Kamera: ${snapshot.error}"));
          } else {
            // Tampilkan loading indicator saat menunggu inisialisasi
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
