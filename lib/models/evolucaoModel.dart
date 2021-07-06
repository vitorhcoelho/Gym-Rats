import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:gym_rats/models/evolucao.dart';
import 'package:gym_rats/models/grupoMuscularGrafico.dart';
import 'package:scoped_model/scoped_model.dart';

class EvolucaoModel extends Model {
  String mensagem;
  List<Evolucao> evolucaoLista = [];
  bool isLoading = false;
  String uid;

  EvolucaoModel(user) {
    this.uid = user.uid;
    _loadEvolucao();
    _procuraMeta();
  }

  static EvolucaoModel of(BuildContext context) =>
      ScopedModel.of<EvolucaoModel>(context);

  void addEvolucao(evolucao) {
    Firestore.instance
        .collection("users")
        .document(this.uid)
        .collection("evolucao")
        .add(evolucao)
        .then((doc) {
      Evolucao e = new Evolucao();
      e.data = evolucao['data'];
      e.peso = evolucao['peso'];
      e.descricao = evolucao['descricao'];
      e.id = doc.documentID;
      evolucaoLista.add(e);
    });
    Firestore.instance
        .collection("users")
        .document(this.uid)
        .updateData({'peso': double.parse(evolucao['peso'])});
    notifyListeners();
  }

  void alteraMeta(meta, tipoMeta) {
    Firestore.instance
        .collection("users")
        .document(this.uid)
        .updateData({'meta': meta, 'tipo_meta': tipoMeta});
    notifyListeners();
  }

  void addMeta(meta) {
    String tipoMeta;
    Firestore.instance
        .collection("users")
        .document(this.uid)
        .get()
        .then((value) => {
              if (value['peso'] > meta)
                {tipoMeta = 'perda', alteraMeta(meta, tipoMeta)}
              else
                {tipoMeta = 'ganho', alteraMeta(meta, tipoMeta)}
            });
  }

  void removeEvolucao(Evolucao evolucao) {
    Firestore.instance
        .collection("users")
        .document(this.uid)
        .collection("evolucao")
        .document(evolucao.id)
        .delete();

    evolucaoLista.remove(evolucao);

    notifyListeners();
  }

  void _loadEvolucao() async {
    QuerySnapshot query = await Firestore.instance
        .collection("users")
        .document(this.uid)
        .collection("evolucao")
        .getDocuments();

    evolucaoLista =
        query.documents.map((doc) => Evolucao.fromDocument(doc)).toList();

    notifyListeners();
  }

  void _procuraMeta() {
    var peso, meta, tipo;
    Firestore.instance
        .collection("users")
        .document(this.uid)
        .get()
        .then((value) {
      peso = value['peso'];
      meta = value['meta'];
      tipo = value['tipo_meta'];
      if (tipo == 'ganho') {
        if (meta > peso) {
          mensagem = 'Ainda falta ganhar ' +
              (meta - peso).toString() +
              'kg para você alcançar sua meta';
        } else {
          mensagem = 'Você atingiu sua meta e está pesando ' +
              (peso).toString() +
              'kg!!';
        }
      } else {
        if (peso > meta) {
          mensagem = 'Ainda falta perder ' +
              (peso - meta).toStringAsPrecision(2) +
              'kg para você alcançar sua meta';
        } else {
          mensagem = 'Você atingiu sua meta e está pesando ' +
              (peso).toStringAsPrecision(2) +
              'kg!!';
        }
      }
    });
  }
}
