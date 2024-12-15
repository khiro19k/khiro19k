import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'new_post_widget.dart' show NewPostWidget;
import 'package:flutter/material.dart';

class NewPostModel extends FlutterFlowModel<NewPostWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for titleprin widget.
  FocusNode? titleprinFocusNode;
  TextEditingController? titleprinTextController;
  String? Function(BuildContext, String?)? titleprinTextControllerValidator;
  // State field(s) for TITLE widget.
  FocusNode? titleFocusNode;
  TextEditingController? titleTextController;
  String? Function(BuildContext, String?)? titleTextControllerValidator;
  // State field(s) for DESCRIPTION widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionTextController;
  String? Function(BuildContext, String?)? descriptionTextControllerValidator;
  // State field(s) for announceur widget.
  FocusNode? announceurFocusNode;
  TextEditingController? announceurTextController;
  String? Function(BuildContext, String?)? announceurTextControllerValidator;
  // State field(s) for localisation widget.
  FocusNode? localisationFocusNode;
  TextEditingController? localisationTextController;
  String? Function(BuildContext, String?)? localisationTextControllerValidator;
  // State field(s) for localisation_url widget.
  FocusNode? localisationUrlFocusNode;
  TextEditingController? localisationUrlTextController;
  String? Function(BuildContext, String?)?
      localisationUrlTextControllerValidator;
  // State field(s) for num widget.
  FocusNode? numFocusNode;
  TextEditingController? numTextController;
  String? Function(BuildContext, String?)? numTextControllerValidator;
  // State field(s) for WILAYYAS widget.
  String? wilayyasValue;
  FormFieldController<String>? wilayyasValueController;
  // State field(s) for SeEcteurs widget.
  String? seEcteursValue;
  FormFieldController<String>? seEcteursValueController;
  // State field(s) for date widget.
  FocusNode? dateFocusNode;
  TextEditingController? dateTextController;
  String? Function(BuildContext, String?)? dateTextControllerValidator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    titleprinFocusNode?.dispose();
    titleprinTextController?.dispose();

    titleFocusNode?.dispose();
    titleTextController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionTextController?.dispose();

    announceurFocusNode?.dispose();
    announceurTextController?.dispose();

    localisationFocusNode?.dispose();
    localisationTextController?.dispose();

    localisationUrlFocusNode?.dispose();
    localisationUrlTextController?.dispose();

    numFocusNode?.dispose();
    numTextController?.dispose();

    dateFocusNode?.dispose();
    dateTextController?.dispose();
  }
}
