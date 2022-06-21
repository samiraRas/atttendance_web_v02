import 'package:attendance_app/Dashboard/Tables/Field_table_ui/field_edit_row.dart';
import 'package:attendance_app/Models/poi_data.dart';
import 'package:flutter/material.dart';
import 'package:attendance_app/Models/employee_data.dart';
import 'package:attendance_app/Services/constants.dart';
import 'package:flutter/services.dart';
import '../../../Services/api_call.dart';
import 'field_force_delete_row.dart';

List<EmployeeDataModel> data = [];

class FieldForceData extends StatefulWidget {
  Function(List<EmployeeDataModel>) getFieldForceList;
  String token;
  List<PoiDataModel> getList;

  FieldForceData(
      {Key? key,
      required this.token,
      required this.getFieldForceList,
      required this.getList})
      : super(key: key);
  @override
  State<FieldForceData> createState() => _FieldForceDataState();
}

class _FieldForceDataState extends State<FieldForceData> {
  ScrollController scrollController = ScrollController();
  var rowsPerPage = "50";
  int pageNumber = 1;

  //Employee Poi Add Row
  TextEditingController emplopyeeIdController = TextEditingController();

  Refresh() {
    setState(() {});
  }

  @override
  void initState() {
    // print("printing list ${widget.getList}");
    super.initState();
  }

  @override
  void dispose() {
    emplopyeeIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiCall()
          .getAllEmployee(widget.token, rowsPerPage, pageNumber.toString()),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.data == null) {
          return const Center(
            child: Text("loading......"),
          );
        } else if (snapshot.hasData) {
          // print('showing snapshot ${snapshot.data}');
          data = snapshot.data as List<EmployeeDataModel>;
          var a = widget.getFieldForceList(data);

          // widget.getList(data);
          // print('ki ki run korbo ${data}');
          // print('getfieldForcelist $a');
          return SizedBox(
            width: double.infinity,
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
                        //   width: 80,
                        //   height: 40,
                        //   child: TextField(
                        //     keyboardType: TextInputType.number,
                        //     inputFormatters: <TextInputFormatter>[
                        //       FilteringTextInputFormatter.digitsOnly
                        //     ],
                        //     onChanged: (val) {
                        //       rowsPerPage = val;
                        //     },
                        //     style: const TextStyle(color: Colors.white),
                        //     decoration: InputDecoration(
                        //       labelText: 'Data Count',
                        //       labelStyle: TextStyle(fontSize: 12),
                        //       border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(12.0),
                        //       ),
                        //     ),
                        //     maxLines: 1,
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
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (val) {
                              pageNumber = int.parse(val);
                            },
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Page Number',
                              labelStyle: const TextStyle(fontSize: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
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
                    // dragStartBehavior: DragStartBehavior.start,
                    // onRowsPerPageChanged: (perPage) {
                    //   /**Api for load */
                    // },
                    rowsPerPage: 50,
                    columns: Datacolumn(context),

                    source: TableRow(
                      context: context,
                      employeeData: data,
                      token: widget.token,
                      refresh: Refresh,
                      poiPoints: widget.getList,
                      controller: emplopyeeIdController,
                    ),

                    // initialFirstRowIndex: 0,
                    // headingRowHeight: 0,
                  ),
                ],
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
        "Employee ID",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
        label: Text(
          "Employee Name",
          style: Theme.of(context).textTheme.subtitle2,
        ),
      ),
      // DataColumn(
      //     label: Text(
      //   "Designation",
      //   style: Theme.of(context).textTheme.subtitle2,
      // )),
      DataColumn(
          label: Text(
        "Mobile Number",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "Territory",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "Area",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "Region",
        style: Theme.of(context).textTheme.subtitle2,
      )),
      DataColumn(
          label: Text(
        "Action",
        style: Theme.of(context).textTheme.subtitle2,
      )),
    ];
  }
}

class TableRow extends DataTableSource {
  BuildContext context;
  List<EmployeeDataModel> employeeData;
  String token;
  Function refresh;
  TextEditingController controller;
  // List<dynamic> poiPoints = widget.getList;
  List<PoiDataModel> poiPoints;
// var a = poiPoints[i].poiId;
  TableRow({
    required this.employeeData,
    required this.context,
    required this.token,
    required this.refresh,
    required this.poiPoints,
    required this.controller,
  });

