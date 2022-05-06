import 'dart:io';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sii_printer_plugin/bluetooth_device.dart';
import 'package:sii_printer_plugin/sii_printer_core.dart';
import 'package:sii_printer_plugin/type/character_bold.dart';
import 'package:sii_printer_plugin/type/character_reverse.dart';
import 'package:sii_printer_plugin/type/character_scale.dart';
import 'package:sii_printer_plugin/type/character_underline.dart';
import 'package:sii_printer_plugin/type/print_alignment.dart';
import 'package:sii_printer_plugin/type/sii_error_code.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<BluetoothDevice>? printers;
  BluetoothDevice? selectedPrinter;
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
                        child: DropdownSearch<BluetoothDevice>(
                          mode: Mode.DIALOG,
                          showSearchBox: true,
                          showSelectedItems: true,
                          items: printers,
                          dropdownSearchTextAlignVertical: TextAlignVertical.center,
                          compareFn: (printer, selectedPrinter) {
                            return printer?.macAddress == selectedPrinter?.macAddress;
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
                          dropdownBuilder: _customDropDownBuilder,
                          popupItemBuilder: _customPopupItemBuilder,
                          dropdownSearchDecoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.only(top: 11.0, bottom: 8.0, left: 8.0),
                          ),
                          onChanged: (selectedValue) {
                            if (selectedValue != null) {
                              selectedPrinter = selectedValue;
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      InkWell(
                        onTap: discoveryPrinter,
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
                    if (selectedPrinter == null) {
                      showDialog(context, "Please choose printer");
                      return;
                    }
                    SiiPrinterCore.connect(selectedPrinter!).then((value) {
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
                    InkWell(
                      onTap: () async {
                        if (!isConnected) {
                          showDialog(context, "Please connect to printer first");
                          return;
                        }
                        SiiPrinterCore.printLogo("assets/images/logo.jpg").then((value) {
                          handleValue(value);
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        color: Colors.blue,
                        child: const Text('Printer logo'),
                      ),
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

  void discoveryPrinter() {
    if (Platform.isAndroid) {
      SiiPrinterCore.getPrintersInAndroid().listen((devices) {
        setState(() {
          printers = devices;
        });
      });
    }
    if (Platform.isIOS) {
      SiiPrinterCore.getPrintersInIOS().then((value) {
        setState(() {
          printers = value;
        });
      });
    }
  }

  Widget _customPopupItemBuilder(BuildContext context, BluetoothDevice? item, bool isSelected) {
    if (isSelected) {
      return Container(
        padding: const EdgeInsets.all(6.0),
        color: Colors.blue,
        child: Text(
          item?.name ?? (item?.macAddress ?? ''),
          style: const TextStyle(fontSize: 16.0, color: Colors.white),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Text(
        item?.name ?? (item?.macAddress ?? ''),
        style: const TextStyle(
          fontSize: 16.0,
        ),
      ),
    );
  }

  Widget _customDropDownBuilder(BuildContext context, BluetoothDevice? bluetoothDevice) {
    if (bluetoothDevice == null) {
      return const Text(
        "施設を選択して下さい",
        style: TextStyle(fontSize: 16.0),
      );
    }
    return Text(
      bluetoothDevice.name,
      style: const TextStyle(fontSize: 24.0),
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
