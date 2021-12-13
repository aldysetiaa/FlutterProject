Pengenalan Project :
Aplikasi ini untuk tes, dengan API response XML, proses ini dilakukan dengan XML2Json untuk konversi agar API diconsume dengan baik.

Sample APK :
- Folder APK / [Download](https://github.com/aldysetiaa/FlutterProject/blob/main/APK/)

Tampilan :

![alt text](https://github.com/aldysetiaa/FlutterProject/blob/main/APK/pic1.png)

![alt text](https://github.com/aldysetiaa/FlutterProject/blob/main/APK/pic2.png)

Requirement :
- Flutter SDK 2.8 / Null Safety (latest) 

Dependencies :

```
  http: ^0.13.4
  get: ^4.5.1
  cached_network_image: ^3.2.0
  dio: ^4.0.4
  xml2json: ^5.3.1
  flutter_staggered_grid_view: ^0.4.1
  basic_utils: ^3.9.1
  intl: ^0.17.0 
  shared_preferences: ^2.0.11
  easy_splash_screen: ^1.0.3
  ionicons: ^0.1.2

  ```

Cara install project di lokal PC :
1. Buka Android Studio 
2. Klik Menu File > Open > (Folder Project), Klik OK
3. Jika muncul Notif Warning/Error, ketik pada terminal :
```
flutter pub get
```
tunggu proses selesai, hal ini untuk menyesuakian package/dependencies,
pastikan koneksi internet lancar

setelah itu, untuk running aplikasi pada emulator, ketik perintah :
```
flutter run
```
untuk di export ke APK/Real Device (Debug), ketik perintah :
```
flutter build apk
```
dan jika sudah berhasil akan muncul file APK yang disimpan pada folder :
```
 Built build\app\outputs\flutter-apk\app-release.apk (size).
``` 

catatan : jika error ```homestead using password yes ```, modifikasi file .env bagian database user dan password dan sesuaikan dengan setingan server
