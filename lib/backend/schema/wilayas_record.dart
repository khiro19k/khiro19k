import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WilayasRecord extends FirestoreRecord {
  WilayasRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "wilayas" field.
  List<String>? _wilayas;
  List<String> get wilayas => _wilayas ?? const [];
  bool hasWilayas() => _wilayas != null;

  void _initializeFields() {
    _wilayas = getDataList(snapshotData['wilayas']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('wilayas');

  static Stream<WilayasRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WilayasRecord.fromSnapshot(s));

  static Future<WilayasRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WilayasRecord.fromSnapshot(s));

  static WilayasRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WilayasRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WilayasRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WilayasRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WilayasRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WilayasRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWilayasRecordData() {
  final firestoreData = mapToFirestore(
    <String, dynamic>{}.withoutNulls,
  );

  return firestoreData;
}

class WilayasRecordDocumentEquality implements Equality<WilayasRecord> {
  const WilayasRecordDocumentEquality();

  @override
  bool equals(WilayasRecord? e1, WilayasRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.wilayas, e2?.wilayas);
  }

  @override
  int hash(WilayasRecord? e) => const ListEquality().hash([e?.wilayas]);

  @override
  bool isValidKey(Object? o) => o is WilayasRecord;
}
