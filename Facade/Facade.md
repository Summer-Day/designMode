## 定义：

要求子系统的外部与内部通信必须通过一个统一的对象进行。门面模式（Facad）提供一个高层次的接口，使子系统更容易使用。

## 举个🌰：
phone.dart
```dart
abstract class phone {
  //打电话
  void dail();
  //挂断
  void hangup();
}
```
phoneImpl.dart
```dart
import 'phone.dart';

class phoneImpl implements phone {
  @override
  void dail() {
    print("dail...");
  }

  @override
  void hangup() {
    print("hangup....");
  }

}
}
```
camera.dart
```dart
abstract class camera {
  //打开相机
  void open();
  //照相
  void takePicture();
  //关闭相机
  void close();
}
```
cameraImpl.dart
```dart
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

```
外观类  mobilePhone.dart
```dart
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
```
测试类 main.dart

```dart
import 'mobilePhone.dart';

main() {
  mobilePhone hw = new mobilePhone();
  hw.takePicture();
  hw.videoChat();

}
```

执行结果
```
open...
takePicture...
open...
dail...

```



## 优点：
1. 对外部隐藏子系统具体实现，减少外部对内部的耦合。

2. 外观列对子系统的封装，使外部系统更易于使用。

## 缺点：
1. 外部接口实现可能会比较膨胀，由于内部子系统所有接口都会由外观类统一暴露，导致外观类API接口较多，增加用户使用成本。

2. 外观类没有准寻开闭原则，当业务出现变更，可能需要修改外观类。