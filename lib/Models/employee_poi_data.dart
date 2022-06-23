// // To parse this JSON data, do
// //
// //     final empPoiDataModel = empPoiDataModelFromJson(jsonString);

// import 'package:meta/meta.dart';
// import 'dart:convert';

// List<EmpPoiDataModel> empPoiDataModelFromJson(String str) =>
//     List<EmpPoiDataModel>.from(
//         json.decode(str).map((x) => EmpPoiDataModel.fromJson(x)));

// String empPoiDataModelToJson(List<EmpPoiDataModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class EmpPoiDataModel {
//   EmpPoiDataModel({
//     required this.id,
//     required this.cid,
//     required this.employeeId,
//     required this.poiIds,
//     required this.createdBy,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.v,
//   });

//   String id;
//   String cid;
//   String employeeId;
//   List<PoiId> poiIds;
//   String createdBy;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int v;

//   factory EmpPoiDataModel.fromJson(Map<String, dynamic> json) =>
//       EmpPoiDataModel(
//         id: json["_id"],
//         cid: json["cid"],
//         employeeId: json["employeeId"],
//         poiIds: List<PoiId>.from(json["poiIds"].map((x) => PoiId.fromJson(x))),
//         createdBy: json["createdBy"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//         v: json["__v"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "cid": cid,
//         "employeeId": employeeId,
//         "poiIds": List<dynamic>.from(poiIds.map((x) => x.toJson())),
//         "createdBy": createdBy,
//         "createdAt": createdAt.toIso8601String(),
//         "updatedAt": updatedAt.toIso8601String(),
//         "__v": v,
//       };
// }

// class PoiId {
//   PoiId({
//     required this.poiId,
//     required this.lat,
//     required this.long,
//     required this.id,
//   });

//   String poiId;
//   String lat;
//   String long;
//   String id;

//   factory PoiId.fromJson(Map<String, dynamic> json) => PoiId(
//         poiId: json["poiId"],
//         lat: json["lat"],
//         long: json["long"],
//         id: json["_id"],
//       );

//   Map<String, dynamic> toJson() => {
//         "poiId": poiId,
//         "lat": lat,
//         "long": long,
//         "_id": id,
//       };
// }
// To parse this JSON data, do
//
//     final empPoiDataModel = empPoiDataModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<EmpPoiDataModel> empPoiDataModelFromJson(String str) =>
    List<EmpPoiDataModel>.from(
        json.decode(str).map((x) => EmpPoiDataModel.fromJson(x)));

String empPoiDataModelToJson(List<EmpPoiDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmpPoiDataModel {
  EmpPoiDataModel({
    required this.id,
    required this.cid,
    required this.employeeId,
    required this.employeeObjId,
    required this.poiIds,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String cid;
  String employeeId;
  String employeeObjId;
  List<PoiId> poiIds;
  String createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory EmpPoiDataModel.fromJson(Map<String, dynamic> json) =>
      EmpPoiDataModel(
        id: json["_id"],
        cid: json["cid"],
        employeeId: json["employeeId"],
        employeeObjId: json["employeeObjId"],
        poiIds: List<PoiId>.from(
            json["poiIds"].map((x) => x == null ? null : PoiId.fromJson(x))),
        createdBy: json["createdBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "cid": cid,
        "employeeId": employeeId,
        "employeeObjId": employeeObjId,
        "poiIds": List<dynamic>.from(
            poiIds.map((x) => x == null ? null : x.toJson())),
        "createdBy": createdBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}

class PoiId {
  PoiId({
    required this.poiId,
    required this.lat,
    required this.long,
    required this.id,
  });

  String poiId;
  String lat;
  String long;
  String id;

  factory PoiId.fromJson(Map<String, dynamic> json) => PoiId(
        poiId: json["poiId"],
        lat: json["lat"],
        long: json["long"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "poiId": poiId,
        "lat": lat,
        "long": long,
        "_id": id,
      };
}
