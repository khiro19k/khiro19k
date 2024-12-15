import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "is_admin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "membershipstatus" field.
  String? _membershipstatus;
  String get membershipstatus => _membershipstatus ?? '';
  bool hasMembershipstatus() => _membershipstatus != null;

  // "nomreeal" field.
  String? _nomreeal;
  String get nomreeal => _nomreeal ?? '';
  bool hasNomreeal() => _nomreeal != null;

  // "poste" field.
  String? _poste;
  String get poste => _poste ?? '';
  bool hasPoste() => _poste != null;

  // "num" field.
  String? _num;
  String get num => _num ?? '';
  bool hasNum() => _num != null;

  // "nom_entrprise" field.
  String? _nomEntrprise;
  String get nomEntrprise => _nomEntrprise ?? '';
  bool hasNomEntrprise() => _nomEntrprise != null;

  // "wilayade" field.
  String? _wilayade;
  String get wilayade => _wilayade ?? '';
  bool hasWilayade() => _wilayade != null;

  // "photodepaiment" field.
  String? _photodepaiment;
  String get photodepaiment => _photodepaiment ?? '';
  bool hasPhotodepaiment() => _photodepaiment != null;

  // "demandtime" field.
  DateTime? _demandtime;
  DateTime? get demandtime => _demandtime;
  bool hasDemandtime() => _demandtime != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _password = snapshotData['password'] as String?;
    _isAdmin = snapshotData['is_admin'] as bool?;
    _membershipstatus = snapshotData['membershipstatus'] as String?;
    _nomreeal = snapshotData['nomreeal'] as String?;
    _poste = snapshotData['poste'] as String?;
    _num = snapshotData['num'] as String?;
    _nomEntrprise = snapshotData['nom_entrprise'] as String?;
    _wilayade = snapshotData['wilayade'] as String?;
    _photodepaiment = snapshotData['photodepaiment'] as String?;
    _demandtime = snapshotData['demandtime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? phoneNumber,
  String? uid,
  DateTime? createdTime,
  String? password,
  bool? isAdmin,
  String? membershipstatus,
  String? nomreeal,
  String? poste,
  String? num,
  String? nomEntrprise,
  String? wilayade,
  String? photodepaiment,
  DateTime? demandtime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'phone_number': phoneNumber,
      'uid': uid,
      'created_time': createdTime,
      'password': password,
      'is_admin': isAdmin,
      'membershipstatus': membershipstatus,
      'nomreeal': nomreeal,
      'poste': poste,
      'num': num,
      'nom_entrprise': nomEntrprise,
      'wilayade': wilayade,
      'photodepaiment': photodepaiment,
      'demandtime': demandtime,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.password == e2?.password &&
        e1?.isAdmin == e2?.isAdmin &&
        e1?.membershipstatus == e2?.membershipstatus &&
        e1?.nomreeal == e2?.nomreeal &&
        e1?.poste == e2?.poste &&
        e1?.num == e2?.num &&
        e1?.nomEntrprise == e2?.nomEntrprise &&
        e1?.wilayade == e2?.wilayade &&
        e1?.photodepaiment == e2?.photodepaiment &&
        e1?.demandtime == e2?.demandtime;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.phoneNumber,
        e?.uid,
        e?.createdTime,
        e?.password,
        e?.isAdmin,
        e?.membershipstatus,
        e?.nomreeal,
        e?.poste,
        e?.num,
        e?.nomEntrprise,
        e?.wilayade,
        e?.photodepaiment,
        e?.demandtime
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
