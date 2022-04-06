// import 'package:juru_catalog/base/networking/api.dart';
// import 'package:juru_catalog/models/account/request_reset_pin_model.dart';
// import 'package:juru_catalog/models/account/set_otp_model.dart';
// import 'package:juru_catalog/models/account/update_pin_model.dart';
// import 'package:juru_catalog/models/account/update_profile_model.dart';
// import 'package:juru_catalog/models/account/verify_otp_model.dart';
// import 'package:juru_catalog/models/app/get_reference_data_model.dart';
// import 'package:juru_catalog/models/login_model.dart';
// import 'package:juru_catalog/models/merchant/get_client_payment_info_model.dart';
// import 'package:juru_catalog/models/merchant/get_merchant_payment_channel_model.dart';
// import 'package:juru_catalog/models/payment_gateway/authorize_request_model.dart';
// import 'package:juru_catalog/models/payment_gateway/encryptdata_model.dart';
// import 'package:juru_catalog/models/payment_gateway/get_merchant_name_and_logo_request_model.dart';
// import 'package:juru_catalog/models/payment_gateway/payment_gateway_request_payment_model.dart';
// import 'package:juru_catalog/models/payment_gateway/request_contact_info_model.dart';
// import 'package:juru_catalog/models/payment_gateway/request_payment_calculation_model.dart';
// import 'package:juru_catalog/models/payment_gateway/request_payment_intent_model.dart';
// import 'package:juru_catalog/models/payment_gateway/update_contact_info_model.dart';
// import 'package:juru_catalog/models/payment_gateway/verify_transaction_model.dart';
// import 'package:juru_catalog/models/request_otp_model.dart';
// import 'package:juru_catalog/models/reward/get_user_reward_for_current_merchant.dart';
// import 'package:juru_catalog/models/transaction/execute_transfer_model.dart';
// import 'package:juru_catalog/models/transaction/qb_request_top_up_model.dart';
// import 'package:juru_catalog/models/transaction/request_payment_info_model.dart';
// import 'package:juru_catalog/models/transaction/request_payment_model.dart';
// import 'package:juru_catalog/models/transaction/transaction_authorize_request_model.dart';
// import 'package:juru_catalog/models/transaction/verify_transaction_id_model.dart';
// import 'package:juru_catalog/models/user/get_user_balance_model.dart';
// import 'package:juru_catalog/models/user/get_user_profile_model.dart';
// import 'package:juru_catalog/utilities/cache_helper.dart';

// class Repositories {
//   ApiService _service = ApiService();

