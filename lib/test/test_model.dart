import '/components/card22_double_line_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'test_widget.dart' show TestWidget;
import 'package:flutter/material.dart';

class TestModel extends FlutterFlowModel<TestWidget> {
  ///  State fields for stateful widgets in this page.

  // Models for Card22DoubleLine dynamic component.
  late FlutterFlowDynamicModels<Card22DoubleLineModel> card22DoubleLineModels;

  @override
  void initState(BuildContext context) {
    card22DoubleLineModels =
        FlutterFlowDynamicModels(() => Card22DoubleLineModel());
  }

  @override
  void dispose() {
    card22DoubleLineModels.dispose();
  }
}
