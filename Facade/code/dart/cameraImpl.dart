import 'camera.dart';

class cameraImpl implements camera {
  @override
  void close() {
    print("close...");
  }

  @override
  void open() {
    print("open...");
  }

  @override
  void takePicture() {
    print("takePicture...");
  }

}
