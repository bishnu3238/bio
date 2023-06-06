/*







/// TODO: packages
git token: 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;
uuid: ^3.0.7
http: ^0.13.5
intl: ^0.17.0
shimmer: ^2.0.0
provider: ^6.0.4
jwt_decoder: ^2.0.1
file_picker: ^5.2.4
url_launcher: ^6.1.7
google_fonts: ^4.0.4
fluttertoast: ^8.1.1
image_picker: ^0.8.6
firebase_core: ^2.2.0
firebase_auth: ^4.1.2
flutter_spinkit: ^5.1.0
connectivity_plus: ^3.0.3
flutter_screenutil: ^5.8.2
shared_preferences: ^2.0.17
firebase_messaging: ^14.6.1
flutter_easyloading: ^3.0.5
cached_network_image: ^3.2.3
font_awesome_flutter: ^10.3.0
syncfusion_flutter_datagrid: ^21.2.6 // table
flutter_local_notifications: ^13.0.0

 */

/// TODO: app/src/main/AndroidManifest.xml
/*
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
add below code

<uses-feature android:name="android.hardware.camera" />
    <uses-feature android:name="android.hardware.camera.autofocus" />
    <uses-permission android:name="android.permission.CHANGE_NETWORK_STATE" />
    <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />
    <uses-permission android:name="android.permission.QUERY_ALL_PACKAGES" />
    <uses-permission android:name="android.permission.ACCESS_WIFI_STATE" />
    <uses-permission android:name="android.permission.RECORD_AUDIO" />
    <uses-permission android:name="android.permission.INTERNET" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission android:name="android.permission.CAMERA" />
    <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
    <uses-permission android:name="android.permission.READ_PHONE_STATE" />
    <uses-permission android:name="android.permission.WAKE_LOCK" />
    <uses-permission android:name="android.permission.VIBRATE"/>
    <uses-permission android:name="android.permission.BLUETOOTH" android:maxSdkVersion="30" />
    <uses-permission android:name="android.permission.BLUETOOTH_ADMIN" android:maxSdkVersion="30" />


 and also add this

  <!-- Provide required visibility configuration for API level 30 and above -->
    <queries>
        <!-- Place inside the <queries> element. -->
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <category android:name="android.intent.category.BROWSABLE" />
            <data android:scheme="https" />
        </intent>
        <!-- If your app checks for SMS support -->
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <data android:scheme="sms" />
        </intent>
        <!-- If your app checks for call support -->
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <data android:scheme="tel" />
        </intent>
        <!-- If your app checks for whatsapp support -->
        <intent>
            <action android:name="android.intent.action.VIEW" />
            <data android:scheme="whatsapp" />
        </intent>
        <!-- If your app checks for email support -->
        <intent>
            <action android:name="android.intent.action.SEND" />
            <data android:mimeType="*/ /*"/> // TODO: remove one "*|*";
</intent>
</queries>

 */
