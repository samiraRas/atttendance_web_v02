import 'dart:math';

import 'package:attendance_app/Models/attendance_data.dart';
import 'package:attendance_app/Services/apis.dart';
import 'package:attendance_app/Services/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../../Services/api_call.dart';

List<AttendanceDataModel> data = [];

class AttendenceTableData extends StatefulWidget {
  String token;
  Function(List<AttendanceDataModel>) getAttendanceList;
  AttendenceTableData(
      {Key? key, required this.token, required this.getAttendanceList})
      : super(key: key);
  @override
  State<AttendenceTableData> createState() => _AttendenceTableDataState();
}

class _AttendenceTableDataState extends State<AttendenceTableData> {
  ScrollController scrollController = ScrollController();
  String dataCount = '50';
  var pageNumber = 1;

  Refresh() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiCall()
          .getAllAttendance(widget.token, dataCount, pageNumber.toString()),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return const Center(
            child: Text("loading......"),
          );
        } else if (snapshot.hasData) {
          print('showing snapshot ${snapshot.data}');
          data = snapshot.data;
          widget.getAttendanceList(data);

          // data.forEach((element) {
          //   print(element.id);

          //   print(element.poiId.length);
          // });

          return SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Theme(
                data: Theme.of(context).copyWith(
                  cardColor: secondaryColor,
                  textTheme: const TextTheme(
                    headline6: TextStyle(color: Colors.white),
                    bodyText2: TextStyle(color: Colors.white),
                    caption: TextStyle(color: Colors.white),
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Spacer(),
                          // SizedBox(
                          //   width: 70,
                          //   child: TextField(
                          //     onChanged: (val) {
                          //       rowsPerPage = val;
                          //     },
                          //     style: TextStyle(color: Colors.white),
                          //     decoration: InputDecoration(
                          //       labelText: '',
                          //       labelStyle: TextStyle(color: Colors.white),
                          //       border: OutlineInputBorder(
                          //         borderRadius: BorderRadius.circular(12.0),
                          //       ),
                          //     ),
                          //     inputFormatters: <TextInputFormatter>[
                          //       FilteringTextInputFormatter.digitsOnly
                          //     ],
                          //   ),
                          // ),
                          pageNumber == 1
                              ? Text('')
                              : IconButton(
                                  onPressed: () {
                                    pageNumber--;
                                    setState(() {});
                                    print(pageNumber);
                                  },
                                  icon: Icon(Icons.chevron_left),
                                ),
                          Text("Page : ${pageNumber.toString()}"),
                          IconButton(
                            onPressed: () {
                              pageNumber++;
                              setState(() {});
                              print(pageNumber);
                            },
                            icon: Icon(Icons.chevron_right),
                          ),
                          SizedBox(
                            width: 80,
                            height: 40,
                            child: TextField(
                              onChanged: (val) {
                                pageNumber = int.parse(val);
                              },
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                labelText: 'Page Number',
                                labelStyle: const TextStyle(fontSize: 12),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {});
                              },
                              child: const Text("Go To")),
                        ],
                      ),
                    ),
                    PaginatedDataTable(
                      rowsPerPage: 50,
                      // onRowsPerPageChanged: (value) {
                      //   var rowsPerPage1 = value ?? 0;
                      //   setState(() {
                      //     rowsPerPage = rowsPerPage1.toString();
                      //   });
                      // },
                      columnSpacing: 60.0,
                      columns: Datacolumn(context),
                      source: TableRow(
                          attendanceData: data,
                          token: widget.token,
                          refresh: Refresh),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Text('Something is wrong');
        }
      },
    );
  }

  List<DataColumn> Datacolumn(BuildContext context) {
    return <DataColumn>[
      DataColumn(
        label: Text(
          "Employee Name",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
      DataColumn(
        label: Text(
          "Employee ID",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
      const DataColumn(
        label: Text(
          "",
        ),
      ),
      DataColumn(
        label: Text(
          "POI Id",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
      DataColumn(
        label: Text(
          "Submit Time",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
      DataColumn(
        label: Text(
          "Submit Date",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
      DataColumn(
        label: Text(
          "Mobile Number",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
      DataColumn(
        label: Text(
          "Details",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
    ];
  }
}

class TableRow extends DataTableSource {
  List<AttendanceDataModel> attendanceData;

  String token;
  Function refresh;
  BuildContext? context;
  final DateFormat dtformat = DateFormat('dd-MM-yyyy');
  final DateFormat tmformat = DateFormat('hh-mm-ss');

  TableRow({
    required this.attendanceData,
    required this.token,
    required this.refresh,
    this.context,
  });

  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Center(child: Text(attendanceData[index].employeeName))),
        DataCell(Center(child: Text(attendanceData[index].employeeId))),

        const DataCell(Center(child: Text(""))),
        (attendanceData[index].poiId.length > 0)
            ? DataCell(
                Center(child: Text(attendanceData[index].poiId.first.poiId)))
            : const DataCell(Center(child: Text('No PoiID'))),
        // DataCell(Center(
        //     child: Text(
        //         tmformat.format(attendanceData[index].attendanceDateTime)))),
        DataCell(Center(
            child: Text(DateFormat.jm().format(
                DateTime.parse(attendanceData[index].createdAt.toString())
                    .toLocal())))),

        // DataCell(Center(
        //     child: Text(
        //         tmformat.format(attendanceData[index].attendanceDateTime)))),
        DataCell(Center(
            child:
                Text(dtformat.format(attendanceData[index].attendanceDate)))),
        DataCell(Center(child: Text(attendanceData[index].mobile))),
        const DataCell(
          Center(child: Text("Details")),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => attendanceData.length;

  @override
  int get selectedRowCount => 0;
}

class buildAlertDialog extends StatelessWidget {
  const buildAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return AlertDialog(
      backgroundColor: bgColor,
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.45,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(children: []),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