  @override
  DataRow? getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      DataCell(Center(child: Text(employeeData[index].employeeId))),
      DataCell(Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(employeeData[index].employeeName),
            Text("[${employeeData[index].designation}]"),
          ],
        ),
      ))),
      // DataCell(Center(child: Text(employeeData[index].designation))),
      DataCell(Center(child: Text(employeeData[index].mobile))),
      DataCell(Center(child: Text(employeeData[index].territory))),
      DataCell(Center(child: Text(employeeData[index].area))),
      DataCell(Center(child: Text(employeeData[index].region))),
      DataCell(Center(
        child: Row(
          //icons in action row
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //POI action Icon in Field Force
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: bgColor,
                      content: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.45,
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: Column(
                          children: [
                            Form(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          style: const TextStyle(
                                              color: Colors.white),
                                          controller: controller,
                                          decoration: InputDecoration(
                                            labelText: "Poi Id",
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                            labelStyle: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 25.0),

                            // GridView.count(
                            //   physics: const NeverScrollableScrollPhysics(),
                            //   shrinkWrap: true,
                            //   crossAxisCount: 3,
                            //   childAspectRatio: (1 / .4),
                            //   padding: const EdgeInsets.all(20),
                            //   crossAxisSpacing: 10,
                            //   mainAxisSpacing: 10,
                            //   children: [
                            //     PoiSingleButton(poipoints: poiPoints),
                            //     PoiSingleButton(poipoints: poiPoints),
                            //     PoiSingleButton(poipoints: poiPoints),
                            //     PoiSingleButton(poipoints: poiPoints),
                            //     PoiSingleButton(poipoints: poiPoints),
                            //     PoiSingleButton(poipoints: poiPoints),
                            //     PoiSingleButton(poipoints: poiPoints),
                            //     PoiSingleButton(poipoints: poiPoints),
                            //     PoiSingleButton(poipoints: poiPoints),
                            //     PoiSingleButton(poipoints: poiPoints),
                            //   ],
                            // ),
                            // Expanded(
                            //   child: GridView.builder(
                            //     gridDelegate:
                            //         const SliverGridDelegateWithFixedCrossAxisCount(
                            //       crossAxisCount: 3,
                            //       mainAxisSpacing: 10,
                            //       crossAxisSpacing: 10.0,
                            //       childAspectRatio: 1 / .4,
                            //     ),
                            //     shrinkWrap: true,
                            //     itemCount: poiPoints.length,
                            //     itemBuilder: (context, idx) {
                            //       return PoiSingleButton(
                            //           title: poiPoints[idx].poiId);
                            //     },
                            //   ),
                            // ),
                            // ElevatedButton(
                            //     onPressed: () {},
                            //     child: Text(poiPoints[0].poiId)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red, // Background color
                                  ),
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                const SizedBox(
                                  width: 50.0,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: primaryColor, // Background color
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "Add",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () async {
                                    if (controller.text != '') {
                                      await ApiCall().singleEmployeePoiAddRow(
                                          employeeData[index].id,
                                          token,
                                          controller.text);

                                      Navigator.pop(context);
                                      refresh;
                                      controller.clear();
                                    }
                                  },
                                ),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DataTable(
                                    columns: const <DataColumn>[
                                      DataColumn(label: Text("POI ID")),
                                      DataColumn(label: Text("POI Name")),
                                      DataColumn(label: Text("Action"))
                                    ],
                                    rows: const <DataRow>[
                                      DataRow(
                                        cells: <DataCell>[
                                          DataCell(
                                            Text("poiId1"),
                                          ),
                                          DataCell(
                                            Text("name2"),
                                          ),
                                          DataCell(
                                            Text("Delete"),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              tooltip: "POI User points",
              icon: const Icon(Icons.store),
              color: primaryColor,
            ),

            FieldEditView(
              // Edit Icon in Action Row
              employeeId: employeeData[index].employeeId,
              employeeName: employeeData[index].employeeName,
              designation: employeeData[index].designation,
              mobile: employeeData[index].mobile,
              email: employeeData[index].email,
              market: employeeData[index].market,
              territory: employeeData[index].territory,
              area: employeeData[index].area,
              region: employeeData[index].region,
              zone: employeeData[index].zone,
              token: token,
              id: employeeData[index].id,
              refresh: refresh,
            ),
            FieldDeleteView(
                // Delete Icon in Action Row
                token: token,
                id: employeeData[index].id,
                refresh: refresh),
          ],
        ),
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => employeeData.length;

  @override
  int get selectedRowCount => 0;
}

class PoiSingleButton extends StatefulWidget {
  String title;
  // List<PoiDataModel> poipoints;
  PoiSingleButton({Key? key, required this.title}) : super(key: key);

  @override
  State<PoiSingleButton> createState() => _PoiSingleButtonState();
}

class _PoiSingleButtonState extends State<PoiSingleButton> {
  bool pressAttention = false;
  @override
  Widget build(BuildContext context) {
    print(widget.title);

    return ElevatedButton(
      onPressed: () {
        setState(() {
          pressAttention = !pressAttention;
        });
      },
      style: ElevatedButton.styleFrom(
        primary: pressAttention ? primaryColor : secondaryColor,
      ),
      child: Text(widget.title),
    );
  }
}
