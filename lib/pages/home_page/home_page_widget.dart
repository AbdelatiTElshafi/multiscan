import '/components/card22_double_line_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  static String routeName = 'HomePage';
  static String routePath = '/homePage';

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Page Title',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  font: GoogleFonts.interTight(
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                  ),
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).headlineMedium.fontWeight,
                  fontStyle:
                      FlutterFlowTheme.of(context).headlineMedium.fontStyle,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Container(
                          width: double.infinity,
                          height: 300.0,
                          child: custom_widgets.MultiBarcodeScanner(
                            width: double.infinity,
                            height: 300.0,
                            onSubmit: () async {
                              context.pushNamed(TestWidget.routeName);
                            },
                            onScanAction: (scannedCodes) async {
                              FFAppState().scannedCodes1 =
                                  scannedCodes.toList().cast<String>();
                              safeSetState(() {});
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SafeArea(
                        child: Container(
                          width: double.infinity,
                          height: 327.6,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Builder(
                              builder: (context) {
                                final hh = FFAppState().scannedCodes1.toList();

                                return ListView.separated(
                                  padding: EdgeInsets.symmetric(vertical: 0.0),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: hh.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 0.0),
                                  itemBuilder: (context, hhIndex) {
                                    final hhItem = hh[hhIndex];
                                    return wrapWithModel(
                                      model: _model.card22DoubleLineModels
                                          .getModel(
                                        FFAppState()
                                            .scannedCodes1
                                            .elementAtOrNull(hhIndex)!,
                                        hhIndex,
                                      ),
                                      updateCallback: () => safeSetState(() {}),
                                      child: Card22DoubleLineWidget(
                                        key: Key(
                                          'Keyqh0_${FFAppState().scannedCodes1.elementAtOrNull(hhIndex)!}',
                                        ),
                                        serial: FFAppState()
                                            .scannedCodes1
                                            .elementAtOrNull(hhIndex)!,
                                        batch: FFAppState()
                                            .scannedCodes1
                                            .elementAtOrNull(hhIndex)!,
                                        no: hhIndex,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          FFAppState().addToScannedCodes1('888');
                          safeSetState(() {});
                        },
                        text: 'Button',
                        options: FFButtonOptions(
                          height: 40.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: FlutterFlowTheme.of(context).primary,
                          textStyle:
                              FlutterFlowTheme.of(context).titleSmall.override(
                                    font: GoogleFonts.interTight(
                                      fontWeight: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontWeight,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .fontStyle,
                                    ),
                                    color: Colors.white,
                                    letterSpacing: 0.0,
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .fontStyle,
                                  ),
                          elevation: 0.0,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ],
                  ),
                ].divide(SizedBox(height: 2.0)).around(SizedBox(height: 2.0)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
