import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseAPI {
  FirebaseFirestore _fs = FirebaseFirestore.instance;

  Future<CollectionReference> getUsuario() async {
    return _fs.collection('usuarios');
  }

  Future<QuerySnapshot> getGruposMusculares() async {
    return _fs.collection('grupos_musculares').get();
  }
}
