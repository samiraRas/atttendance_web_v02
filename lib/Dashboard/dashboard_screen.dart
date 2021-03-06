import 'dart:convert';
import 'dart:html';
import 'dart:typed_data';
import 'package:attendance_app/Dashboard/poi_user.dart';
import 'package:attendance_app/Dashboard/report.dart';
import 'package:attendance_app/Models/attendance_data.dart';
import 'package:attendance_app/Models/employee_data.dart';
import 'package:attendance_app/Models/poi_data.dart';
import 'package:attendance_app/Services/api_call.dart';
import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:attendance_app/widgets/responsive_login.dart';
import 'package:attendance_app/Services/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Tables/Attendance_table_ui/attendence_table.dart';
import 'Tables/Field_table_ui/field_force.dart';
import 'Tables/Field_table_ui/filed_add_row.dart';
import 'Tables/Poi_table_ui/poi_add_row.dart';
import 'Tables/Poi_table_ui/poi_table.dart';

DateTime DT = DateTime.now();
DateTime Dt = DateTime.now();
String dateFromSelected = DateFormat('dd-MM-yyyy').format(DT);
String dateToSelected = DateFormat('dd-MM-yyyy').format(Dt);

class DashboardScreen extends StatefulWidget {
  String? which_button = '';
  String token;
  DashboardScreen({Key? key, this.which_button, required this.token})
      : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  // final _scaffoldKey = GlobalKey<ScaffoldState>();
  // List<dynamic> usersFiltered = [];
  // TextEditingController controller = TextEditingController();
  // String _searchResult = '';
  String cid = "";

  initialValue(String val) {
    return Text(val.toString());
  }

  String uploadFilename = "";
  Uint8List? csvFile;

