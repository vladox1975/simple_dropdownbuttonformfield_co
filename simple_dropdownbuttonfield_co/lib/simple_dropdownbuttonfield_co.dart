import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_dropdownbuttonfield_co/data/departamento.dart';

import '../data/municipio.dart';
import '../providers/ubication_providers.dart';

// Create a Form widget.
// La función stringState se encarga de retornar el valor del dropdown
// y se lo puede asignar a una variable de tipo String

// La clase DropDownButtonFormFieldStateCo es la encargada de construir el dropdown
// de los municipios de Colombia, se puede incluir en cualquier punto y se personaliza con los atributos
class DropDownButtonFormFieldCityCo extends ConsumerWidget {
  //El input decoration que le da formato al dropdown
  final InputDecoration inputDecoration;
  //Esta función se encarga de retornar el valor del dropdown como un string
  final String? Function(String value) stringCityValue;
  final String? Function(String value) codeCityValue;
  final Widget? hint;
  final int elevation;
  final TextStyle? style;
  final Widget? icon;
  final Color? iconDisabledColor;
  final Color? iconEnabledColor;
  final double iconSize = 24.0;
  final bool isDense = true;
  final bool isExpanded = false;
  final double? itemHeight;
  final Color? focusColor;
  final FocusNode? focusNode;

  const DropDownButtonFormFieldCityCo({
    required this.stringCityValue,
    required this.codeCityValue,
    required this.inputDecoration,
    this.hint,
    this.elevation = 8,
    this.style,
    this.icon,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.itemHeight,
    this.focusColor,
    this.focusNode,
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButtonFormField<String>(
      key: key,
      hint: hint,
      elevation: elevation,
      style: style,
      icon: icon,
      iconDisabledColor: iconDisabledColor,
      iconEnabledColor: iconEnabledColor,
      itemHeight: itemHeight,
      focusColor: focusColor,
      focusNode: focusNode,
      value: ref.watch(providerMunicipio),
      decoration: inputDecoration,
      //se cambia el valor del dropdown segun el departamento seleccionado
      onChanged: (value) {
        ref.read(providerMunicipio.notifier).state = value!;
        stringCityValue(municipioMap
            .where((element) =>
                element['idCiudad'] == value &&
                element['idDpto'] == ref.watch(providerDepartamento))
            .first['ciudad']
            .toString()
            .trim());
        codeCityValue(value);
      },
      items: municipioMap
          .where(
              (element) => element['idDpto'] == ref.watch(providerDepartamento))
          .map(
            (e) => DropdownMenuItem<String>(
              value: e['idCiudad'].toString().trim(),
              child: Text(
                e['ciudad'].toString().trim(),
              ),
            ),
          )
          .toList(),
    );
  }
}

//Esta es la clase  del dropdown que contiene los valores para el
//departamento de colombia
class DropDownButtonFormFieldStateCo extends ConsumerWidget {
  final InputDecoration inputDecoration;
  //esta funcion retorna el valor del departamento elegido como un string
  final String? Function(String value) stringStateValue;
  final String? Function(String value) codeStateValue;
  final Widget? hint;
  final int elevation;
  final TextStyle? style;
  final Widget? icon;
  final Color? iconDisabledColor;
  final Color? iconEnabledColor;
  final double iconSize = 24.0;
  final bool isDense = true;
  final bool isExpanded = false;
  final double? itemHeight;
  final Color? focusColor;
  final FocusNode? focusNode;

  const DropDownButtonFormFieldStateCo({
    required this.stringStateValue,
    required this.codeStateValue,
    required this.inputDecoration,
    this.hint,
    this.elevation = 8,
    this.style,
    this.icon,
    this.iconDisabledColor,
    this.iconEnabledColor,
    this.itemHeight,
    this.focusColor,
    this.focusNode,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButtonFormField<String>(
      key: key,
      hint: hint,
      elevation: elevation,
      style: style,
      icon: icon,
      iconDisabledColor: iconDisabledColor,
      iconEnabledColor: iconEnabledColor,
      itemHeight: itemHeight,
      focusColor: focusColor,
      focusNode: focusNode,
      value: ref.watch(providerDepartamento),
      decoration: inputDecoration,
      onChanged: (value) {
        //se cambia el valor del dropdown segun el municipio seleccionado
        //Los providers se encargan de retornar el valor del dropdown
        ref.read(providerMunicipio.notifier).state = null;
        ref.read(providerDepartamento.notifier).state = value!;
        stringStateValue(departamentoMap
            .where((element) => element['idDpto'] == value)
            .first['departamento']!);
        codeStateValue(value);
      },
      items: getDepartamento(),
    );
  }
}
