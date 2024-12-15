import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SoumissionSecteursRecord extends FirestoreRecord {
  SoumissionSecteursRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "secteurs" field.
  List<String>? _secteurs;
  List<String> get secteurs => _secteurs ?? const [];
  bool hasSecteurs() => _secteurs != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _secteurs = getDataList(snapshotData['secteurs']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('soumission_secteurs')
          : FirebaseFirestore.instance.collectionGroup('soumission_secteurs');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('soumission_secteurs').doc(id);

  static Stream<SoumissionSecteursRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SoumissionSecteursRecord.fromSnapshot(s));

  static Future<SoumissionSecteursRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SoumissionSecteursRecord.fromSnapshot(s));

  static SoumissionSecteursRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SoumissionSecteursRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SoumissionSecteursRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SoumissionSecteursRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SoumissionSecteursRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SoumissionSecteursRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSoumissionSecteursRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class SoumissionSecteursRecordDocumentEquality
    implements Equality<SoumissionSecteursRecord> {
  const SoumissionSecteursRecordDocumentEquality();

  @override
  bool equals(SoumissionSecteursRecord? e1, SoumissionSecteursRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.secteurs, e2?.secteurs);
  }

  @override
  int hash(SoumissionSecteursRecord? e) =>
      const ListEquality().hash([e?.secteurs]);

  @override
  bool isValidKey(Object? o) => o is SoumissionSecteursRecord;
}
