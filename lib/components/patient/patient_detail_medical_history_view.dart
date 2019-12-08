import 'package:flutter/material.dart';

import '../list_of_section.dart';

class PatientDetailMedicalHistoryView extends StatefulWidget {
  @override
  _PatientDetailMedicalHistoryViewState createState() =>
      _PatientDetailMedicalHistoryViewState();
}

class _PatientDetailMedicalHistoryViewState
    extends State<PatientDetailMedicalHistoryView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _MedicalConditionsSection(),
          _MedicalSurgeriesSection(),
          _MedicinesSection(),
          _ReproductiveHealthSection(),
          _ContraceptivesSection(),
        ],
      ),
    );
  }
}

class _MedicalConditionsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListOfSection(
      title: 'Padecimientos',
      children: <Widget>[
        _MedicalConditionCard(),
        _MedicalConditionCard(),
      ],
    );
  }
}

class _MedicalConditionCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Padecimiento', style: TextStyle(fontSize: 24.0)),
                Padding(padding: const EdgeInsets.symmetric(vertical: 5.0)),
                Text('Diagnosticado port:'),
                Text('Dr. Jose Pérez', style: TextStyle(
                  fontWeight: FontWeight.bold
                )),
              ],
            ),

            Row(
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text('Fecha : Hora', style: TextStyle(
                  color: Colors.blueAccent,
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MedicalSurgeriesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListOfSection(
      title: 'Cirugias',
      children: <Widget>[
        _MedicalSurgeryCard(),
      ],
    );
  }
}

class _MedicalSurgeryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Cirugía', style: TextStyle(fontSize: 24.0)),
                Padding(padding: const EdgeInsets.symmetric(vertical: 5.0)),
                Text('Realizada por:'),
                Text('Dr. Jose Pérez', style: TextStyle(
                    fontWeight: FontWeight.bold
                )),
              ],
            ),

            Row(
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text('Fecha : Hora', style: TextStyle(
                  color: Colors.blueAccent,
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MedicinesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListOfSection(
      title: 'Medicamentos',
      children: <Widget>[
        _MedicineCard(),
        _MedicineCard(),
        _MedicineCard(),
      ],
    );
  }
}

class _MedicineCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Medicamento', style: TextStyle(fontSize: 24.0)),
                Padding(padding: const EdgeInsets.symmetric(vertical: 5.0)),
                Text('Dosis de:'),
                Text('Descripción de dosis', style: TextStyle(
                    fontWeight: FontWeight.bold
                )),
              ],
            ),

            Row(
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text('Inicio - Fin', style: TextStyle(
                  color: Colors.blueAccent,
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ReproductiveHealthSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Salud Reproductiva', style: TextStyle(
              fontSize: 30.0,
              color: Colors.blue
          )),

          Card(
            elevation: 3.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('¿Has tenido uno más ciclos mestruales?'),
                      Row(
                        textDirection: TextDirection.rtl,
                        children: <Widget>[
                          Text('Sí', style: TextStyle(
                            color: Colors.blueAccent,
                          ))
                        ],
                      ),
                      Padding(padding: const EdgeInsets.symmetric(vertical: 10.0)),
                      Text('Primer Mestruación: << Fecha >>'),
                      Text('Última Mestruación: << Fecha >>'),
                    ],
                  ),

                  Padding(padding: const EdgeInsets.only(top: 10.0)),
                  Divider(height: 2.0, color: Colors.grey),
                  Padding(padding: const EdgeInsets.only(bottom: 10.0)),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('¿Has estado embarazada?'),
                      Row(
                        textDirection: TextDirection.rtl,
                        children: <Widget>[
                          Text('Sí', style: TextStyle(
                            color: Colors.blueAccent,
                          ))
                        ],
                      ),
                      Padding(padding: const EdgeInsets.symmetric(vertical: 10.0)),
                      Text('Embaranzos: << Cantidad >>'),
                      Text('Hijos Vivos: << Cantidad >>'),
                    ],
                  ),

                  Padding(padding: const EdgeInsets.only(top: 10.0)),
                  Divider(height: 2.0, color: Colors.grey),
                  Padding(padding: const EdgeInsets.only(bottom: 10.0)),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('¿Has perdido algún bebé?'),
                      Padding(padding: const EdgeInsets.symmetric(vertical: 5.0)),
                      Row(
                        textDirection: TextDirection.rtl,
                        children: <Widget>[
                          Text('No', style: TextStyle(
                            color: Colors.blueAccent,
                          ))
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ContraceptivesSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListOfSection(
      title: 'Anticonceptivos',
      children: <Widget>[
        _ContraceptiveCard(),
        _ContraceptiveCard(),
      ],
    );
  }
}

class _ContraceptiveCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Anticonceptivo', style: TextStyle(fontSize: 24.0)),
                Padding(padding: const EdgeInsets.symmetric(vertical: 5.0)),
              ],
            ),

            Row(
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text('Inicio - Fin', style: TextStyle(
                  color: Colors.blueAccent,
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}