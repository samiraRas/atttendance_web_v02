// // To parse this JSON data, do
// //
// //     final attendanceDataModel = attendanceDataModelFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// List<AttendanceDataModel> attendanceDataModelFromJson(String str) =>
//     List<AttendanceDataModel>.from(
//         json.decode(str).map((x) => AttendanceDataModel.fromJson(x)));

// String attendanceDataModelToJson(List<AttendanceDataModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class AttendanceDataModel {
//   AttendanceDataModel({
//     required this.id,
//     required this.cid,
//     required this.poiId,
//     required this.userId,
//     required this.employeeId,
//     required this.attendanceDate,
//     required this.attendanceDateTime,
//     required this.employeeName,
//     required this.mobile,
//     required this.distance,
//     required this.lat,
//     required this.long,
//     required this.createdBy,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.v,
//   });

//   String id;
//   String cid;
//   List<PoiIdElement> poiId;
//   List<UserId> userId;
//   String employeeId;
//   DateTime attendanceDate;
//   DateTime attendanceDateTime;
//   String employeeName;
//   String mobile;
//   dynamic distance;
//   String lat;
//   String long;
//   String createdBy;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int v;

//   factory AttendanceDataModel.fromJson(Map<String, dynamic> json) =>
//       AttendanceDataModel(
//         id: json["_id"],
//         cid: json["cid"],
//         poiId: List<PoiIdElement>.from(
//             json["poiId"].map((x) => PoiIdElement.fromJson(x))),
//         userId:
//             List<UserId>.from(json["userId"].map((x) => UserId.fromJson(x))),
//         employeeId: json["employeeId"],
//         attendanceDate: DateTime.parse(json["attendanceDate"]),
//         attendanceDateTime: DateTime.parse(json["attendanceDateTime"]),
//         employeeName: json["employeeName"],
//         mobile: json["mobile"],
//         distance: json["distance"],
//         lat: json["lat"] == null ? null : json["lat"],
//         long: json["long"] == null ? null : json["long"],
//         createdBy: json["createdBy"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "cid": cid,
//         "poiId": List<dynamic>.from(poiId.map((x) => x.toJson())),
//         "userId": List<dynamic>.from(userId.map((x) => x.toJson())),
//         "employeeId": employeeId,
//         "attendanceDate": attendanceDate.toIso8601String(),
//         "attendanceDateTime": attendanceDateTime.toIso8601String(),
//         "employeeName": employeeName,
//         "mobile": mobile,
//         "distance": distance,
//         "lat": lat == null ? null : lat,
//         "long": long == null ? null : long,
//         "createdBy": createdBy,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "__v": v,
//       };
// }

// // enum Cid { SKF101 }

// // final cidValues = EnumValues({
// //     "skf101": Cid.SKF101
// // });

// // enum AtedBy { THE_6295_AF0204630_B43_F362330_B }

// // final atedByValues = EnumValues({
// //     "6295af0204630b43f362330b": AtedBy.THE_6295_AF0204630_B43_F362330_B
// // });

// // enum EmployeeId { SKF101_KARIM101, SKF101_RAHIM101 }

// // final employeeIdValues = EnumValues({
// //     "skf101-karim101": EmployeeId.SKF101_KARIM101,
// //     "skf101-rahim101": EmployeeId.SKF101_RAHIM101
// // });

// // enum EmployeeName { MUHAMMAD_KARIM, RAHIM_ALI }

// // final employeeNameValues = EnumValues({
// //     "Muhammad Karim": EmployeeName.MUHAMMAD_KARIM,
// //     "Rahim Ali": EmployeeName.RAHIM_ALI
// // });

// class PoiIdElement {
//   PoiIdElement({
//     required this.id,
//     required this.cid,
//     required this.poiId,
//     required this.poiType,
//     required this.union,
//     required this.thana,
//     required this.district,
//     required this.division,
//     required this.market,
//     required this.territory,
//     required this.area,
//     required this.region,
//     required this.zone,
//     required this.lat,
//     required this.long,
//     required this.v,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.createdBy,
//     required this.updatedBy,
//   });

