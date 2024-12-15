import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SoumissionWilayasRecord extends FirestoreRecord {
  SoumissionWilayasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "wilayas" field.
  List<String>? _wilayas;
  List<String> get wilayas => _wilayas ?? const [];
  bool hasWilayas() => _wilayas != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _wilayas = getDataList(snapshotData['wilayas']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('soumission_wilayas')
          : FirebaseFirestore.instance.collectionGroup('soumission_wilayas');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('soumission_wilayas').doc(id);

  static Stream<SoumissionWilayasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SoumissionWilayasRecord.fromSnapshot(s));

  static Future<SoumissionWilayasRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => SoumissionWilayasRecord.fromSnapshot(s));

  static SoumissionWilayasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SoumissionWilayasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SoumissionWilayasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SoumissionWilayasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SoumissionWilayasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SoumissionWilayasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSoumissionWilayasRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class SoumissionWilayasRecordDocumentEquality
    implements Equality<SoumissionWilayasRecord> {
  const SoumissionWilayasRecordDocumentEquality();

  @override
  bool equals(SoumissionWilayasRecord? e1, SoumissionWilayasRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.wilayas, e2?.wilayas);
  }

  @override
  int hash(SoumissionWilayasRecord? e) =>
      const ListEquality().hash([e?.wilayas]);

  @override
  bool isValidKey(Object? o) => o is SoumissionWilayasRecord;
}