  Refresh() {
    setState(() {});
  }

  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) async {
      cid = prefs.getString("cid")!;
    });
    super.initState();
  }

  //Date Time
  pickFromDate() async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: DT,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 10),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            colorScheme: const ColorScheme.dark(
              primary: primaryColor,
              surface: Color(0xff212332),
            ),
            dialogBackgroundColor: const Color(0xff2A2D3E),
          ), // This will change to light theme.
          child: child!,
        );
      },
    );

    if (newDate == null) return;

    DT = newDate;
    dateFromSelected = DateFormat('dd-MM-yyyy').format(newDate);
    setState(() => DT = newDate);
  }

  pickToDate() async {
    final newDate = await showDatePicker(
      context: context,
      initialDate: Dt,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 10),
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            colorScheme: const ColorScheme.dark(
              primary: primaryColor,
              surface: Color(0xff212332),
            ),
            dialogBackgroundColor: const Color(0xff2A2D3E),
          ), // // This will change to light theme.
          child: child!,
        );
      },
    );

    if (newDate == null) return;

    Dt = newDate;
    dateToSelected = DateFormat('dd-MM-yyyy').format(newDate);
    setState(() => Dt = newDate);
  }

  //Download CSv
  List<PoiDataModel> getList = [];
  List<EmployeeDataModel> getFieldForceList = [];
  List<AttendanceDataModel> getAttendanceList = [];
  final DateFormat dtformat = DateFormat('dd-MM-yyyy');
  // List<EmployeeDataModel> getemployeeList = [];

  getAttendanceCSV(getAttendanceList) {
    // print(getFieldForceList[0].employeeName);
    // print('inside download function ->${widget.which_button}');

    List<List<dynamic>> rows = [];

    for (int i = 0; i < getAttendanceList.length; i++) {
      List<dynamic> row = [];
      row.add(getAttendanceList[i].employeeName);
      row.add(getAttendanceList[i].employeeId);
      row.add(getAttendanceList[i].poiId.first.poiId);
      row.add(DateFormat.jm().format(
          DateTime.parse((getAttendanceList[i].createdAt.toString()))
              .toLocal()));
      row.add(dtformat.format(getAttendanceList[i].attendanceDate));
      row.add(getAttendanceList[i].mobile);

      rows.add(row);
      // print(rows);
    }
    String csv = const ListToCsvConverter().convert(rows);

    String withHeading =
        'employeeName,employeeId,poiId,submitTime,submitDate,mobile\n' + csv;
    AnchorElement()
      ..href =
          '${Uri.dataFromString(withHeading, mimeType: 'text/csv', encoding: utf8)}'
      ..download = 'AttendanceCsv.csv'
      ..style.display = 'none'
      ..click();
  }

  getFieldCSV(getFieldForceList) {
    // print(getFieldForceList[0].employeeName);
    // print('inside download function ->${widget.which_button}');

    List<List<dynamic>> rows = [];

    for (int i = 0; i < getFieldForceList.length; i++) {
      List<dynamic> row = [];
      row.add(getFieldForceList[i].cid);
      row.add(getFieldForceList[i].employeeId);
      row.add(getFieldForceList[i].employeeName);
      row.add(getFieldForceList[i].designation);
      row.add(getFieldForceList[i].mobile);
      row.add(getFieldForceList[i].email);
      row.add(getFieldForceList[i].market);
      row.add(getFieldForceList[i].territory);
      row.add(getFieldForceList[i].area);
      row.add(getFieldForceList[i].region);
      row.add(getFieldForceList[i].zone);
      rows.add(row);
      // print(rows);
    }
    String csv = const ListToCsvConverter().convert(rows);

    String withHeading =
        'cid,employeeId,employeeName,designation,mobile,email,market,territory,area,region,zone\n' +
            csv;
    AnchorElement()
      ..href =
          '${Uri.dataFromString(withHeading, mimeType: 'text/csv', encoding: utf8)}'
      ..download = 'file.csv'
      ..style.display = 'none'
      ..click();
  }

  getCsv(getList) {
    // print(getList[0].market);

    List<List<dynamic>> rows = [];

    for (int i = 0; i < getList.length; i++) {
//row refer to each column of a row in csv file and rows refer to each row in a file
      List<dynamic> row = [];
      row.add(getList[i].poiId);
      row.add(getList[i].poiType);
      row.add(getList[i].union);
      row.add(getList[i].thana);
      row.add(getList[i].district);
      row.add(getList[i].division);
      row.add(getList[i].market);
      row.add(getList[i].territory);
      row.add(getList[i].area);
      row.add(getList[i].region);
      row.add(getList[i].zone);
      row.add(getList[i].lat);
      row.add(getList[i].long);
      rows.add(row);
    }

    String csv = const ListToCsvConverter().convert(rows);

    String withHeading =
        'poiId,poiType,union,thana,district,division,market,territory,area,region,zone,lat,long\n' +
            csv;
    AnchorElement()
      ..href =
          '${Uri.dataFromString(withHeading, mimeType: 'text/csv', encoding: utf8)}'
      ..download = 'file.csv'
      ..style.display = 'none'
      ..click();
  }

  getpoiformat() {
    // print(getList[0].market);

    List<List<dynamic>> rows = [];

    String csv = const ListToCsvConverter().convert(rows);

    String withHeading =
        'poiId,poiType,union,thana,district,division,market,territory,area,region,zone,lat,long\n' +
            csv;
    AnchorElement()
      ..href =
          '${Uri.dataFromString(withHeading, mimeType: 'text/csv', encoding: utf8)}'
      ..download = 'poi.csv'
      ..style.display = 'none'
      ..click();
  }

  getFFformat() {
    // print(getList[0].market);

    List<List<dynamic>> rows = [];

    String csv = const ListToCsvConverter().convert(rows);

    String withHeading =
        'cid,employeeId,employeeName,designation,mobile,email,market,territory,area,region,zone\n' +
            csv;
    AnchorElement()
      ..href =
          '${Uri.dataFromString(withHeading, mimeType: 'text/csv', encoding: utf8)}'
      ..download = 'field_force.csv'
      ..style.display = 'none'
      ..click();
  }

  getFFpoiformat() {
    // print(getList[0].market);

    List<List<dynamic>> rows = [];

    String csv = const ListToCsvConverter().convert(rows);

    String withHeading = 'cid,employeeId,poiId\n' + csv;
    AnchorElement()
      ..href =
          '${Uri.dataFromString(withHeading, mimeType: 'text/csv', encoding: utf8)}'
      ..download = 'poi_user.csv'
      ..style.display = 'none'
      ..click();
  }

  /*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  ++++++++++++++++++++++++++++++++++++++++POI Batch Upload FUNCTION+++++++++++++++++++++++++++++++++++++++++++++
  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

  batchUploadPoi() async {
    final results = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );
    if (results == null) {
      return Fluttertoast.showToast(
          backgroundColor: Colors.red,
          webBgColor: "linear-gradient(to right, #F44336FF, #F44336FF)",
          msg: 'File is not selected',
          toastLength: Toast.LENGTH_SHORT,
          webPosition: "center");
    } else {
      csvFile = results.files.first.bytes;
      //print(csvFile);

      // print(imgFile);

      uploadFilename = results.files.first.name;

      if (csvFile != null && uploadFilename != '' && widget.token != '') {
        ApiCall().sendFilePoi(csvFile, uploadFilename, widget.token);
      }
    }
  }

  /*+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  +++++++++++++++++++++++++++++++++++++Field Forced Batch Upload FUNCTION+++++++++++++++++++++++++++++++++++
  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

  batchUploadFieldForce() async {
    final results = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );
    if (results == null) {
      return Fluttertoast.showToast(
          backgroundColor: Colors.red,
          webBgColor: "linear-gradient(to right, #F44336FF, #F44336FF)",
          msg: 'File is not selected',
          toastLength: Toast.LENGTH_SHORT,
          webPosition: "center");
    } else {
      csvFile = results.files.first.bytes;
      //print(csvFile);

      // print(imgFile);

      uploadFilename = results.files.first.name;

      if (csvFile != null && uploadFilename != '' && widget.token != '') {
        ApiCall().sendFileFieldForce(csvFile, uploadFilename, widget.token);
      }
    }
  }

  batchUploadEmployeePoi() async {
    final results = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowedExtensions: ['csv'],
    );

    if (results == null) {
      return Fluttertoast.showToast(
          backgroundColor: Colors.red,
          webBgColor: "linear-gradient(to right, #F44336FF, #F44336FF)",
          msg: 'File is not selected',
          toastLength: Toast.LENGTH_SHORT,
          webPosition: "center");
    } else {
      csvFile = results.files.first.bytes;
      //print(csvFile);

      // print(imgFile);

      uploadFilename = results.files.first.name;

      if (csvFile != null && uploadFilename != '' && widget.token != '') {
        ApiCall().sendEmployeePoi(csvFile, uploadFilename, widget.token);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // List<String> items = ['POI Id', 'POI type', 'User id'];
    // String? selectedItem = 'POI Id';
    // print('after setState ${widget.which_button}');
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(defultPadding),
        child: Column(
          children: [
            Row(
              children: [
                if (!ResponsiveWidget.isLargeScreen(context))
                  IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  ),
                if (ResponsiveWidget.isLargeScreen(context))
                  Text(
                    "Dashboard",
                    style: Theme.of(context).textTheme.headline5,
                  ),
                if (!ResponsiveWidget.isSmallScreen(context))
                  Spacer(flex: ResponsiveWidget.isLargeScreen(context) ? 2 : 1),
                // if (Responsive.isDesktop(context))
                //   DropdownButton<String>(
                //     value: selectedItem,
                //     items: items
                //         .map(
                //           (item) => DropdownMenuItem<String>(
                //             value: item,
                //             child: Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Text(
                //                 item,
                //                 style: Theme.of(context).textTheme.subtitle2,
                //               ),
                //             ),
                //           ),
                //         )
                //         .toList(),
                //     onChanged: (item) => setState(() => selectedItem = item),
                //   ),

                const SizedBox(
                  width: 14,
                ),

                // Expanded(
                //   child: TextField(
                //     // controller: controller,
                //     // onChanged: (value) {
                //     //   {
                //     //     setState(() {
                //     //       _searchResult = value;
                //     //       usersFiltered = demoRecentFiles
                //     //           .where((fileinfo) =>
                //     //               fileinfo.cid.contains(_searchResult) ||
                //     //               fileinfo.poiId.contains(_searchResult))
                //     //           .toList();
                //     //     });
                //     //   }
                //     // },
                //     decoration: InputDecoration(
                //       hintText: "Search Field",
                //       fillColor: secondaryColor,
                //       filled: true,
                //       border: const OutlineInputBorder(
                //           borderRadius: BorderRadius.all(
                //             Radius.circular(10),
                //           ),
                //           borderSide: BorderSide.none),
                //       suffixIcon: InkWell(
                //         borderRadius: const BorderRadius.all(
                //           Radius.circular(10),
                //         ),
                //         onTap: () {},
                //         child: const Icon(Icons.search),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
            const SizedBox(
              height: defultPadding,
            ),
            Row(
              children: [
                Text(
                  widget.which_button.toString(),
                  style: ResponsiveWidget.isSmallScreen(context)
                      ? Theme.of(context).textTheme.subtitle1
                      : Theme.of(context).textTheme.headline6,
                ),
                const SizedBox(
                  width: 14,
                ),

// ***********************************************************************************
// **********************ADD ROW UI***************************************************
// ***********************************************************************************
// ***********************************************************************************

                widget.which_button == "POI Table"
                    ? ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return PopupView(
                                token: widget.token,
                                refresh: Refresh,
                              );
                            },
                          );
                        },
                        child: const Text(
                          " + Add Row",
                          style: TextStyle(fontSize: 15),
                        ),
                      )
                    : widget.which_button == "Field Force"
                        ? ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return FieldPopupView(
                                    token: widget.token,
                                    refresh: Refresh,
                                  );
                                },
                              );
                            },
                            child: const Text(
                              " + Add Row",
                              style: TextStyle(fontSize: 15),
                            ),
                          )
                        : ResponsiveWidget.isLargeScreen(context)
                            ? Row(
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.20,
                                  ),
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.25,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            Text('From : '),
                                            initialValue(dateFromSelected),
                                            IconButton(
                                              onPressed: () {
                                                pickFromDate();
                                              },
                                              icon: const Icon(
                                                Icons.date_range_outlined,
                                                color: primaryColor,
                                              ),
                                            ),
                                            Text(' --  To : '),
                                            initialValue(dateToSelected),
                                            IconButton(
                                              onPressed: () {
                                                pickToDate();
                                              },
                                              icon: const Icon(
                                                Icons.date_range_outlined,
                                                color: primaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )

                                      // TextField(
                                      //   autofocus: false,
                                      //   controller: initialValue(dateSelected),
                                      //   focusNode: AlwaysDisabledFocusNode(),
                                      //   style: const TextStyle(color: Colors.black),
                                      //   textAlign: TextAlign.center,
                                      //   decoration: InputDecoration(
                                      //     fillColor: Colors.white,
                                      //     filled: true,
                                      //     hintText: 'Start Date',
                                      //     contentPadding: const EdgeInsets.all(5.0),
                                      //     border: OutlineInputBorder(
                                      //         borderRadius:
                                      //             BorderRadius.circular(5.0)),
                                      //     suffixIcon: const Icon(
                                      //       Icons.date_range_rounded,
                                      //       color: Colors.blueAccent,
                                      //       size: 30.0,
                                      //     ),
                                      //   ),
                                      //   onChanged: (String value) {
                                      //     setState(() {});
                                      //     dateSelected = value;
                                      //     //dateSelected;
                                      //   },
                                      //   onTap: () {
                                      //     pickDate();
                                      //   },
                                      // ),
                                      ),
                                ],
                              )
                            : Row(
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            const Text('From : '),
                                            initialValue(dateFromSelected),
                                            IconButton(
                                              onPressed: () {
                                                pickFromDate();
                                              },
                                              icon: const Icon(
                                                Icons.date_range_outlined,
                                                color: primaryColor,
                                              ),
                                            ),
                                            const Text(' --  To : '),
                                            initialValue(dateToSelected),
                                            IconButton(
                                              onPressed: () {
                                                pickToDate();
                                              },
                                              icon: const Icon(
                                                Icons.date_range_outlined,
                                                color: primaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )

                                      // TextField(
                                      //   autofocus: false,
                                      //   controller: initialValue(dateSelected),
                                      //   focusNode: AlwaysDisabledFocusNode(),
                                      //   style: const TextStyle(color: Colors.black),
                                      //   textAlign: TextAlign.center,
                                      //   decoration: InputDecoration(
                                      //     fillColor: Colors.white,
                                      //     filled: true,
                                      //     hintText: 'Start Date',
                                      //     contentPadding: const EdgeInsets.all(5.0),
                                      //     border: OutlineInputBorder(
                                      //         borderRadius:
                                      //             BorderRadius.circular(5.0)),
                                      //     suffixIcon: const Icon(
                                      //       Icons.date_range_rounded,
                                      //       color: Colors.blueAccent,
                                      //       size: 30.0,
                                      //     ),
                                      //   ),
                                      //   onChanged: (String value) {
                                      //     setState(() {});
                                      //     dateSelected = value;
                                      //     //dateSelected;
                                      //   },
                                      //   onTap: () {
                                      //     pickDate();
                                      //   },
                                      // ),
                                      ),
                                ],
                              ),

                // Row(
                //   children: [
                //     TextFormField(
                //       style: const TextStyle(color: Colors.white),
                //       // decoration: InputDecoration(labelText: ),
                //     ),
                //     TextFormField(),
                //   ],
                // ),
                // TextFormField(
                //   stl
                // ),
                const Spacer(),
                // SizedBox(
                //   width: 70,
                //   child: TextField(
                //     decoration: InputDecoration(
                //       labelText: '',
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(12.0),
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(width: 10),
                // SizedBox(
                //   width: 70,
                //   child: TextField(
                //     onChanged: (val){

                //     },
                //     decoration: InputDecoration(
                //       labelText: '',
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(12.0),
                //       ),
                //     ),
                //   ),
                // ),
                // const SizedBox(width: 10),

                // ElevatedButton(
                //     onPressed: () {
                //       setState(() {});
                //     },
                //     child: const Text("Go To")),

                // *************************************************************************
                // **********************ff UPLOAD UI**********************************
                // *************************************************************************
                // *************************************************************************

                widget.which_button == 'Field Force'
                    ? ResponsiveWidget.isSmallScreen(context)
                        ? SizedBox(
                            width: 75.0,
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(100, 40),
                                        // maximumSize: const Size(150, 50),
                                      ),
                                      onPressed: () async {
                                        await batchUploadEmployeePoi();
                                        setState(() {});
                                      },
                                      child: const Icon(Icons.file_copy),
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          getFFpoiformat();
                                        },
                                        child: const Text("Download Format"))
                                  ],
                                )),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              child: Column(children: [
                                ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(100, 40),
                                  ),
                                  onPressed: () async {
                                    // print('big ${widget.which_button}');
                                    await batchUploadEmployeePoi();
                                    setState(() {});
                                  },
                                  icon: const Icon(Icons.file_copy),
                                  label: const Text("FF POI Upload"),
                                ),
                                TextButton(
                                    onPressed: () {
                                      getFFpoiformat();
                                    },
                                    child: const Text("Download Format"))
                              ]),
                            ),
                          )
                    : const SizedBox(
                        width: 8,
                      ),

                // *************************************************************************
                // **********************poi UPLOAD UI**********************************
                // *************************************************************************
                // *************************************************************************
                widget.which_button != 'Attendance table'
                    ? ResponsiveWidget.isSmallScreen(context)
                        ? SizedBox(
                            width: 75,
                            child: Column(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(100, 40),
                                    // maximumSize: const Size(150, 50),
                                  ),
                                  onPressed: () async {
                                    if (widget.which_button == 'POI Table') {
                                      await batchUploadPoi();
                                      setState(() {});
                                    } else if (widget.which_button ==
                                        'Field Force') {
                                      await batchUploadFieldForce();
                                      setState(() {});
                                    }
                                  },
                                  child: const Icon(Icons.file_copy),
                                ),
                                TextButton(
                                    onPressed: () {
                                      if (widget.which_button == 'POI Table') {
                                        // print('big ${widget.which_button}');
                                        getpoiformat();
                                        setState(() {});
                                      } else if (widget.which_button ==
                                          "Field Force") {
                                        getFFformat();
                                        setState(() {});
                                      }
                                    },
                                    child: const Text("Download Format"))
                              ],
                            ))
                        : Column(
                            children: [
                              ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(100, 40),
                                ),
                                onPressed: () async {
                                  if (widget.which_button == 'POI Table') {
                                    // print('big ${widget.which_button}');
                                    await batchUploadPoi();
                                    setState(() {});
                                  } else if (widget.which_button ==
                                      'Field Force') {
                                    // print('big ${widget.which_button}');
                                    await batchUploadFieldForce();
                                    setState(() {});
                                  } else {}
                                  //setState(() {});
                                },
                                icon: const Icon(Icons.file_copy),
                                label: widget.which_button == 'POI Table'
                                    ? const Text("POI Upload")
                                    : const Text("FF Upload"),
                              ),
                              TextButton(
                                onPressed: () {
                                  if (widget.which_button == 'POI Table') {
                                    // print('big ${widget.which_button}');
                                    getpoiformat();
                                    setState(() {});
                                  } else if (widget.which_button ==
                                      "Field Force") {
                                    getFFformat();
                                    setState(() {});
                                  }
                                },
                                child:
                                    const Text("Download Format"), //POI UPLOAD
                              )
                            ],
                          )
                    : const SizedBox(
                        width: 8,
                      ),
                const SizedBox(
                  width: 8,
                ),
                // *************************************************************************
                // ***************************DOWNLOAD UI********************************************
                // *************************************************************************
                // *************************************************************************

                ResponsiveWidget.isSmallScreen(context)
                    ? SizedBox(
                        width: 75,
                        child: Column(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(100, 40),
                              ),
                              onPressed: () {},
                              child: const Icon(Icons.download),
                            ),
                            TextButton(onPressed: () {}, child: const Text(""))
                          ],
                        ))
                    : Column(
                        children: [
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(100, 40),
                            ),
                            onPressed: () {
                              if (widget.which_button == 'POI Table') {
                                getCsv(getList);
                              } else if (widget.which_button == 'Field Force') {
                                getFieldCSV(getFieldForceList);
                              } else if (widget.which_button ==
                                  'Attendance table') {
                                getAttendanceCSV(getAttendanceList);
                              }
                            },
                            icon: const Icon(Icons.download),
                            label: const Text("Download"),
                          ),
                          TextButton(onPressed: () {}, child: const Text(""))
                        ],
                      )
              ],
            ),

            const SizedBox(
              height: defultPadding,
            ),
            // Row(
            //   children: [
            //     Spacer(),
            //     widget.which_button == 'Field Force'
            //         ? ResponsiveWidget.isSmallScreen(context)
            //             ? SizedBox(
            //                 width: 75.0,
            //                 child: Padding(
            //                   padding: const EdgeInsets.all(8.0),
            //                   child: ElevatedButton(
            //                     style: ElevatedButton.styleFrom(
            //                       minimumSize: const Size(100, 40),
            //                       // maximumSize: const Size(150, 50),
            //                     ),
            //                     onPressed: () async {
            //                       await batchUploadEmployeePoi();
            //                       setState(() {});
            //                     },
            //                     child: const Icon(Icons.file_copy),
            //                   ),
            //                 ),
            //               )
            //             : Padding(
            //                 padding: const EdgeInsets.all(8.0),
            //                 child: SizedBox(
            //                   child: ElevatedButton.icon(
            //                     style: ElevatedButton.styleFrom(
            //                       minimumSize: const Size(100, 40),
            //                     ),
            //                     onPressed: () async {
            //                       // print('big ${widget.which_button}');
            //                       await batchUploadEmployeePoi();
            //                       setState(() {});
            //                     },
            //                     icon: const Icon(Icons.file_copy),
            //                     label: const Text("FF POI Download Format"),
            //                   ),
            //                 ),
            //               )
            //         : const SizedBox(
            //             width: 8,
            //           ),
            //     ElevatedButton(
            //       onPressed: () {},
            //       child: Text("Download Format"),
            //     ),
            //     SizedBox(
            //       width: 8,
            //     ),
            //     ElevatedButton(
            //       onPressed: () {
            //         setState(() {});
            //       },
            //       child: Text("Refresh"),
            //     ),
            //   ],
            // ),

            // *************************************************************************
            // ***************************TABLE UI ********************************************
            // *************************************************************************
            // *************************************************************************

            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: widget.which_button == "Attendance table"
                    ? AttendenceTableData(
                        getAttendanceList: (value) async {
                          getAttendanceList = value;
                        },
                        token: widget.token,
                      )
                    : widget.which_button == "Field Force"
                        ? FieldForceData(
                            token: widget.token,
                            getFieldForceList: (value) async {
                              getFieldForceList = value;
                            },
                            getList: getList,
                          )
                        : widget.which_button == "POI Table"
                            ? PoiTableData(
                                token: widget.token,
                                getList: (value) async {
                                  getList = value;
                                },
                              )
                            : widget.which_button == "POI User"
                                ? poiUser()
                                : ReportPage(),
              ),
            )
          ],
        ),
      ),
    );
  }

  void openFileExplorer() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: false);

    if (result != null) {
      result.files.first.bytes;
      // print(resultBytes);
      setState(() {});
    } else {
      throw "error";
      // User canceled the picker
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
