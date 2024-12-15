import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FournisseurRecord extends FirestoreRecord {
  FournisseurRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "localisation" field.
  String? _localisation;
  String get localisation => _localisation ?? '';
  bool hasLocalisation() => _localisation != null;

  // "details" field.
  String? _details;
  String get details => _details ?? '';
  bool hasDetails() => _details != null;

  // "image_fournisseur" field.
  String? _imageFournisseur;
  String get imageFournisseur => _imageFournisseur ?? '';
  bool hasImageFournisseur() => _imageFournisseur != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "product_img" field.
  List<String>? _productImg;
  List<String> get productImg => _productImg ?? const [];
  bool hasProductImg() => _productImg != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _localisation = snapshotData['localisation'] as String?;
    _details = snapshotData['details'] as String?;
    _imageFournisseur = snapshotData['image_fournisseur'] as String?;
    _date = snapshotData['date'] as String?;
    _productImg = getDataList(snapshotData['product_img']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('fournisseur');

  static Stream<FournisseurRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FournisseurRecord.fromSnapshot(s));

  static Future<FournisseurRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FournisseurRecord.fromSnapshot(s));

  static FournisseurRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FournisseurRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FournisseurRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FournisseurRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FournisseurRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FournisseurRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFournisseurRecordData({
  String? name,
  String? localisation,
  String? details,
  String? imageFournisseur,
  String? date,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'localisation': localisation,
      'details': details,
      'image_fournisseur': imageFournisseur,
      'date': date,
    }.withoutNulls,
  );

  return firestoreData;
}

class FournisseurRecordDocumentEquality implements Equality<FournisseurRecord> {
  const FournisseurRecordDocumentEquality();

  @override
  bool equals(FournisseurRecord? e1, FournisseurRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.localisation == e2?.localisation &&
        e1?.details == e2?.details &&
        e1?.imageFournisseur == e2?.imageFournisseur &&
        e1?.date == e2?.date &&
        listEquality.equals(e1?.productImg, e2?.productImg);
  }

  @override
  int hash(FournisseurRecord? e) => const ListEquality().hash([
        e?.name,
        e?.localisation,
        e?.details,
        e?.imageFournisseur,
        e?.date,
        e?.productImg
      ]);

  @override
  bool isValidKey(Object? o) => o is FournisseurRecord;
}
