import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gym_rats/data/data_training.dart';
import 'package:gym_rats/models/treinosModel.dart';
import 'package:http/http.dart' as http;

class Trainings with ChangeNotifier {
  final Map<String, Treino> _items = {...DUMMY_TRAINING};
  static const _baseUrl = 'https://gym-rats-42615-default-rtdb.firebaseio.com/';

  List<Treino> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  Treino byIndex(int i) {
    return _items.values.elementAt(i);
  }

  Future<void> put(Treino treino) async {
    if (treino == null) {
      return;
    }
    final response = await http.post(
      "$_baseUrl/treinos.json",
      body: json.encode({
        'nome': treino.nome,
        'grupoMuscular': treino.grupoMuscular,
        'repeticoes': treino.repeticoes,
        'series': treino.series,
        'descanso': treino.descanso,
      }),
    );

    final id = json.decode(response.body)['nome'];

    print(json.decode(response.body));

    _items.putIfAbsent(
        id,
        () => Treino(
            idTreino: id,
            nome: treino.nome,
            grupoMuscular: treino.grupoMuscular,
            repeticoes: treino.repeticoes,
            series: treino.series,
            descanso: treino.descanso));

    notifyListeners();
  }

  Future<void> remove(Treino treino) async {
    if (treino != null && treino.idTreino != null) {
      await http.delete(
        "$_baseUrl/treinos/${treino.idTreino}.json",
      );
      _items.remove(treino.idTreino);
      notifyListeners();
    }
  }
}
