import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_dropdownbuttonfield_co/simple_dropdownbuttonfield_co.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? departamento;

  String? municipio;

  @override
  Widget build(BuildContext context) {
    setState(() {
      debugPrint('statement: $departamento');
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropDownButtonFormFieldStateCo(
              style: TextStyle(color: Colors.blue),
              inputDecoration: inputDecoration(label: 'Departamento'),
              stringStateValue: (value) => departamento = value!,
              codeStateValue: (value) => departamento = value!,
            ),
            DropDownButtonFormFieldCityCo(
              inputDecoration: inputDecoration(label: 'Municipio'),
              stringCityValue: (value) => municipio = value!,
              codeCityValue: (value) => municipio = value!,
            ),
          ],
        ),
      ),
    );
  }
}
