import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Este provider se encarga de retornar el valor del dropdown para el valor del departamento
final providerDepartamento = StateProvider<String?>(
  (ref) => null,
);

// Este provider se encarga de retornar el valor del dropdown para el valor del municipio
final providerMunicipio = StateProvider<String?>(
  (ref) => null,
);

// es es un dropDropdownItem para el municipio inicial
// Se utiliza un elemento
final dropDownItemMunicipioProvider =
    StateProvider<List<DropdownMenuItem<String>>?>(
  (ref) => const [
    DropdownMenuItem<String>(
      value: null,
      child: Text('Seleccione una ciudad'),
    ),
  ],
);
