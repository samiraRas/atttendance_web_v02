// import 'package:attendance_app/Services/api_call.dart';
// import 'package:attendance_app/Services/apis.dart';
// import 'package:flutter/material.dart';

// class deleteEmpPoi extends StatefulWidget {
//   const deleteEmpPoi({Key? key}) : super(key: key);

//   @override
//   State<deleteEmpPoi> createState() => _deleteEmpPoiState();
// }

// class _deleteEmpPoiState extends State<deleteEmpPoi> {
//   var rowsPerPage = "50";
//   var pageNumber = "1";
//   String token = "";

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: ApiCall().getAllEmployeePoi(token, rowsPerPage, pageNumber),
//      builder: (context, AsyncSnapshot snapshot) {
//         if (snapshot.data == null) {
//           return const Center(
//             child: Text("loading......"),
//           );
//         } else if (snapshot.hasData) {
//           // print('showing snapshot ${snapshot.data}');
//           data = snapshot.data as List<EmployeeDataModel>;
//           var a = widget.getFieldForceList(data);

//           // widget.getList(data);
//           // print('ki ki run korbo ${data}');
//           // print('getfieldForcelist $a');
//           return
//       }),
//     );
//   }
// }
