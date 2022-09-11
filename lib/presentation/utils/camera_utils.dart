import 'package:camera/camera.dart';

class CameraUtil {
  // singleton constructor
  late final List<CameraDescription> cameras;
  late CameraController cameraController;
  int cam = 0;
  CameraUtil._() {}
  static CameraUtil instanse = CameraUtil._();
  static CameraUtil Instance() => instanse;

  Future<void> initCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(cameras[cam], ResolutionPreset.medium);
    cameraController.initialize();
  }
}
