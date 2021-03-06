import 'package:flutter/material.dart';

import 'package:bitmec/screens.dart';
import 'package:bitmec/components.dart';

class PatientDetailDependentsView extends StatefulWidget {
  @override
  _PatientDetailDependentsViewState createState() =>
      _PatientDetailDependentsViewState();
}

class _PatientDetailDependentsViewState
    extends State<PatientDetailDependentsView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListOfSection(
        title: 'Dependientes',
        onPressedAdd: () {
          Navigator.pushNamed(
            context,
            PatientDetailDependentCreateScreen.routeName,
          );
        },

        children: <Widget>[
          Text('No hay dependientes registrados!'),
        ],
      ),
    );
  }
}

//class _DependentCard extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Card(
//      elevation: 5.0,
//      margin: const EdgeInsets.symmetric(vertical: 10.0),
//      child: Padding(
//        padding: const EdgeInsets.all(10.0),
//        child: IntrinsicHeight(
//          child: Row(
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Container(
//                width: 100.0,
//                height: 100.0,
//                decoration: BoxDecoration(
//                    shape: BoxShape.circle,
//                    image: DecorationImage(
//                      fit: BoxFit.cover,
//                      image: NetworkImage("https://images.pexels.com/photos/235805/pexels-photo-235805.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
//                    )
//                ),
//              ),
//              Expanded(
//                child: Padding(
//                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    crossAxisAlignment: CrossAxisAlignment.start,
//                    children: <Widget>[
//                      Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Text('Nombre Apellido', style: TextStyle(
//                            fontSize: 25.0,
//                          )),
//                          Text('Edad'),
//                        ],
//                      ),
//
//
//                      Row(
//                        textDirection: TextDirection.rtl,
//                        children: <Widget>[
//                          Text('Relación')
//                        ],
//                      ),
//                    ],
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
