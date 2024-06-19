import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:simple_dropdownbuttonfield_co/simple_dropdownbuttonfield_co.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String? departamento = '';
  String? municipio = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropDownButtonFormFieldStateCo(
                inputDecoration:
                    const InputDecoration(labelText: 'Departamento'),
                stringState: (value) => departamento = value,
              ),
              DropDownButtonFormFieldCityCo(
                stringState: ((value) => municipio = value),
                inputDecoration: const InputDecoration(labelText: 'Municipio'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              print(departamento);
              print(municipio);
            });
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