//   String id;
//   String cid;
//   String poiId;
//   String poiType;
//   String union;
//   String thana;
//   String district;
//   String division;
//   String market;
//   String territory;
//   String area;
//   String region;
//   String zone;
//   String lat;
//   String long;
//   int v;
//   DateTime createdAt;
//   DateTime updatedAt;
//   String createdBy;
//   String updatedBy;

//   factory PoiIdElement.fromJson(Map<String, dynamic> json) => PoiIdElement(
//         id: json["_id"],
//         cid: json["cid"],
//         poiId: json["poiId"],
//         poiType: json["poiType"],
//         union: json["union"],
//         thana: json["thana"],
//         district: json["district"],
//         division: json["division"],
//         market: json["market"],
//         territory: json["territory"],
//         area: json["area"],
//         region: json["region"],
//         zone: json["zone"],
//         lat: json["lat"],
//         long: json["long"],
//         v: json["__v"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         createdBy: json["createdBy"],
//         updatedBy: json["updatedBy"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "cid": cid,
//         "poiId": poiId,
//         "poiType": poiType,
//         "union": union,
//         "thana": thana,
//         "district": district,
//         "division": division,
//         "market": market,
//         "territory": territory,
//         "area": area,
//         "region": region,
//         "zone": zone,
//         "lat": lat,
//         "long": long,
//         "__v": v,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "createdBy": createdBy,
//         "updatedBy": updatedBy,
//       };
// }

// // enum Area { MIRPUR }

// // final areaValues = EnumValues({
// //     "Mirpur": Area.MIRPUR
// // });

// // enum District { DHAKA }

// // final districtValues = EnumValues({
// //     "dhaka": District.DHAKA
// // });

// // enum PoiIdId { THE_62_A96_FAE4026826_CCA1_D707_F, THE_62_A96_FAE4026826_CCA1_D7080, THE_62_A96_FAE4026826_CCA1_D7081, THE_62_A96_FAE4026826_CCA1_D7082, THE_62_A96_FAE4026826_CCA1_D7083 }

// // final poiIdIdValues = EnumValues({
// //     "62a96fae4026826cca1d707f": PoiIdId.THE_62_A96_FAE4026826_CCA1_D707_F,
// //     "62a96fae4026826cca1d7080": PoiIdId.THE_62_A96_FAE4026826_CCA1_D7080,
// //     "62a96fae4026826cca1d7081": PoiIdId.THE_62_A96_FAE4026826_CCA1_D7081,
// //     "62a96fae4026826cca1d7082": PoiIdId.THE_62_A96_FAE4026826_CCA1_D7082,
// //     "62a96fae4026826cca1d7083": PoiIdId.THE_62_A96_FAE4026826_CCA1_D7083
// // });

// // enum Market { RUPNAGAR, MIRPUR_12, MIRPUR_11, MIRPUR_10, MIRPUR_2 }

// // final marketValues = EnumValues({
// //     "mirpur-10": Market.MIRPUR_10,
// //     "mirpur-11": Market.MIRPUR_11,
// //     "mirpur-12": Market.MIRPUR_12,
// //     "mirpur-2": Market.MIRPUR_2,
// //     "rupnagar": Market.RUPNAGAR
// // });

// // enum PoiIdEnum { SKF101_MIRPUR101, SKF101_MIRPUR102, SKF101_MIRPUR103, SKF101_MIRPUR104, SKF101_MIRPUR105 }

// // final poiIdEnumValues = EnumValues({
// //     "skf101-mirpur101": PoiIdEnum.SKF101_MIRPUR101,
// //     "skf101-mirpur102": PoiIdEnum.SKF101_MIRPUR102,
// //     "skf101-mirpur103": PoiIdEnum.SKF101_MIRPUR103,
// //     "skf101-mirpur104": PoiIdEnum.SKF101_MIRPUR104,
// //     "skf101-mirpur105": PoiIdEnum.SKF101_MIRPUR105
// // });

// // enum PoiType { HEADOFFICE }

// // final poiTypeValues = EnumValues({
// //     "headoffice": PoiType.HEADOFFICE
// // });

// // enum Region { DHAKA }

// // final regionValues = EnumValues({
// //     "Dhaka": Region.DHAKA
// // });

// // enum Thana { MIRPUR }

// // final thanaValues = EnumValues({
// //     "mirpur": Thana.MIRPUR
// // });

// // enum Zone { DHAKA_NORTH }