//   void getReferenceData(
//     GetReferenceDataRequestModel body,
//     String webPayment2DataModelToken, {
//     Function(GetReferenceDataResponseModel data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/App/getReferenceData",
//       body: getReferenceDataRequestModelToJson(body),
//       isEncrypted: true,
//       isEncryptedToken: webPayment2DataModelToken,
//       skipResultCheck: true,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(GetReferenceDataResponseModel.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void requestOtp(
//     RequestOtpRequest body, {
//     Function(RequestOtpResponse data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/Account/requestOTP",
//       body: requestOtpRequestToJson(body),
//       isEncrypted: false,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(RequestOtpResponse.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void login(
//     LoginRequest body, {
//     Function(LoginResponse data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/Account/login",
//       body: loginRequestToJson(body),
//       isEncrypted: false,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(LoginResponse.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void verifyTransactionId(
//     VerifyTransactionIdRequest body,
//     String webPayment2DataModelToken, {
//     String requestId = "",
//     Function(VerifyTransactionIdResponse data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/Transaction/verifyTransactionId",
//       body: verifyTransactionIdRequestToJson(body),
//       isEncrypted: true,
//       isEncryptedToken: webPayment2DataModelToken,
//       skipResultCheck: true,
//       requestId: requestId,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(VerifyTransactionIdResponse.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void verifyTransaction(
//     VerifyTransactionRequestModel body,
//     String webPayment2DataModelToken, {
//     Function(VerifyTransactionResponseModel data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/PaymentGateway/verifyTransaction",
//       body: verifyTransactionRequestModelToJson(body),
//       isEncrypted: true,
//       isEncryptedToken: webPayment2DataModelToken,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(VerifyTransactionResponseModel.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void getClientPaymentInfo(
//     GetClientPaymentInfoRequest body,
//     String webPayment2DataModelToken, {
//     String requestId = "",
//     Function(GetClientPaymentInfoResponse data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/Merchant/getClientPaymentInfo",
//       body: getClientPaymentInfoRequestToJson(body),
//       isEncrypted: true,
//       isEncryptedToken: webPayment2DataModelToken,
//       requestId: requestId,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(GetClientPaymentInfoResponse.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void requestPayMerchant(
//     RequestPayMerchantRequestModel body,
//     String webPayment2DataModelToken, {
//     Function(RequestPayMerchantResponseModel data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/Transaction/requestPayMerchant",
//       body: requestPayMerchantRequestModelToJson(body),
//       isEncrypted: true,
//       isEncryptedToken: webPayment2DataModelToken,
//       skipResultCheck: true,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(RequestPayMerchantResponseModel.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void executeRequest(
//     ExecuteRequestModel body,
//     String webPayment2DataModelToken, {
//     Function(ExecuteResponseModel data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/Transaction/executeRequest",
//       body: executeRequestModelToJson(body),
//       isEncrypted: true,
//       isEncryptedToken: webPayment2DataModelToken,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(ExecuteResponseModel.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void getUserBalance(
//     GetUserBalanceRequestModel body,
//     String webPayment2DataModelToken, {
//     Function(GetUserBalanceResponseModel data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/Account/getBalance",
//       body: getUserBalanceRequestModelToJson(body),
//       isEncrypted: true,
//       isEncryptedToken: webPayment2DataModelToken,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(GetUserBalanceResponseModel.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void qbRequestTopUp(
//     QbrequestTopUpRequestModel body,
//     String webPayment2DataModelToken, {
//     Function(QbrequestTopUpResponseModel data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/Transaction/qbrequestTopUp",
//       body: qbrequestTopUpRequestModelToJson(body),
//       isEncrypted: true,
//       isEncryptedToken: webPayment2DataModelToken,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(QbrequestTopUpResponseModel.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void requestPayment(
//     RequestPaymentRequestModel body,
//     String webPayment2DataModelToken, {
//     Function(RequestPaymentResponseModel data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/PaymentGateway/requestPayment",
//       body: requestPaymentRequestModelToJson(body),
//       isEncrypted: true,
//       isEncryptedToken: webPayment2DataModelToken,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(RequestPaymentResponseModel.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void authorizeRequest(
//     AuthorizeRequestRequestModel body,
//     String webPayment2DataModelToken, {
//     Function(AuthorizeRequestResponseModel data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/PaymentGateway/authorizeRequest",
//       body: authorizeRequestRequestModelToJson(body),
//       isEncrypted: true,
//       isEncryptedToken: webPayment2DataModelToken,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(AuthorizeRequestResponseModel.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void transactionAuthorizeRequest(
//     TransactionAuthorizeRequestModel body,
//     String webPayment2DataModelToken, {
//     Function(TransactionAuthorizeResponseModel data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/Transaction/authorizeRequest",
//       body: transactionAuthorizeRequestModelToJson(body),
//       isEncrypted: true,
//       isEncryptedToken: webPayment2DataModelToken,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(TransactionAuthorizeResponseModel.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void encryptData(
//     EncryptDataRequestModel body,
//     String webPayment2DataModelToken, {
//     Function(EncryptDataResponseModel data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/PaymentGateway/encryptedData",
//       body: encryptDataRequestModelToJson(body),
//       isEncrypted: true,
//       isEncryptedToken: webPayment2DataModelToken,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(EncryptDataResponseModel.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void requestPaymentCalculationForFeeAndTax(
//     RequestPaymentCalculationRequestModel body,
//     String webPayment2DataModelToken, {
//     Function(RequestPaymentCalculationResponseModel data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/PaymentGateway/requestPaymentCalculationForFeeAndTax",
//       body: requestPaymentCalculationRequestModelToJson(body),
//       isEncrypted: true,
//       isEncryptedToken: webPayment2DataModelToken,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(RequestPaymentCalculationResponseModel.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void getUserRewardForCurrentMerchant(
//     GetUserRewardForCurrentMerchantRequestModel body,
//     String webPayment2DataModelToken, {
//     Function(GetUserRewardForCurrentMerchantResponseModel data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/Reward/getUserRewardForCurrentMerchant",
//       body: getUserRewardForCurrentMerchantRequestModelToJson(body),
//       isEncrypted: true,
//       isEncryptedToken: webPayment2DataModelToken,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(GetUserRewardForCurrentMerchantResponseModel.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void requestPaymentInfo(
//     RequestPaymentInfoRequestModel body,
//     String webPayment2DataModelToken, {
//     Function(RequestPaymentInfoResponseModel data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/Transaction/requestPaymentInfo",
//       body: requestPaymentInfoRequestModelToJson(body),
//       isEncrypted: true,
//       isEncryptedToken: webPayment2DataModelToken,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(RequestPaymentInfoResponseModel.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void getProfile(
//     GetProfileRequestModel body,
//     String webPayment2DataModelToken, {
//     Function(GetProfileResponseModel data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/Account/getProfile",
//       body: getProfileRequestModelToJson(body),
//       isEncrypted: true,
//       isEncryptedToken: webPayment2DataModelToken,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(GetProfileResponseModel.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void updateProfile(
//     UpdateProfileRequestModel body,
//     String webPayment2DataModelToken, {
//     Function(UpdateProfileResponseModel data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/Account/updateProfile",
//       body: updateProfileRequestModelToJson(body),
//       isEncrypted: true,
//       isEncryptedToken: webPayment2DataModelToken,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(UpdateProfileResponseModel.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void updatePin(
//     UpdatePinRequestModel body,
//     String webPayment2DataModelToken, {
//     Function(UpdatePinResponseModel data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/Account/updatePin",
//       body: updatePinRequestModelToJson(body),
//       isEncrypted: true,
//       isEncryptedToken: webPayment2DataModelToken,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(UpdatePinResponseModel.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void requestResetPin(
//     RequestResetPinRequestModel body,
//     String webPayment2DataModelToken, {
//     Function(RequestResetPinResponseModel data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/Account/requestResetPIN",
//       body: requestResetPinRequestModelToJson(body),
//       isEncrypted: true,
//       isEncryptedToken: webPayment2DataModelToken,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(RequestResetPinResponseModel.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void getMerchantPaymentChannel(
//     GetMerchantPaymentChannelRequest body,
//     String webPayment2DataModelToken, {
//     Function(GetMerchantPaymentChannelResponse data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/Merchant/getMerchantPaymentChannel",
//       body: getMerchantPaymentChannelRequestToJson(body),
//       isEncrypted: true,
//       isEncryptedToken: webPayment2DataModelToken,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(GetMerchantPaymentChannelResponse.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void setOtp(
//     SetOtpRequestModel body,
//     String webPayment2DataModelToken, {
//     Function(SetOtpResponseModel data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/Account/setOtp",
//       body: setOtpRequestModelToJson(body),
//       isEncrypted: true,
//       isEncryptedToken: webPayment2DataModelToken,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(SetOtpResponseModel.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void verifyOtp(
//     VerifyOtpRequestModel body,
//     String webPayment2DataModelToken, {
//     Function(VerifyOtpResponseModel data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/Account/verityOtp",
//       body: verifyOtpRequestModelToJson(body),
//       isEncrypted: true,
//       isEncryptedToken: webPayment2DataModelToken,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(VerifyOtpResponseModel.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void requestPaymentIntent(
//     RequestPaymentIntentRequest body,
//     String? webPayment2DataModelToken, {
//     String requestId = "",
//     Function(RequestPaymentIntentResponse data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/PaymentGateway/requestPaymentIntent",
//       body: requestPaymentIntentRequestToJson(body),
//       isEncrypted: true,
//       isEncryptedToken: webPayment2DataModelToken,
//       skipResultCheck: true,
//       requestId: requestId,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(RequestPaymentIntentResponse.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void getMerchantNameAndLogo(
//     GetMerchantNameAndLogoRequestModel body,
//     String? webPayment2DataModelToken, {
//     String requestId = "",
//     Function(GetMerchantNameAndLogoResponseModel data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/PaymentGateway/getMerchantNameAndLogo",
//       body: getMerchantNameAndLogoRequestModelToJson(body),
//       isEncrypted: true,
//       isEncryptedToken: webPayment2DataModelToken,
//       skipResultCheck: true,
//       requestId: requestId,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(GetMerchantNameAndLogoResponseModel.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void requestContactInfo(
//     RequestPgContactInfoRequest body,
//     String? webPayment2DataModelToken, {
//     String requestId = "",
//     Function(RequestPgContactInfoResponse data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/PaymentGateway/requestPGContactInfo",
//       body: requestPgContactInfoRequestToJson(body),
//       isEncrypted: true,
//       isEncryptedToken: webPayment2DataModelToken,
//       skipResultCheck: true,
//       requestId: requestId,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(RequestPgContactInfoResponse.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }

//   void updateContactInfo(
//     UpdatePgContactInfoRequest body,
//     String? webPayment2DataModelToken, {
//     String requestId = "",
//     Function(UpdatePgContactInfoResponse data)? onSuccess,
//     Function(String error)? onError,
//     Function()? onLoginExpired,
//   }) {
//     _service.post(
//       endpoint: "api/PaymentGateway/updatePGContactInfo",
//       body: updatePgContactInfoRequestToJson(body),
//       isEncrypted: true,
//       isEncryptedToken: webPayment2DataModelToken,
//       skipResultCheck: true,
//       requestId: requestId,
//       onSuccess: (data) {
//         if (onSuccess != null) {
//           onSuccess(UpdatePgContactInfoResponse.fromJson(data));
//         }
//       },
//       onError: onError,
//       onLoginExpired: onLoginExpired,
//     );
//   }
// }
