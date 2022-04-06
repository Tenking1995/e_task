// To parse this JSON data, do
//
//     final getMerchantsRequestModel = getMerchantsRequestModelFromJson(jsonString);

import 'dart:convert';

MerchantRequestModel getMerchantRequestModelFromJson(String str) =>
    MerchantRequestModel.fromJson(json.decode(str));

String getMerchantRequestModelToJson(MerchantRequestModel data) => json.encode(data.toJson());

class MerchantRequestModel {
  MerchantRequestModel({
    this.merchantId,
  });

  String? merchantId;

  factory MerchantRequestModel.fromJson(Map<String, dynamic> json) => MerchantRequestModel(
        merchantId: json["merchantId"],
      );

  Map<String, dynamic> toJson() => {
        "merchantId": merchantId,
      };
}

MerchantResponseModel getMerchantResponseModelFromJson(String str) =>
    MerchantResponseModel.fromJson(json.decode(str));

String getMerchantsResponseModelToJson(MerchantResponseModel data) => json.encode(data.toJson());

class MerchantResponseModel {
  MerchantResponseModel({
    this.merchantSummary,
    this.result,
    this.code,
    this.errorMessage,
    this.returnMessage,
  });

  MerchantSummary? merchantSummary;
  bool? result;
  String? code;
  String? errorMessage;
  String? returnMessage;

  factory MerchantResponseModel.fromJson(Map<String, dynamic> json) => MerchantResponseModel(
        merchantSummary: json["merchantSummary"] == null ? null : MerchantSummary.fromJson(json["merchantSummary"]),
        result: json["result"],
        code: json["code"],
        errorMessage: json["errorMessage"],
        returnMessage: json["returnMessage"],
      );

  Map<String, dynamic> toJson() => {
        "merchantSummary": merchantSummary?.toJson(),
        "result": result,
        "code": code,
        "errorMessage": errorMessage,
        "returnMessage": returnMessage,
      };
}

class MerchantSummary {
  MerchantSummary({
    this.userId,
    this.userCode,
    this.orgCode,
    this.type,
    this.subType,
    this.level,
    this.fullname,
    this.nativeFullname,
    this.tradingName,
    this.businessDescription,
    this.businessCategory,
    this.businessLogo,
    this.businessPhoto,
    this.telephoneNo,
    this.email,
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.postcode,
    this.country,
    this.longitude,
    this.latitude,
  });

  String? userId;
  String? userCode;
  String? orgCode;
  String? type;
  String? subType;
  int? level;
  String? fullname;
  String? nativeFullname;
  String? tradingName;
  String? businessDescription;
  String? businessCategory;
  String? businessLogo;
  String? businessPhoto;
  String? telephoneNo;
  String? email;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? postcode;
  String? country;
  double? longitude;
  double? latitude;

  factory MerchantSummary.fromJson(Map<String, dynamic> json) => MerchantSummary(
        userId: json["userId"],
        userCode: json["userCode"],
        orgCode: json["orgCode"],
        type: json["type"],
        subType: json["subType"],
        level: json["level"],
        fullname: json["fullname"],
        nativeFullname: json["nativeFullname"],
        tradingName: json["tradingName"],
        businessDescription: json["businessDescription"],
        businessCategory: json["businessCategory"],
        businessLogo: json["businessLogo"],
        businessPhoto: json["businessPhoto"],
        telephoneNo: json["telephoneNo"],
        email: json["email"],
        address1: json["address1"],
        address2: json["address2"],
        city: json["city"],
        state: json["state"],
        postcode: json["postcode"],
        country: json["country"],
        longitude: json["longitude"].toDouble(),
        latitude: json["latitude"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "userCode": userCode,
        "orgCode": orgCode,
        "type": type,
        "subType": subType,
        "level": level,
        "fullname": fullname,
        "nativeFullname": nativeFullname,
        "tradingName": tradingName,
        "businessDescription": businessDescription,
        "businessCategory": businessCategory,
        "businessLogo": businessLogo,
        "businessPhoto": businessPhoto,
        "telephoneNo": telephoneNo,
        "email": email,
        "address1": address1,
        "address2": address2,
        "city": city,
        "state": state,
        "postcode": postcode,
        "country": country,
        "longitude": longitude,
        "latitude": latitude,
      };
}