// // final zoneValues = EnumValues({
// //     "Dhaka North": Zone.DHAKA_NORTH
// // });

// class UserId {
//   UserId({
//     required this.id,
//     required this.cid,
//     required this.employeeId,
//     required this.employeeName,
//     required this.designation,
//     required this.password,
//     required this.mobile,
//     required this.email,
//     required this.restrictPoiUser,
//     required this.market,
//     required this.territory,
//     required this.area,
//     required this.region,
//     required this.zone,
//     required this.loginCount,
//     required this.v,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.createdBy,
//     required this.updatedBy,
//   });

//   String id;
//   String cid;
//   String employeeId;
//   String employeeName;
//   String designation;
//   String password;
//   String mobile;
//   String email;
//   bool restrictPoiUser;
//   String market;
//   String territory;
//   String area;
//   String region;
//   String zone;
//   int loginCount;
//   int v;
//   DateTime createdAt;
//   DateTime updatedAt;
//   String createdBy;
//   String updatedBy;

//   factory UserId.fromJson(Map<String, dynamic> json) => UserId(
//         id: json["_id"],
//         cid: json["cid"],
//         employeeId: json["employeeId"],
//         employeeName: json["employeeName"],
//         designation: json["designation"],
//         password: json["password"],
//         mobile: json["mobile"],
//         email: json["email"],
//         restrictPoiUser: json["restrictPoiUser"],
//         market: json["market"],
//         territory: json["territory"],
//         area: json["area"],
//         region: json["region"],
//         zone: json["zone"],
//         loginCount: json["loginCount"],
//         v: json["__v"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         createdBy: json["createdBy"],
//         updatedBy: json["updatedBy"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "cid": cid,
//         "employeeId": employeeId,
//         "employeeName": employeeName,
//         "designation": designation,
//         "password": password,
//         "mobile": mobile,
//         "email": email,
//         "restrictPoiUser": restrictPoiUser,
//         "market": market,
//         "territory": territory,
//         "area": area,
//         "region": region,
//         "zone": zone,
//         "loginCount": loginCount,
//         "__v": v,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "createdBy": createdBy,
//         "updatedBy": updatedBy,
//       };
// }

// enum Designation { SALES }

// final designationValues = EnumValues({
//     "Sales ": Designation.SALES
// });

// enum Email { KARIM_GMAILO_COM }

// final emailValues = EnumValues({
//     "karim@gmailo.com": Email.KARIM_GMAILO_COM
// });

// enum UserIdId { THE_62_A96_FB44026826_CCA1_D7090 }

// final userIdIdValues = EnumValues({
//     "62a96fb44026826cca1d7090": UserIdId.THE_62_A96_FB44026826_CCA1_D7090
// });

// enum Password { THE_2_A_100_UO_ZHBB_BD_BIH_RDN_AZ5_XS_OM6_GD3_I_B_ZBW_J_CYWX_R74_KQ4_Z_OH0_T2_F8_YW }

