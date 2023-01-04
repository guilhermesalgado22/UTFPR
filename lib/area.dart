import 'dart:ui';

import 'package:first_project/map.page.dart';
import 'package:first_project/map.page.dart';
import 'package:flutter/material.dart'
    show
        AppBar,
        BorderRadius,
        BorderSide,
        BuildContext,
        Colors,
        Column,
        Container,
        EdgeInsets,
        FloatingActionButton,
        Icon,
        IconButton,
        Icons,
        InputBorder,
        InputDecoration,
        MainAxisAlignment,
        MaterialPageRoute,
        Navigator,
        OutlineInputBorder,
        Padding,
        Row,
        Scaffold,
        StatelessWidget,
        Text,
        TextButton,
        TextEditingController,
        TextField,
        TextStyle,
        Widget;

class Area extends StatelessWidget {
  final _textcontroller = TextEditingController();
  final _textcontroller2 = TextEditingController();

  Area({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastramento de área'.toString()),
        leading: Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Icon(Icons.arrow_back),
            ]),
      ),
      backgroundColor: Colors.blue[50],
      body: Container(
        padding: const EdgeInsets.all(50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            TextField(
              controller: _textcontroller,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
                hintText: 'Nome Da Área a Ser Cadastrada',
                labelText: 'Área',
                // ignore: prefer_const_constructors
                labelStyle: TextStyle(
                  height: 1,
                  fontSize: 20,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    _textcontroller.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(50),
                child: TextField(
                  controller: _textcontroller2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40)),
                    hintText: 'Tipo de Área',
                    labelText: 'Tipo',
                    // ignore: prefer_const_constructors
                    labelStyle: TextStyle(
                      height: 1,
                      fontSize: 20,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        _textcontroller.clear();
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(0),
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 20, 160, 2),
                      elevation: 15,
                      shadowColor: Colors.green),
                  // ignore: prefer_const_constructors
                  child: Text(
                    'Salvar',
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  // ignore: prefer_const_literals_to_create_immutables
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MapPage()),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
