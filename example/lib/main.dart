import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sii_printer_plugin/sii_printer_core.dart';
import 'package:sii_printer_plugin/type/character_bold.dart';
import 'package:sii_printer_plugin/type/character_reverse.dart';
import 'package:sii_printer_plugin/type/character_scale.dart';
import 'package:sii_printer_plugin/type/character_underline.dart';
import 'package:sii_printer_plugin/type/print_alignment.dart';
import 'package:sii_printer_plugin/type/sii_error_code.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<dynamic>? printers;
  String? selectedAddress;
  bool isConnected = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Builder(
          builder: (context) => Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: DropdownSearch<dynamic>(
                          mode: Mode.DIALOG,
                          showSearchBox: true,
                          showSelectedItems: true,
                          items: printers,
                          dropdownSearchTextAlignVertical: TextAlignVertical.center,
                          compareFn: (printer, selectedPrinter) {
                            return printer == selectedPrinter;
                          },
                          emptyBuilder: (BuildContext context, String? searchEntry) {
                            return const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Text('No results found', style: TextStyle(fontSize: 14.0)),
                            );
                          },
                          searchFieldProps: TextFieldProps(
                            style: const TextStyle(fontSize: 14.0, color: Colors.black),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              contentPadding: EdgeInsets.symmetric(horizontal: 4.0),
                            ),
                          ),
                          dropdownSearchDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.only(top: 11.0, bottom: 8.0, left: 8.0),
                          ),
                          onChanged: (selectedValue) {
                            if (selectedValue != null) {
                              selectedAddress = selectedValue.toString();
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      InkWell(
                        onTap: () {
                          SiiPrinterCore.getPrinters().then((value) {
                            setState(() {
                              printers = value;
                            });
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12.0),
                          color: Colors.blue,
                          child: const Icon(Icons.search),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                InkWell(
                  onTap: () {
                    if (selectedAddress == null) {
                      showDialog(context, "Please choose printer");
                      return;
                    }
                    SiiPrinterCore.connect(selectedAddress!).then((value) {
                      if (value == SiiErrorCode.SII_PM_ERROR_NONE) {
                        isConnected = true;
                        showDialog(context, "Connected");
                      } else {
                        isConnected = false;
                        showDialog(context, "Error occur");
                      }
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    color: Colors.blue,
                    child: const Text('Connect'),
                  ),
                ),
                const SizedBox(height: 40.0),
                Expanded(
                    child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            if (!isConnected) {
                              showDialog(context, "Please connect to printer first");
                              return;
                            }
                            SiiPrinterCore.printText(
                                    "Flutter is an open-source UI software development kit created by Google.")
                                .then((value) {
                              handleValue(value);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12.0),
                            color: Colors.blue,
                            child: const Text('Print text'),
                          ),
                        ),
                        const SizedBox(width: 20.0),
                        InkWell(
                          onTap: () {
                            if (!isConnected) {
                              showDialog(context, "Please connect to printer first");
                              return;
                            }
                            SiiPrinterCore.printTextEx(
                              "It is used to develop cross platform applications for Android, iOS,...",
                              printAlignment: PrintAlignment.alignmentRight,
                              characterBold: CharacterBold.bold,
                              characterReverse: CharacterReverse.reverse,
                              characterScale: CharacterScale.vartical2Horizontal2,
                              characterUnderline: CharacterUnderline.underline1,
                            ).then((value) {
                              handleValue(value);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12.0),
                            color: Colors.blue,
                            child: const Text('Print text ex'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () async {
                            if (!isConnected) {
                              showDialog(context, "Please connect to printer first");
                              return;
                            }
                            SiiPrinterCore.printLogo().then((value) {
                              handleValue(value);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12.0),
                            color: Colors.blue,
                            child: const Text('Printer logo'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40.0),
                    InkWell(
                      onTap: () async {
                        if (!isConnected) {
                          showDialog(context, "Please connect to printer first");
                          return;
                        }
                        SiiPrinterCore.cutPaper().then((value) {
                          handleValue(value);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        color: Colors.blue,
                        child: const Text('Cut paper'),
                      ),
                    ),
                  ],
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showDialog(BuildContext context, String message) {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: Text(message),
            actions: [
              CupertinoDialogAction(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  void handleValue(SiiErrorCode code) {
    if (code != SiiErrorCode.SII_PM_ERROR_NONE) {
      showDialog(context, code.message);
    }
  }
}
