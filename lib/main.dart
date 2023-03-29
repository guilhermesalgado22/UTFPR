import 'package:flutter/material.dart';
import 'cadastro.dart';
import 'home.dart';
import 'recuperacaodesenha.dart';

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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tela de Login')),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Adicione a imagem de fundo como primeiro elemento do Stack
            Container(
              height: MediaQuery.of(context).size.height,
              // ignore: prefer_const_constructors
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/milho.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Inclua o conteúdo do formulário como segundo elemento do Stack
            Container(
              padding: EdgeInsets.only(top: 130, left: 40, right: 40),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      textAlign:
                          TextAlign.center, // Alinha o texto digitado no centro
                      decoration: InputDecoration(
                        hintText: 'Login',
                        hintStyle: TextStyle(
                          color: Colors.black, // Escolha a cor que desejar
                        ),
                        filled: true, // Habilita o preenchimento do campo
                        fillColor: Colors
                            .white, // Define a cor de preenchimento como branco
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none, // Cantos arredondados
                        ),
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
                    const SizedBox(height: 16.0),
                    TextFormField(
                      textAlign: TextAlign.center,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        hintText: 'Senha',
                        hintStyle: TextStyle(
                          color: Colors.black, // Escolha a cor que desejar
                        ),
                        filled: true, // Habilita o preenchimento do campo
                        fillColor: Colors
                            .white, // Define a cor de preenchimento como branco
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none, // Cantos arredondados
                        ),
                      ),

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
                    const SizedBox(height: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                            const Text(
                              'Continuar logado',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RecuperacaoDeSenha()),
                                );
                              },
                              child: Text(
                                'Esqueci minha senha',
                                style: TextStyle(
                                  color: Colors.yellow,
                                  // outros campos de estilo
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Cadastro()),
                                );
                              },
                              child: Text(
                                'Não Tenho Cadastro',
                                style: TextStyle(
                                  color: Colors.yellow,
                                  // outros campos de estilo
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _signIn(_username, _password);
                        }
                      },
                      child: const Text('Entrar'),
                    ),
                    const SizedBox(height: 16.0),
                    Text(_status),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
