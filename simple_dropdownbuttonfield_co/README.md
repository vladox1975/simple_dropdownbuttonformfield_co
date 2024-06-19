

Esta librería permite implementar rapidamente dos controles DropDownButtonFormField que contengan los departamentos de Colombia y sus municipios.

## Features

Esta libreria usas dos Widget que retornan con la función stringState los valores de la selección del departamento y el municipio Colombiano.

[![Video demostración](https://net.subastar.com.co/dropdown.png)](https://youtu.be/8bbbpTKveCM)


## Getting started

¡IMPORTANTE!
Este paquete está optimizado con Provider (Riverpod),

Importe el paquete en su pubspec.yaml

flutter_riverpod: ^2.5.1

En el main.dart envuelva su "MainApp()" con un Provider Scope

```dart
runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
```

## Usage


```dart
 body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropDownButtonFormFieldStateCo(
              inputDecoration: inputDecoration(label: 'Departamento'),
              stringState: (value) => departamento = value,
            ),
            DropDownButtonFormFieldCityCo(
              inputDecoration: inputDecoration(label: 'Municipio'),
              stringState: (value) => municipio = value,
            ),
          ],
        ),
      ),;
```
