import 'dart:async';
import 'dart:io' as io;
import 'package:first_project/propriedade.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'propriedade.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;
  static Database? _db;

  DatabaseHelper.internal();

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "db_databox.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tb_usuario (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        nome TEXT NOT NULL, 
        email TEXT NOT NULL, 
        senha TEXT NOT NULL, 
        celular TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE tb_propriedade (
        id INTEGER PRIMARY KEY AUTOINCREMENT, 
        nome TEXT NOT NULL, 
        descricao TEXT NOT NULL, 
        tipoSolo TEXT NOT NULL
      )
    ''');
  }

  // Função saveUser para inserir um novo usuário no banco de dados
  Future<int> saveUser(Map<String, dynamic> user) async {
    var dbClient = await db;
    int res = await dbClient!.insert("tb_usuario", user);
    return res;
  }

  // Função para recuperar um usuário pelo e-mail
  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    var dbClient = await db;
    List<Map<String, dynamic>> result = await dbClient!
        .query("tb_usuario", where: "email = ?", whereArgs: [email]);

    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  // Função para salvar uma nova propriedade no banco de dados
  Future<int> savePropriedade(Propriedade propriedade) async {
    var dbClient = await db;
    int res = await dbClient!.insert("tb_propriedade", propriedade.toMap());
    return res;
  }

  // Função para recuperar todas as propriedades cadastradas no banco de dados
  Future<List<Propriedade>> getPropriedades() async {
    var dbClient = await db;
    List<Map<String, dynamic>> result = await dbClient!.query("tb_propriedade");

    List<Propriedade> propriedades = [];
    result.forEach((map) {
      propriedades.add(Propriedade.fromMap(map));
    });

    return propriedades;
  }

  // Função para atualizar uma propriedade existente no banco de dados
  Future<int> updatePropriedade(Propriedade propriedade) async {
    var dbClient = await db;
    int res = await dbClient!.update(
      "tb_propriedade",
      propriedade.toMap(),
      where: "id = ?",
      whereArgs: [propriedade.id],
    );
    return res;
  }

  // Função paradeletar uma propriedade do banco de dados
  Future<int> deletePropriedade(int id) async {
    var dbClient = await db;
    int res = await dbClient!.delete(
      "tb_propriedade",
      where: "id = ?",
      whereArgs: [id],
    );
    return res;
  }
}
