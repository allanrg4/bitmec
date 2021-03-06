import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:provider/provider.dart';

import 'package:bitmec/models.dart';
import 'package:bitmec/services.dart';

class PatientProvider with ChangeNotifier {
  List<Patient> _data = [];
  List<Patient> get data => _data;

  bool _dataLoaded = false;
  bool get dataLoaded => _dataLoaded;
  set dataLoaded(bool value) {
    _dataLoaded = value;
    notifyListeners();
  }

  Patient _object;
  Patient get object => _object;

  bool _objectLoaded = false;
  bool get objectLoaded => _objectLoaded;
  set objectLoaded(bool value) {
    _objectLoaded = value;
    notifyListeners();
  }

  void removeObject() {
    _object = null;
    _objectLoaded = false;
  }

  void removeData() {
    _data = [];
    _dataLoaded = false;
    _object = null;
    _objectLoaded = false;
  }

  static PatientProvider of(BuildContext context) => Provider.of(context);

  void fetchAll([Function(List<Patient>) callback]) {
    PatientService.fetchAll().then((response) {
      _data = response;

      _data.sort((a, b) {
        final aName = '${a.firstName} ${a.lastName}'.toLowerCase();
        final bName = '${b.firstName} ${b.lastName}'.toLowerCase();

        return aName.compareTo(bName);
      });

      _dataLoaded = true;
      notifyListeners();

      if (callback != null) {
        callback(response);
      }
    });
  }

  void fetchById(int id, [Function(Patient) callback]) {
    PatientService.fetchById(id).then((response) {
      _object = response;
      _objectLoaded = true;
      notifyListeners();

      if (callback != null) {
        callback(response);
      }
    });
  }

  void update(Patient obj, [Function(Patient) callback]) {
    PatientService.update(obj).then((response) {
      _object = obj;
      notifyListeners();

      if (callback != null)
        callback(response);
    });
  }

  void addConsultation(Consultation consultation) {
    object.consultations.add(consultation);
    notifyListeners();
  }

  void addMedicalCondition(MedicalCondition condition) {
    _object.historicalConditions.add(condition);
    notifyListeners();
  }

  void updateMedicalCondition(MedicalCondition condition) {
    final i = _object.historicalConditions.indexWhere((e) => condition.id == e.id);
    _object.historicalConditions[i] = condition;
    notifyListeners();
  }

  void removeMedicalCondition(int id) {
    _object.historicalConditions.removeWhere((e) => id == e.id);
    notifyListeners();
  }

  void addMedicalConditionImage(int conditionID, ImageDB image) {
    final i = _object.historicalConditions.indexWhere((e) => conditionID == e.id);
    _object.historicalConditions[i].images.add(image);
    notifyListeners();
  }

  void addMedicalSurgery(Surgery surgery) {
    _object.historicalOperations.add(surgery);
    notifyListeners();
  }

  void updateMedicalSurgery(Surgery surgery) {
    final i = _object.historicalOperations.indexWhere((e) => surgery.id == e.id);
    _object.historicalOperations[i] = surgery;
    notifyListeners();
  }

  void removeMedicalSurgery(int id) {
    _object.historicalOperations.removeWhere((e) => id == e.id);
    notifyListeners();
  }

  void addMedicalSurgeryImage(int surgeryID, ImageDB image) {
    final i = _object.historicalOperations.indexWhere((e) => surgeryID == e.id);
    _object.historicalOperations[i].images.add(image);
    notifyListeners();
  }

  void addMedicalPrescription(Prescription prescription) {
    _object.historicalPrescriptions.add(prescription);
    notifyListeners();
  }

  void updateMedicalPrescription(Prescription prescription) {
    final i = _object.historicalPrescriptions.indexWhere((e) => prescription.id == e.id);
    _object.historicalPrescriptions[i] = prescription;
    notifyListeners();
  }

  void removeMedicalPrescription(int id) {
    _object.historicalPrescriptions.removeWhere((e) => id == e.id);
    notifyListeners();
  }

  void addMedicalPrescriptionImage(int prescriptionID, ImageDB image) {
    final i = _object.historicalPrescriptions.indexWhere((e) => prescriptionID == e.id);
    _object.historicalPrescriptions[i].images.add(image);
    notifyListeners();
  }

  set reproductiveHistory(ReproductiveHistory reproductiveHistory) {
    _object.reproductiveHistory = [reproductiveHistory];
    notifyListeners();
  }

  void addBirthControl(BirthControl contraceptive) {
    _object.birthControls.add(contraceptive);
    notifyListeners();
  }

  void updateBirthControl(BirthControl contraceptive) {
    final i = _object.birthControls.indexWhere((e) => contraceptive.id == e.id);
    _object.birthControls[i] = contraceptive;
    notifyListeners();
  }

  void removeBirthControl(int id) {
    _object.birthControls.removeWhere((e) => id == e.id);
    notifyListeners();
  }

  void addFamilyMember(FamilyMemberCondition member) {
    _object.familyMembers.add(member);
    notifyListeners();
  }

  void updateFamilyMember(FamilyMemberCondition member) {
    final i = _object.familyMembers.indexWhere((e) => member.id == e.id);
    _object.familyMembers[i] = member;
    notifyListeners();
  }

  void removeFamilyMember(int id) {
    _object.familyMembers.removeWhere((e) => id == e.id);
    notifyListeners();
  }

  void addHabit(Habit obj) {
    _object.habits.add(obj);
    notifyListeners();
  }

  void updateHabit(Habit obj) {
    final i = _object.habits.indexWhere((e) => obj.id == e.id);
    _object.habits[i] = obj;
    notifyListeners();
  }

  void removeHabit(int id) {
    _object.habits.removeWhere((e) => id == e.id);
    notifyListeners();
  }
}
