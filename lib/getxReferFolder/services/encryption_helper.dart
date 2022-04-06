// import 'dart:convert';
// import 'dart:typed_data';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:xml/xml.dart';

// class EncryptionHelper {
//   static const ENCRYPTION_KEY = "ewqJx8Ux4MM4SmH7YqOLfH05uC8iXLny";

//   static Future<String> encryptAes(String plainText) async {
//     String clientGuid = await CacheHelper.getClientGuidWithoutTime();

//     ByteBuffer buffer = new Int8List.fromList(Uint8List(16)).buffer;
//     ByteData byteData = new ByteData.view(buffer);

//     var cleanGuid = clientGuid.replaceAll("-", "");

//     var guid1 = int.tryParse("0x${cleanGuid.substring(0, 2)}") ?? 0;
//     var guid2 = int.tryParse("0x${cleanGuid.substring(2, 4)}") ?? 0;
//     var guid3 = int.tryParse("0x${cleanGuid.substring(4, 6)}") ?? 0;
//     var guid4 = int.tryParse("0x${cleanGuid.substring(6, 8)}") ?? 0;
//     var guid5 = int.tryParse("0x${cleanGuid.substring(8, 10)}") ?? 0;
//     var guid6 = int.tryParse("0x${cleanGuid.substring(10, 12)}") ?? 0;
//     var guid7 = int.tryParse("0x${cleanGuid.substring(12, 14)}") ?? 0;
//     var guid8 = int.tryParse("0x${cleanGuid.substring(14, 16)}") ?? 0;
//     var guid9 = int.tryParse("0x${cleanGuid.substring(16, 18)}") ?? 0;
//     var guid10 = int.tryParse("0x${cleanGuid.substring(18, 20)}") ?? 0;
//     var guid11 = int.tryParse("0x${cleanGuid.substring(20, 22)}") ?? 0;
//     var guid12 = int.tryParse("0x${cleanGuid.substring(22, 24)}") ?? 0;
//     var guid13 = int.tryParse("0x${cleanGuid.substring(24, 26)}") ?? 0;
//     var guid14 = int.tryParse("0x${cleanGuid.substring(26, 28)}") ?? 0;
//     var guid15 = int.tryParse("0x${cleanGuid.substring(28, 30)}") ?? 0;
//     var guid16 = int.tryParse("0x${cleanGuid.substring(30, 32)}") ?? 0;

//     byteData.setUint8(0, guid4);
//     byteData.setUint8(1, guid3);
//     byteData.setUint8(2, guid2);
//     byteData.setUint8(3, guid1);

//     byteData.setUint8(4, guid6);
//     byteData.setUint8(5, guid5);

//     byteData.setUint8(6, guid8);
//     byteData.setUint8(7, guid7);

//     byteData.setUint8(8, guid9);
//     byteData.setUint8(9, guid10);
//     byteData.setUint8(10, guid11);
//     byteData.setUint8(11, guid12);
//     byteData.setUint8(12, guid13);
//     byteData.setUint8(13, guid14);
//     byteData.setUint8(14, guid15);
//     byteData.setUint8(15, guid16);

//     final key = Key(buffer.asUint8List());
//     final iv = IV.fromSecureRandom(16);

//     final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
//     final encrypted = encrypter.encrypt(plainText, iv: iv);

//     return iv.base64 + "," + encrypted.base64;
//   }

//   static Future<String> encryptAES(String plainText, String encryptionKey) async {
//     final key = Key.fromUtf8(encryptionKey);
//     final iv = IV.fromSecureRandom(16);

//     final encrypter = Encrypter(AES(key));

//     final encrypted = encrypter.encrypt(plainText, iv: iv);
//     String encryptedWithIv = "${encrypted.base64},${iv.base64}";
//     return encryptedWithIv;
//   }

//   static Future<String?> decryptAES(String encryptedText, String encryptionKey) async {
//     var info = encryptedText.split(",");
//     if (info.length == 2) {
//       var encryptedInfo = info[0];
//       var encryptedIv = info[1];

//       final key = Key.fromUtf8(encryptionKey);
//       final iv = IV.fromBase64(encryptedIv);

//       final encrypter = Encrypter(AES(key));

//       Encrypted encrypted = Encrypted.fromBase64(encryptedInfo);
//       final decrypted = encrypter.decrypt(encrypted, iv: iv);
//       Utilities().logWhenDebug("decryptAES", "decrypted: $decrypted");
//       return decrypted;
//     }

//     return null;
//   }

//   static Future<String> encrypt(String plainText) async {
//     String tmpText = plainText.replaceAll("\\\"", "");
//     final publicPem = await rootBundle.loadString('assets/key/public_key.txt');
//     final publicKey = RSAKeyParser().parse(publicPem) as RSAPublicKey;

//     final encrypter = Encrypter(RSA(publicKey: publicKey));
//     Utilities().logWhenDebug("encrypt", "plainText == $tmpText");

//     final encrypted = encrypter.encrypt(plainText);
//     Utilities().logWhenDebug("encrypt", "encrypted == $encrypted.base64");
//     return encrypted.base64;
//   }

