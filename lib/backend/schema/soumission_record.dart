import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SoumissionRecord extends FirestoreRecord {
  SoumissionRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "advertiser" field.
  String? _advertiser;
  String get advertiser => _advertiser ?? '';
  bool hasAdvertiser() => _advertiser != null;

  // "soumission_title" field.
  String? _soumissionTitle;
  String get soumissionTitle => _soumissionTitle ?? '';
  bool hasSoumissionTitle() => _soumissionTitle != null;

  // "soumission_discription_total" field.
  String? _soumissionDiscriptionTotal;
  String get soumissionDiscriptionTotal => _soumissionDiscriptionTotal ?? '';
  bool hasSoumissionDiscriptionTotal() => _soumissionDiscriptionTotal != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "localisation" field.
  String? _localisation;
  String get localisation => _localisation ?? '';
  bool hasLocalisation() => _localisation != null;

  // "localisation_url" field.
  String? _localisationUrl;
  String get localisationUrl => _localisationUrl ?? '';
  bool hasLocalisationUrl() => _localisationUrl != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "wilaya" field.
  String? _wilaya;
  String get wilaya => _wilaya ?? '';
  bool hasWilaya() => _wilaya != null;

  // "secteur" field.
  String? _secteur;
  String get secteur => _secteur ?? '';
  bool hasSecteur() => _secteur != null;

  // "pdf" field.
  String? _pdf;
  String get pdf => _pdf ?? '';
  bool hasPdf() => _pdf != null;

  void _initializeFields() {
    _advertiser = snapshotData['advertiser'] as String?;
    _soumissionTitle = snapshotData['soumission_title'] as String?;
    _soumissionDiscriptionTotal =
        snapshotData['soumission_discription_total'] as String?;
    _phone = snapshotData['phone'] as String?;
    _date = snapshotData['date'] as String?;
    _localisation = snapshotData['localisation'] as String?;
    _localisationUrl = snapshotData['localisation_url'] as String?;
    _title = snapshotData['title'] as String?;
    _wilaya = snapshotData['wilaya'] as String?;
    _secteur = snapshotData['secteur'] as String?;
    _pdf = snapshotData['pdf'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('soumission');

  static Stream<SoumissionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SoumissionRecord.fromSnapshot(s));

  static Future<SoumissionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SoumissionRecord.fromSnapshot(s));

  static SoumissionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SoumissionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SoumissionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SoumissionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SoumissionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SoumissionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSoumissionRecordData({
  String? advertiser,
  String? soumissionTitle,
  String? soumissionDiscriptionTotal,
  String? phone,
  String? date,
  String? localisation,
  String? localisationUrl,
  String? title,
  String? wilaya,
  String? secteur,
  String? pdf,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'advertiser': advertiser,
      'soumission_title': soumissionTitle,
      'soumission_discription_total': soumissionDiscriptionTotal,
      'phone': phone,
      'date': date,
      'localisation': localisation,
      'localisation_url': localisationUrl,
      'title': title,
      'wilaya': wilaya,
      'secteur': secteur,
      'pdf': pdf,
    }.withoutNulls,
  );

  return firestoreData;
}

class SoumissionRecordDocumentEquality implements Equality<SoumissionRecord> {
  const SoumissionRecordDocumentEquality();

  @override
  bool equals(SoumissionRecord? e1, SoumissionRecord? e2) {
    return e1?.advertiser == e2?.advertiser &&
        e1?.soumissionTitle == e2?.soumissionTitle &&
        e1?.soumissionDiscriptionTotal == e2?.soumissionDiscriptionTotal &&
        e1?.phone == e2?.phone &&
        e1?.date == e2?.date &&
        e1?.localisation == e2?.localisation &&
        e1?.localisationUrl == e2?.localisationUrl &&
        e1?.title == e2?.title &&
        e1?.wilaya == e2?.wilaya &&
        e1?.secteur == e2?.secteur &&
        e1?.pdf == e2?.pdf;
  }

  @override
  int hash(SoumissionRecord? e) => const ListEquality().hash([
        e?.advertiser,
        e?.soumissionTitle,
        e?.soumissionDiscriptionTotal,
        e?.phone,
        e?.date,
        e?.localisation,
        e?.localisationUrl,
        e?.title,
        e?.wilaya,
        e?.secteur,
        e?.pdf
      ]);

  @override
  bool isValidKey(Object? o) => o is SoumissionRecord;
}
