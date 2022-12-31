import 'dart:html';

import 'package:flutter/material.dart';

class Area extends StatelessWidget {
  final _textcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastramento de área'.toString()),
      ),
      backgroundColor: Colors.blue[50],
        body: Padding(
        padding: const EdgeInsets.all(20,0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            TextField(
                controller: _textcontroller,
                decoration: const InputDecoration(
                hintText: ('Informe o nome da Área'),
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: (){
                    _textcontroller.clear()

                  }
                  icon: const Icon(Icons.clear),
                )
              ),
            )
          ],
        ),

      )
