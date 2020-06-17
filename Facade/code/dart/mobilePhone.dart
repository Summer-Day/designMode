import 'camera.dart';
import 'cameraImpl.dart';
import 'phone.dart';
import 'phoneImpl.dart';

class mobilePhone {
  phone _phone = new phoneImpl();
  camera _camera = new cameraImpl();

  void dail() {
    _phone.dail();
  }

  void hangup() {
    _phone.hangup();
  }

  //视频电话
  void videoChat() {
    //打开视频
    _camera.open();
    //打开语音
    _phone.dail();
  }

  void takePicture() {
    _camera.open();
    _camera.takePicture();
  }

  void closeCamera() {
    _camera.close();
  }

}