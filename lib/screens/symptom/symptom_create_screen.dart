import 'package:flutter/material.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:intl/intl.dart';

import 'package:bitmec/my_theme.dart';
import 'package:bitmec/components.dart';
import 'package:bitmec/models.dart';
import 'package:bitmec/providers.dart';

class SymptomCreateScreen extends StatefulWidget {
  static const routeName = '/symptom/create';

  @override
  _SymptomCreateScreenState createState() => _SymptomCreateScreenState();
}

class _SymptomCreateScreenState extends State<SymptomCreateScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Map _arguments;
  SymptomProvider _provider;
  ConsultationProvider _consultationProvider;

  int _sectionSelected = 0;
  final _sectionsLen = 3;

  int _symptomSelected;
  final _symptoms = <Map<String, dynamic>>[
    {'id': 1, 'name': 'Ardor'},
    {'id': 2, 'name': 'Cansancio'},
    {'id': 3, 'name': 'Dolor'},
    {'id': 4, 'name': 'Dormido'},
    {'id': 5, 'name': 'Hormigueo'},
    {'id': 6, 'name': 'Inflamación'},
    {'id': 7, 'name': 'Nausea'},
    {'id': 8, 'name': 'Palpitaciones'},
  ];

  InAppWebViewController _webViewCtrl;
  int _bodyPartSelected;
  bool _sideSelected = true;

  double _magnitude = 0.0;
  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    if (_arguments == null) {
      setState(() {
        _arguments = ModalRoute.of(context).settings.arguments;

        if (_arguments['method'] == 'update') {
          Symptom symptom = _arguments['symptom'];
          _symptomSelected = symptom.type;
          _bodyPartSelected = symptom.location;
          _magnitude = symptom.severity.toDouble();
          _date = DateTime.parse(symptom.onset);
        }
      });
    }

    if (_provider == null) {
      setState(() {
        _provider = SymptomProvider.of(context);
      });
    }

    if (_consultationProvider == null) {
      setState(() {
        _consultationProvider = ConsultationProvider.of(context);
      });
    }

    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(context),
      backgroundColor: MyTheme.white,
      floatingActionButton: _sectionSelected == _sectionsLen - 1
        ? null : _buildFloatingActionButton(context),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return MyAppBar(
      title: 'Create',
      scaffoldKey: _scaffoldKey,
      backLeading: true,
      actions: _arguments['method'] != 'update' ? null
        : <Widget>[
          IconButton(
            icon: Icon(Icons.delete),
            tooltip: 'Eliminar',
            onPressed: () { _confirmDelete(context); },
          )
      ],
    );
  }

  void _confirmDelete(context) async {
    bool response = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Confirmar'),
          content: Text('¿Estas seguro de querer eliminar este dato?'),
          actions: <Widget>[
            FlatButton(
              splashColor: Colors.black12,
              child: Text('Aceptar'),
              onPressed: () {
                Symptom symptom = _arguments['symptom'];
                _provider.remove(symptom.id, (id) {
                  _consultationProvider.removeSymptom(id);
                  Navigator.pop(context, true);
                });
              },
            ),

            RaisedButton(
              color: MyTheme.red,
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.pop(context, false);
              },
            )
          ],
        )
    );

    if (response == true) {
      Navigator.pop(context);
    }
  }

  Widget _buildFloatingActionButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.navigate_next),
      backgroundColor: MyTheme.skyBlue,
      onPressed: () {
        if (_sectionSelected == _sectionsLen - 1) return;

        setState(() {
          _sectionSelected += 1;
        });
      },
    );
  }

  Widget _buildBody(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: SingleChildScrollView(
          child: Builder(builder: (context) {
            switch (_sectionSelected) {
              case 0: return _buildSymptomSection(context);
              case 1: return _buildSelectBodyPartSection(context);
              case 2: return _buildDetailSection(context);

              default: return Container(
                child: Text('This section not exists'),
              );
            }
          }),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    if (_sectionSelected == 0) {
      return true;
    } else {
      setState(() {
        _sectionSelected -= 1;
      });

      return false;
    }
  }

  Widget _buildSymptomSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _symptoms.map((symptom) => GestureDetector(
          onTap: () {
            setState(() {
              _symptomSelected = symptom['id'];
            });
          },

          child: Builder(builder: (context) {
            final isCurrentSelected = _symptomSelected == symptom['id'];

            final decoration = BoxDecoration(
              color: isCurrentSelected ? Colors.orange : null,
              border: isCurrentSelected ? null : Border.all(width: 1.0),
              borderRadius: BorderRadius.all(Radius.circular(3.0)),
            );

            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 6),
              decoration: decoration,
              child: Text(symptom['name'], style: TextStyle(
                fontSize: 16.0,
                color: isCurrentSelected ? Colors.white : null,
              )),
            );
          }),
        )).toList(),
      ),
    );
  }

  Widget _buildSelectBodyPartSection(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          child: RaisedButton(
            child: Text('Cambiar Lado'),
            color: MyTheme.skyBlue,
            textColor: MyTheme.white,
            onPressed: () {
              if (_webViewCtrl == null) return;

              if (_sideSelected) {
                _webViewCtrl.loadFile(
                  assetFilePath: 'assets/back.html',
                );
              } else {
                _webViewCtrl.loadFile(
                  assetFilePath: 'assets/front.html',
                );
              }

              setState(() { _sideSelected = !_sideSelected; });
            },
          ),
        ),

        Container(
          height: MediaQuery.of(context).size.height * 93/100,
          child: InAppWebView(
            initialFile: 'assets/front.html',
            initialHeaders: {},
            initialOptions: InAppWebViewWidgetOptions(
              inAppWebViewOptions: InAppWebViewOptions(
                debuggingEnabled: true,
              )
            ),

            onWebViewCreated: (ctrl) {
              _webViewCtrl = ctrl;
              _webViewCtrl.addJavaScriptHandler(
                handlerName: 'handleBodyPartSelected',
                callback: (args) {
                  setState(() {
                    _bodyPartSelected = args[0];
                  });
                }
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDetailSection(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          _buildMySlider(context),
          _buildDateInput(context),

          Builder(builder: (context) {
            var message = '';

            if (_symptomSelected == null) {
              message += 'Debes de seleccionar un síntoma\n';
            }

            if (_bodyPartSelected == null) {
              message += 'Debes de seleccionar una parte del cuerpo';
            }

            return Text(message, style: TextStyle(
              fontSize: 20.0,
              color: MyTheme.red,
            ));
          }),

          MySubmitButton(onPressed: () { _onCreateSymptom(context); }),
        ],
      ),
    );
  }

  void _onCreateSymptom(context) {
    if (_symptomSelected != null && _bodyPartSelected != null) {
      final symptom = Symptom(
        type: _symptomSelected,
        location: _bodyPartSelected,
        severity: _magnitude.toInt(),
        onset: DateFormat('yyyy-MM-dd').format(_date),
        consultation: _arguments['consultationId'],
      );

      switch (_arguments['method']) {
        case 'create':
          _provider.create(symptom, (response) {
            _consultationProvider.addSymptom(response);
            Navigator.pop(context);
          });
          break;

        case 'update':
          symptom.id = (_arguments['symptom'] as Symptom).id;
          _provider.update(symptom, (response) {
            _consultationProvider.updateSymptom(response);
            Navigator.pop(context);
          });
          break;

        default:
          throw 'Not method selected on SymptomCreateScreen';
      }
    }
  }

  Widget _buildMySlider(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 10.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text('Magnitud', style: TextStyle(
            fontSize: 22.0,
          )),

          Row(
            children: <Widget>[
              Icon(Icons.graphic_eq),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: Text('${_magnitude.toInt()}'),
              ),

              Expanded(
                child: Slider(
                  min: 0,
                  max: 10,
                  divisions: 10,
                  value: _magnitude,
                  onChanged: (value) {
                    setState(() {
                      _magnitude = value;
                    });
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildDateInput(BuildContext context) {
    return MyDateTimePicker(
      dateTime: _date,
      onChange: (date) {
        setState(() {
          _date = date;
        });
      },
    );
  }
}
