import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'atividade.dart';

class Banco{

  Future<Database>? banco;

  criarBanco() async {
    banco = openDatabase(
      join(await getDatabasesPath(), 'banco_atividades.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE atividade(id INTEGER PRIMARY KEY, urlImg TEXT, titulo TEXT, descricao TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> inserirAtividade(Atividade at) async {
    final db = await banco;

    // `conflictAlgorithm` caso a mesma atividade seja inserida duas vezes.
    // Neste caso, substitua quaisquer dados anteriores.
    await db!.insert('atividade', at.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Atividade>> listarAtividades() async {
    final db = await banco;

    // Consulta a tabela para todas as Atividades.
    final List<Map<String, dynamic>> maps = await db!.query('atividade');

    // Converte a List<Map<String, dynamic> dentro de uma List<Atividade>.
    return List.generate(maps.length, (i) {
      return Atividade(
        id: maps[i]['id'] as int,
        urlImg: maps[i]['urlImg'] as String,
        titulo: maps[i]['titulo'] as String,
        descricao: maps[i]['descricao'] as String
      );
    });
  }

  Future<void> atualizarAtividade(Atividade at) async {
    final db = await banco;

    await db!.update(
      'atividade',
      at.toMap(),
      where: 'id = ?',
      whereArgs: [at.id],
    );
  }

  Future<void> deletaAtividade(int id) async {
    final db = await banco;

    await db!.delete(
      'atividade',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}