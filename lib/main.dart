import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _keepLoggedIn = false;
  String _username = '';
  String _password = '';
  String _status = '';

  void _signIn(String username, String password) {
    // Substitua estas credenciais pelas credenciais reais do usuário (ex.: consultando um banco de dados ou fazendo uma chamada de API)
    const validUsername = 'usuario';
    const validPassword = 'senha';

    if (username == validUsername && password == validPassword) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } else {
      setState(() {
        _status = 'Usuário ou senha incorretos';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tela de Login')),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 130, left: 40, right: 40),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Login',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _username = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira seu login';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 45.0),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),
                  obscureText: true,
                  onChanged: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira sua senha';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                Row(
                  children: [
                    Checkbox(
                      value: _keepLoggedIn,
                      onChanged: (bool? value) {
                        setState(() {
                          _keepLoggedIn = value!;
                        });
                      },
                    ),
                    Text('Continuar logado'),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Ação para "Esqueci minha senha"
                  },
                  child: Text('Esqueci minha senha'),
                ),
                TextButton(
                  onPressed: () {
                    // Ação para "Esqueci minha senha"
                  },
                  child: Text('Realizar'),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _signIn(_username, _password);
                    }
                  },
                  child: Text('Entrar'),
                ),
                SizedBox(height: 16.0),
                Text(_status),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