//   static Future<String> encryptRsa() async {
//     String clientGuid = "";
//     //Check whether clientGuid is available
//     var isAvailable = await CacheHelper.isKeyAvailable(CacheHelper.USER_GUID);
//     if (isAvailable) {
//       clientGuid = CacheHelper.getContentWithoutTime(CacheHelper.USER_GUID);
//     } else {
//       clientGuid = Utilities().getRandomUuid().toString();
//     }

//     final publicKey = getPublicKey();

//     final encrypter = Encrypter(RSA(publicKey: publicKey));

//     final encrypted = encrypter.encrypt(clientGuid);

//     Utilities().logWhenDebug("encryptRsa", encrypted.base64);

//     return encrypted.base64;
//   }

//   static RSAPublicKey getPublicKey() {
//     final document = XmlDocument.parse(getKeyXML());
//     var modulus = document.firstElementChild?.children[0].text;
//     var exponent = document.firstElementChild?.children[1].text;

//     var modulusBigInt = BigInt.parse(hex.encode(base64.decode(modulus ?? "")), radix: 16);
//     var exponentBigInt = BigInt.parse(hex.encode(base64.decode(exponent ?? "")), radix: 16);

//     RSAPublicKey bar = RSAPublicKey(modulusBigInt, exponentBigInt);
//     return bar;
//   }

//   static String getKeyXML() {
//     return "<RSAKeyValue><Modulus>yf5kshSefelDFXxhefn/V8nEivD6RfjNtG3BZFc4Pv3Tit41k22g8yhWRidoOjnN8vCc3AlFN//tsoHjYmvyet0BwuR6KuIhiZWf2u0ZMP3lbKWm+SYG89/ZLZEQrJNyt4idt/V6KKAcpJJ331OQWuRNzIosMs8J+A6iNjTwacs=</Modulus><Exponent>AQAB</Exponent></RSAKeyValue>";
//   }

//   static Future<String> encryptAESV2(String plainText, String clientId) async {
//     String aesKey = Utilities().getRandomUuid().replaceAll("-", "");
//     Utilities().logWhenDebug("encryptAESV2", "aesKey == $aesKey");
//     String ivKey = aesKey.substring(0, 16);
//     Utilities().logWhenDebug("encryptAESV2", "iv(Before) == $ivKey");

//     ivKey = clientId + ivKey.substring(clientId.length, 16);
//     Utilities().logWhenDebug("encryptAESV2", "iv(After) == $ivKey");

//     final key = Key.fromUtf8(aesKey);
//     final iv = IV.fromUtf8(ivKey);

//     final encrypter = Encrypter(AES(
//       key,
//       mode: AESMode.cbc,
//     ));

//     final encrypted = encrypter.encrypt(plainText, iv: iv);
//     final encryptedAesKey = await encryptRsaWithContent(aesKey);

//     String encryptedContent = "${encrypted.base64},${iv.base64},${encryptedAesKey}";
//     Utilities().logWhenDebug("encryptAESV2", "encrypted == $encryptedContent");

//     return encryptedContent;
//   }

//   static Future<String> decryptAESV2(String encryptedMessage) async {
//     var splitMsg = encryptedMessage.split(",");
//     if (splitMsg.length == 3) {
//       var aesEncryptedMsg = splitMsg[0];
//       var aesIv = splitMsg[1];
//       var rsaAesKey = splitMsg[2];

//       final iv = IV.fromBase64(aesIv);
//       final aesKey = await decryptRsaWithContent(rsaAesKey);
//       final key = Key.fromUtf8(aesKey);

//       final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

//       Encrypted encrypted = Encrypted.fromBase64(aesEncryptedMsg);
//       final decrypted = encrypter.decrypt(encrypted, iv: iv);
//       Utilities().logWhenDebug("decryptAESV2", decrypted);

//       return decrypted;
//     } else {
//       return "";
//     }
//   }

//   static Future<String> encryptRsaWithContent(String plainText) async {
//     // String tmpText = plainText.replaceAll("\\\"", "");
//     final publicPem = await rootBundle.loadString('assets/key/public_key_new.txt');
//     Utilities().logWhenDebug("encryptRsaWithContent", "key : ${publicPem}");
//     final publicKey = RSAKeyParser().parse(publicPem) as RSAPublicKey;

//     final encrypter = Encrypter(RSA(publicKey: publicKey, encoding: RSAEncoding.PKCS1));
//     Utilities().logWhenDebug("encryptRsaWithContent", "plainText : ${plainText}");

//     final encrypted = encrypter.encrypt(plainText);
//     Utilities().logWhenDebug("encryptRsaWithContent", "encrypted : ${encrypted.base64}");

//     return encrypted.base64;
//   }

//   static Future<String> decryptRsaWithContent(String encryptedText) async {
//     final privatePem = await rootBundle.loadString('assets/key/private_key_new.txt');
//     final privateKey = RSAKeyParser().parse(privatePem) as RSAPrivateKey;

//     final encrypter = Encrypter(RSA(privateKey: privateKey, encoding: RSAEncoding.PKCS1));
//     Utilities().logWhenDebug("encryptRsaWithContent", "encrypted : ${encryptedText}");

//     final decrypted = encrypter.decrypt(Encrypted.fromBase64(encryptedText));
//     Utilities().logWhenDebug("encryptRsaWithContent", "plainText : ${decrypted}");

//     return decrypted;
//   }
// }
