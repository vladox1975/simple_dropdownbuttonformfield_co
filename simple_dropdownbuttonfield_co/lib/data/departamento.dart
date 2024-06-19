import 'package:flutter/material.dart';

// Se construye la lista de elementos para el dropdown de departamentos
// El value es el valor con el que se buscarán los elementos de municipio coincidentes
// para el departamento
List<DropdownMenuItem<String>>? getDepartamento() {
  List<DropdownMenuItem<String>>? listaElementos = [];

  departamentoMap.asMap().forEach((key, value) {
    listaElementos.add(DropdownMenuItem<String>(
      value: value['idDpto']!.trim(),
      child: Text(value['departamento']!.trim()),
    ));
  });

  return listaElementos;
}

// Este map tiene la información de los departamentos de Colombia
// contiene el idDpto y el nombre del departamento segun la codificación DIVIPOLA
final departamentoMap = [
  {"idDpto": "91", "departamento": "AMAZONAS"},
  {"idDpto": "05", "departamento": "ANTIOQUIA"},
  {"idDpto": "81", "departamento": "ARAUCA"},
  {"idDpto": "88", "departamento": "ARCHIPIELAGO DE SAN ANDRES"},
  {"idDpto": "08", "departamento": "ATLANTICO"},
  {"idDpto": "11", "departamento": "BOGOTA, D.C."},
  {"idDpto": "13", "departamento": "BOLIVAR"},
  {"idDpto": "15", "departamento": "BOYACA"},
  {"idDpto": "17", "departamento": "CALDAS"},
  {"idDpto": "18", "departamento": "CAQUETA"},
  {"idDpto": "85", "departamento": "CASANARE"},
  {"idDpto": "19", "departamento": "CAUCA"},
  {"idDpto": "20", "departamento": "CESAR"},
  {"idDpto": "27", "departamento": "CHOCO"},
  {"idDpto": "23", "departamento": "CORDOBA"},
  {"idDpto": "25", "departamento": "CUNDINAMARCA"},
  {"idDpto": "94", "departamento": "GUAINIA"},
  {"idDpto": "95", "departamento": "GUAVIARE"},
  {"idDpto": "41", "departamento": "HUILA"},
  {"idDpto": "44", "departamento": "LA GUAJIRA"},
  {"idDpto": "47", "departamento": "MAGDALENA"},
  {"idDpto": "50", "departamento": "META"},
  {"idDpto": "52", "departamento": "NARIÑO"},
  {"idDpto": "54", "departamento": "NORTE DE SANTANDER"},
  {"idDpto": "86", "departamento": "PUTUMAYO"},
  {"idDpto": "63", "departamento": "QUINDIO"},
  {"idDpto": "66", "departamento": "RISARALDA"},
  {"idDpto": "68", "departamento": "SANTANDER"},
  {"idDpto": "70", "departamento": "SUCRE"},
  {"idDpto": "73", "departamento": "TOLIMA"},
  {"idDpto": "76", "departamento": "VALLE DEL CAUCA"},
  {"idDpto": "97", "departamento": "VAUPES"},
  {"idDpto": "99", "departamento": "VICHADA"}
];
