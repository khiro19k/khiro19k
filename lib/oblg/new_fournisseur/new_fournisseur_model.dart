import '/flutter_flow/flutter_flow_util.dart';
import 'new_fournisseur_widget.dart' show NewFournisseurWidget;
import 'package:flutter/material.dart';

class NewFournisseurModel extends FlutterFlowModel<NewFournisseurWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for fornisseurname widget.
  FocusNode? fornisseurnameFocusNode;
  TextEditingController? fornisseurnameTextController;
  String? Function(BuildContext, String?)?
      fornisseurnameTextControllerValidator;
  // State field(s) for DESCRIPTION widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for localisation widget.
  FocusNode? localisationFocusNode;
  TextEditingController? localisationTextController;
  String? Function(BuildContext, String?)? localisationTextControllerValidator;
  // State field(s) for date widget.
  FocusNode? dateFocusNode;
  TextEditingController? dateTextController;
  String? Function(BuildContext, String?)? dateTextControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  List<FFUploadedFile> uploadedLocalFiles2 = [];
  List<String> uploadedFileUrls2 = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    fornisseurnameFocusNode?.dispose();
    fornisseurnameTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    localisationFocusNode?.dispose();
    localisationTextController?.dispose();

    dateFocusNode?.dispose();
    dateTextController?.dispose();
  }
}
