import 'package:flutter/material.dart';

class TituloListComponent extends StatelessWidget {
  String titulo;
  TituloListComponent({Key? key, required this.titulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Text(titulo,
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
    );
  }
}
