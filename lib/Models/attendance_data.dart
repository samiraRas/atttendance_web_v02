import 'dart:convert';

List<AttendanceDataModel> attendanceDataModelFromJson(String str) =>
    List<AttendanceDataModel>.from(
        json.decode(str).map((x) => AttendanceDataModel.fromJson(x)));

// String attendanceDataModelToJson(List<AttendanceDataModel> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AttendanceDataModel {
  AttendanceDataModel({
    required this.id,
    required this.cid,
    required this.poiId,
    required this.attendanceDate,
    required this.attendanceDateTime,
    required this.distance,
    required this.lat,
    required this.long,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.faceId,
    required this.employeeId,
    required this.employeeName,
    required this.mobile,
    required this.userId,
  });

  String id;
  String cid;
  List<PoiId> poiId;
  DateTime attendanceDate;
  DateTime attendanceDateTime;
  dynamic distance;
  String lat;
  String long;
  bool status;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String faceId;
  String employeeId;
  String employeeName;
  String mobile;
  UserId userId;

  factory AttendanceDataModel.fromJson(Map<String, dynamic> json) =>
      AttendanceDataModel(
        id: json["_id"] ?? "N/A",
        cid: json["cid"] ?? "N/A",
        poiId:
            List<PoiId>.from(json["poiId"].map((x) => PoiId.fromJson(x)) ?? []),
        attendanceDate:
            DateTime.parse(json["attendanceDate"] ?? DateTime.now()),
        attendanceDateTime:
            DateTime.parse(json["attendanceDateTime"] ?? DateTime.now()),
        distance: json["distance"] ?? "N/A",
        lat: json["lat"] ?? "N/A",
        long: json["long"] ?? "N/A",
        status: json["status"] ?? false,
        createdAt: DateTime.parse(json["createdAt"] ?? DateTime.now()),
        updatedAt: DateTime.parse(json["updatedAt"] ?? DateTime.now()),
        v: json["__v"] ?? 0,
        faceId: json["faceId"] ?? "N/A",
        employeeId: json["employeeId"] ?? "N/A",
        employeeName: json["employeeName"] ?? "N/A",
        mobile: json["mobile"] ?? "N/A",
        userId: UserId.fromJson(json["userId"] ?? {}),
      );
}

class PoiId {
  PoiId({
    required this.id,
    required this.cid,
    required this.poiId,
    required this.mobile,
    required this.password,
    required this.loginCount,
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
  String mobile;
  String password;
  int loginCount;
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
        id: json["_id"] ?? "N/A",
        cid: json["cid"] ?? "N/A",
        poiId: json["poiId"] ?? "N/A",
        mobile: json["mobile"] ?? "N/A",
        password: json["password"] ?? "N/A",
        loginCount: json["loginCount"] ?? 0,
        poiType: json["poiType"] ?? "N/A",
        union: json["union"] ?? "N/A",
        thana: json["thana"] ?? "N/A",
        district: json["district"] ?? "N/A",
        division: json["division"] ?? "N/A",
        market: json["market"] ?? "N/A",
        territory: json["territory"] ?? "N/A",
        area: json["area"] ?? "N/A",
        region: json["region"] ?? "N/A",
        zone: json["zone"] ?? "N/A",
        lat: json["lat"] ?? "N/A",
        long: json["long"] ?? "N/A",
        v: json["__v"] ?? "N/A",
        createdAt: DateTime.parse(json["createdAt"] ?? "N/A"),
        updatedAt: DateTime.parse(json["updatedAt"] ?? "N/A"),
        createdBy: json["createdBy"] ?? "N/A",
      );
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
    required this.territory,
    required this.area,
    required this.region,
    required this.zone,
    required this.loginCount,
    required this.v,
    required this.createdAt,
    required this.updatedAt,
    required this.personId,
    required this.persistedFaceId1,
    required this.persistedFaceId2,
    required this.persistedFaceId3,
    required this.persistedFaceId4,
    required this.persistedFaceId5,
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
  String territory;
  String area;
  String region;
  String zone;
  int loginCount;
  int v;
  DateTime createdAt;
  DateTime updatedAt;
  String personId;
  String persistedFaceId1;
  String persistedFaceId2;
  String persistedFaceId3;
  String persistedFaceId4;
  String persistedFaceId5;

  factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"] ?? "N/A",
        cid: json["cid"] ?? "N/A",
        employeeId: json["employeeId"] ?? "N/A",
        employeeName: json["employeeName"] ?? "N/A",
        designation: json["designation"] ?? "N/A",
        password: json["password"] ?? "N/A",
        mobile: json["mobile"] ?? "N/A",
        email: json["email"] ?? "N/A",
        restrictPoiUser: json["restrictPoiUser"] ?? "N/A",
        market: json["market"] ?? "N/A",
        territory: json["territory"] ?? "N/A",
        area: json["area"] ?? "N/A",
        region: json["region"] ?? "N/A",
        zone: json["zone"] ?? "N/A",
        loginCount: json["loginCount"] ?? "N/A",
        v: json["__v"] ?? "N/A",
        createdAt: DateTime.parse(json["createdAt"] ?? "N/A"),
        updatedAt: DateTime.parse(json["updatedAt"] ?? "N/A"),
        personId: json["personId"] ?? "N/A",
        persistedFaceId1: json["persistedFaceId1"] ?? "N/A",
        persistedFaceId2: json["persistedFaceId2"] ?? "N/A",
        persistedFaceId3: json["persistedFaceId3"] ?? "N/A",
        persistedFaceId4: json["persistedFaceId4"] ?? "N/A",
        persistedFaceId5: json["persistedFaceId5"] ?? "N/A",
      );
}
