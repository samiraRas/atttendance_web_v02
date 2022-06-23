import 'package:attendance_app/Services/api_call.dart';
import 'package:attendance_app/Services/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PoiDeleteView extends StatefulWidget {
  String token;
  String id;
  Function refresh;
  PoiDeleteView(
      {Key? key, required this.token, required this.id, required this.refresh})
      : super(key: key);
  @override
  _PoiDeleteView createState() => _PoiDeleteView();
}

class _PoiDeleteView extends State<PoiDeleteView> {
  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialButton(
        minWidth: 0.0,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: bgColor,
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      width: MediaQuery.of(context).size.width / 3,
                      height: MediaQuery.of(context).size.width / 16,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Are you sure you want to delete this row?",
                            style: TextStyle(color: Colors.white),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: primaryColor, // Background color
                                  ),
                                  child: const Text(
                                    "Cancel",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
                                    Fluttertoast.showToast(
                                        msg: 'Failed',
                                        toastLength: Toast.LENGTH_SHORT,
                                        webPosition: "center");
                                    Navigator.pop(context);
                                  },
                                ),
                                // Spacer(flex: 2,),
                                const SizedBox(
                                  width: 24,
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red, // Background color
                                  ),
                                  child: const Text(
                                    "Delete",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () async {
                                    await ApiCall().singlePoiDelete(
                                        widget.token, widget.id);
                                    widget.refresh();
                                    // print(
                                    //     'token inside token ->${widget.token}');
                                    // print('poi id inside id ->${widget.id}');
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
        child: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    );
  }
}

class TextFormPopup extends StatelessWidget {
  final String? labelText;

  const TextFormPopup({Key? key, this.labelText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
