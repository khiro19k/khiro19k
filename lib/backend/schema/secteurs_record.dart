import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SecteursRecord extends FirestoreRecord {
  SecteursRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "secteurs" field.
  List<String>? _secteurs;
  List<String> get secteurs => _secteurs ?? const [];
  bool hasSecteurs() => _secteurs != null;

  void _initializeFields() {
    _secteurs = getDataList(snapshotData['secteurs']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('secteurs');

  static Stream<SecteursRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SecteursRecord.fromSnapshot(s));

  static Future<SecteursRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SecteursRecord.fromSnapshot(s));

  static SecteursRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SecteursRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SecteursRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SecteursRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SecteursRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SecteursRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSecteursRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class SecteursRecordDocumentEquality implements Equality<SecteursRecord> {
  const SecteursRecordDocumentEquality();

  @override
  bool equals(SecteursRecord? e1, SecteursRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.secteurs, e2?.secteurs);
  }

  @override
  int hash(SecteursRecord? e) => const ListEquality().hash([e?.secteurs]);

  @override
  bool isValidKey(Object? o) => o is SecteursRecord;
}