// final passwordValues = EnumValues({
//     "\u00242a\u002410\u00240.UOZhbbBdBihRDNAz5xsOM6Gd3iBZbwJCywxR74Kq4zOh0T2F8YW": Password.THE_2_A_100_UO_ZHBB_BD_BIH_RDN_AZ5_XS_OM6_GD3_I_B_ZBW_J_CYWX_R74_KQ4_Z_OH0_T2_F8_YW
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         if (reverseMap == null) {
//             reverseMap = map.map((k, v) => new MapEntry(v, k));
//         }
//         return reverseMap;
//     }
// }

// // To parse this JSON data, do
// //
// //     final attendanceDataModel = attendanceDataModelFromJson(jsonString);

// To parse this JSON data, do

//     final attendanceDataModel = attendanceDataModelFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// List<AttendanceDataModel> attendanceDataModelFromJson(String str) =>
//     List<AttendanceDataModel>.from(
//         json.decode(str).map((x) => AttendanceDataModel.fromJson(x)));

// String attendanceDataModelToJson(List<AttendanceDataModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class AttendanceDataModel {
//   AttendanceDataModel({
//     required this.id,
//     required this.cid,
//     required this.poiId,
//     required this.userId,
//     required this.employeeId,
//     required this.attendanceDate,
//     required this.attendanceDateTime,
//     required this.employeeName,
//     required this.mobile,
//     required this.distance,
//     required this.lat,
//     required this.long,
//     required this.createdBy,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.v,
//   });

//   String id;
//   String cid;
//   List<PoiId> poiId;
//   List<UserId> userId;
//   String employeeId;
//   DateTime attendanceDate;
//   DateTime attendanceDateTime;
//   String employeeName;
//   String mobile;
//   dynamic distance;
//   String lat;
//   String long;
//   String createdBy;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int v;

//   factory AttendanceDataModel.fromJson(Map<String, dynamic> json) =>
//       AttendanceDataModel(
//         id: json["_id"],
//         cid: json["cid"],
//         poiId: List<PoiId>.from(json["poiId"].map((x) => PoiId.fromJson(x))),
//         userId:
//             List<UserId>.from(json["userId"].map((x) => UserId.fromJson(x))),
//         employeeId: json["employeeId"],
//         attendanceDate: DateTime.parse(json["attendanceDate"]),
//         attendanceDateTime: DateTime.parse(json["attendanceDateTime"]),
//         employeeName: json["employeeName"],
//         mobile: json["mobile"],
//         distance: json["distance"],
//         lat: json["lat"],
//         long: json["long"],
//         createdBy: json["createdBy"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "cid": cid,
//         "poiId": List<dynamic>.from(poiId.map((x) => x.toJson())),
//         "userId": List<dynamic>.from(userId.map((x) => x.toJson())),
//         "employeeId": employeeId,
//         "attendanceDate": attendanceDate.toIso8601String(),
//         "attendanceDateTime": attendanceDateTime.toIso8601String(),
//         "employeeName": employeeName,
//         "mobile": mobile,
//         "distance": distance,
//         "lat": lat,
//         "long": long,
//         "createdBy": createdBy,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "__v": v,
//       };
// }

// class PoiId {
//   PoiId({
//     required this.id,
//     required this.cid,
//     required this.poiId,
//     required this.poiType,
//     required this.union,
//     required this.thana,
//     required this.district,
//     required this.division,
//     required this.market,
//     required this.territory,
//     required this.area,
//     required this.region,
//     required this.zone,
//     required this.lat,
//     required this.long,
//     required this.v,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.createdBy,
//   });

//   String id;
//   String cid;
//   String poiId;
//   String poiType;
//   String union;
//   String thana;
//   String district;
//   String division;
//   String market;
//   String territory;
//   String area;
//   String region;
//   String zone;
//   String lat;
//   String long;
//   int v;
//   DateTime createdAt;
//   DateTime updatedAt;
//   String createdBy;

//   factory PoiId.fromJson(Map<String, dynamic> json) => PoiId(
//         id: json["_id"],
//         cid: json["cid"],
//         poiId: json["poiId"],
//         poiType: json["poiType"],
//         union: json["union"],
//         thana: json["thana"],
//         district: json["district"],
//         division: json["division"],
//         market: json["market"],
//         territory: json["territory"],
//         area: json["area"],
//         region: json["region"],
//         zone: json["zone"],
//         lat: json["lat"],
//         long: json["long"],
//         v: json["__v"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         createdBy: json["createdBy"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "cid": cid,
//         "poiId": poiId,
//         "poiType": poiType,
//         "union": union,
//         "thana": thana,
//         "district": district,
//         "division": division,
//         "market": market,
//         "territory": territory,
//         "area": area,
//         "region": region,
//         "zone": zone,
//         "lat": lat,
//         "long": long,
//         "__v": v,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "createdBy": createdBy,
//       };
// }

// class UserId {
//   UserId({
//     required this.id,
//     required this.cid,
//     required this.employeeId,
//     required this.employeeName,
//     required this.designation,
//     required this.password,
//     required this.mobile,
//     required this.email,
//     required this.restrictPoiUser,
//     required this.market,
//     required this.territory,
//     required this.area,
//     required this.region,
//     required this.zone,
//     required this.loginCount,
//     required this.v,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.createdBy,
//   });

//   String id;
//   String cid;
//   String employeeId;
//   String employeeName;
//   String designation;
//   String password;
//   String mobile;
//   String email;
//   bool restrictPoiUser;
//   String market;
//   String territory;
//   String area;
//   String region;
//   String zone;
//   int loginCount;
//   int v;
//   DateTime createdAt;
//   DateTime updatedAt;
//   String createdBy;

//   factory UserId.fromJson(Map<String, dynamic> json) => UserId(
//         id: json["_id"],
//         cid: json["cid"],
//         employeeId: json["employeeId"],
//         employeeName: json["employeeName"],
//         designation: json["designation"],
//         password: json["password"],
//         mobile: json["mobile"],
//         email: json["email"],
//         restrictPoiUser: json["restrictPoiUser"],
//         market: json["market"],
//         territory: json["territory"],
//         area: json["area"],
//         region: json["region"],
//         zone: json["zone"],
//         loginCount: json["loginCount"],
//         v: json["__v"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         createdBy: json["createdBy"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "cid": cid,
//         "employeeId": employeeId,
//         "employeeName": employeeName,
//         "designation": designation,
//         "password": password,
//         "mobile": mobile,
//         "email": email,
//         "restrictPoiUser": restrictPoiUser,
//         "market": market,
//         "territory": territory,
//         "area": area,
//         "region": region,
//         "zone": zone,
//         "loginCount": loginCount,
//         "__v": v,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "createdBy": createdBy,
//       };
// }

import 'dart:convert';

List<AttendanceDataModel> attendanceDataModelFromJson(String str) =>
    List<AttendanceDataModel>.from(
        json.decode(str).map((x) => AttendanceDataModel.fromJson(x)));

String attendanceDataModelToJson(List<AttendanceDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AttendanceDataModel {
  AttendanceDataModel({
    required this.id,
    required this.cid,
    required this.poiId,
    required this.userId,
    required this.employeeId,
    required this.attendanceDate,
    required this.attendanceDateTime,
    required this.employeeName,
    required this.mobile,
    required this.distance,
    required this.lat,
    required this.long,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String cid;
  List<PoiId> poiId;
  List<UserId> userId;
  String employeeId;
  DateTime attendanceDate;
  DateTime attendanceDateTime;
  String employeeName;
  String mobile;
  dynamic distance;
  String lat;
  String long;
  String createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory AttendanceDataModel.fromJson(Map<String, dynamic> json) =>
      AttendanceDataModel(
        id: json["_id"],
        cid: json["cid"],
        poiId: List<PoiId>.from(json["poiId"].map((x) => PoiId.fromJson(x))),
        userId:
            List<UserId>.from(json["userId"].map((x) => UserId.fromJson(x))),
        employeeId: json["employeeId"],
        attendanceDate: DateTime.parse(json["attendanceDate"]),
        attendanceDateTime: DateTime.parse(json["attendanceDateTime"]),
        employeeName: json["employeeName"],
        mobile: json["mobile"],
        distance: json["distance"],
        lat: json["lat"],
        long: json["long"],
        createdBy: json["createdBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "cid": cid,
        "poiId": List<dynamic>.from(poiId.map((x) => x.toJson())),
        "userId": List<dynamic>.from(userId.map((x) => x.toJson())),
        "employeeId": employeeId,
        "attendanceDate": attendanceDate.toIso8601String(),
        "attendanceDateTime": attendanceDateTime.toIso8601String(),
        "employeeName": employeeName,
        "mobile": mobile,
        "distance": distance,
        "lat": lat,
        "long": long,
        "createdBy": createdBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class PoiId {
  PoiId({
    required this.id,
    required this.cid,
    required this.poiId,
    required this.poiType,
    required this.union,
    required this.thana,
    required this.district,
    required this.division,
    required this.market,
    required this.territory,
    required this.area,
    required this.region,
    required this.zone,
    required this.lat,
    required this.long,
    required this.v,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
  });

  String id;
  String cid;
  String poiId;
  String poiType;
  String union;
  String thana;
  String district;
  String division;
  String market;
  String territory;
  String area;
  String region;
  String zone;
  String lat;
  String long;
  int v;
  DateTime createdAt;
  DateTime updatedAt;
  String createdBy;

  factory PoiId.fromJson(Map<String, dynamic> json) => PoiId(
        id: json["_id"],
        cid: json["cid"],
        poiId: json["poiId"],
        poiType: json["poiType"],
        union: json["union"],
        thana: json["thana"],
        district: json["district"],
        division: json["division"],
        market: json["market"],
        territory: json["territory"],
        area: json["area"],
        region: json["region"],
        zone: json["zone"],
        lat: json["lat"],
        long: json["long"],
        v: json["__v"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "cid": cid,
        "poiId": poiId,
        "poiType": poiType,
        "union": union,
        "thana": thana,
        "district": district,
        "division": division,
        "market": market,
        "territory": territory,
        "area": area,
        "region": region,
        "zone": zone,
        "lat": lat,
        "long": long,
        "__v": v,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "createdBy": createdBy,
      };
}

class UserId {
  UserId({
    required this.id,
    required this.cid,
    required this.employeeId,
    required this.employeeName,
    required this.designation,
    required this.password,
    required this.mobile,
    required this.email,
    required this.restrictPoiUser,
    required this.market,
    required this.area,
    required this.region,
    required this.zone,
    required this.loginCount,
    required this.v,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    required this.territory,
    required this.updatedBy,
  });

  String id;
  String cid;
  String employeeId;
  String employeeName;
  String designation;
  String password;
  String mobile;
  String email;
  bool restrictPoiUser;
  String market;
  String area;
  String region;
  String zone;
  int loginCount;
  int v;
  DateTime createdAt;
  DateTime updatedAt;
  String createdBy;
  String territory;
  String updatedBy;

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        cid: json["cid"],
        employeeId: json["employeeId"],
        employeeName: json["employeeName"],
        designation: json["designation"],
        password: json["password"],
        mobile: json["mobile"],
        email: json["email"],
        restrictPoiUser: json["restrictPoiUser"],
        market: json["market"],
        area: json["area"],
        region: json["region"],
        zone: json["zone"],
        loginCount: json["loginCount"],
        v: json["__v"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        createdBy: json["createdBy"],
        territory: json["territory"],
        updatedBy: json["updatedBy"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "cid": cid,
        "employeeId": employeeId,
        "employeeName": employeeName,
        "designation": designation,
        "password": password,
        "mobile": mobile,
        "email": email,
        "restrictPoiUser": restrictPoiUser,
        "market": market,
        "area": area,
        "region": region,
        "zone": zone,
        "loginCount": loginCount,
        "__v": v,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "createdBy": createdBy,
        "territory": territory,
        "updatedBy": updatedBy,
      };
}


// // To parse this JSON data, do
// //
// //     final attendanceDataModel = attendanceDataModelFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// List<AttendanceDataModel> attendanceDataModelFromJson(String str) =>
//     List<AttendanceDataModel>.from(
//         json.decode(str).map((x) => AttendanceDataModel.fromJson(x)));

// String attendanceDataModelToJson(List<AttendanceDataModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class AttendanceDataModel {
//   AttendanceDataModel({
//     required this.id,
//     required this.cid,
//     required this.employeeId,
//     required this.attendanceDate,
//     required this.attendanceDateTime,
//     required this.employeeName,
//     required this.mobile,
//     required this.distance,
//     required this.lat,
//     required this.long,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.v,
//   });

//   String id;
//   String cid;
//   String employeeId;
//   DateTime attendanceDate;
//   DateTime attendanceDateTime;
//   String employeeName;
//   String mobile;
//   double distance;
//   String lat;
//   String long;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int v;

//   factory AttendanceDataModel.fromJson(Map<String, dynamic> json) =>
//       AttendanceDataModel(
//         id: json["_id"],
//         cid: json["cid"],
//         employeeId: json["employeeId"],
//         attendanceDate: DateTime.parse(json["attendanceDate"]),
//         attendanceDateTime: DateTime.parse(json["attendanceDateTime"]),
//         employeeName: json["employeeName"],
//         mobile: json["mobile"],
//         distance: json["distance"].toDouble(),
//         lat: json["lat"],
//         long: json["long"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "cid": cid,
//         "employeeId": employeeId,
//         "attendanceDate": attendanceDate.toIso8601String(),
//         "attendanceDateTime": attendanceDateTime.toIso8601String(),
//         "employeeName": employeeName,
//         "mobile": mobile,
//         "distance": distance,
//         "lat": lat,
//         "long": long,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "__v": v,
//       };
// }
