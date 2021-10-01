import 'dart:async';
import 'package:homehealth/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';



class RegisterProfileBloc with Validators {

  final _nameController = BehaviorSubject<String>();
  final _lastnameController = BehaviorSubject<String>();
  final _documentNumberController = BehaviorSubject<String>();
  final _phoneController = BehaviorSubject<String>();
  final _birthdateController = BehaviorSubject<String>();
  final _addressStream = BehaviorSubject<String>();

  Stream<String> get nameStream => _nameController.stream.transform(validateName);
  Stream<String> get lastNameStream => _lastnameController.stream.transform(validateLastname);
  Stream<String> get phoneStream => _phoneController.stream.transform(validatePhone);
  Stream<String> get documentNumberStream => _documentNumberController.stream.transform(validateDocumentNumber);
  Stream<String> get birthdateStream => _birthdateController.stream.transform(validateBirthDate);
  Stream<String> get addressStream => _addressStream.stream.transform(validateAddress);

  Function(String) get changeName => _nameController.sink.add;
  Function(String) get changeLastName => _lastnameController.sink.add;
  Function(String) get changeDocumentNumber => _documentNumberController.sink.add;
  Function(String) get changePhone => _phoneController.sink.add;
  Function(String) get changeBirthdate => _birthdateController.sink.add;
  Function(String) get changeAddress => _addressStream.sink.add; 

  Stream<bool> get formValidStream => Rx.combineLatest6(
      nameStream,
      lastNameStream,
      phoneStream,
      documentNumberStream,
      birthdateStream,
      addressStream,
      (a, b,c,d,e,f) => true,
    );

  String get name => _nameController.value;
  String get lastname => _lastnameController.value;
  String get documentNumber => _documentNumberController.value;
  String get phone => _phoneController.value;
  String get birthdate => _birthdateController.value;
  String get address => _addressStream.value;
  
  dispose() {
    _nameController.close();
    _lastnameController.close();
    _documentNumberController.close();
    _phoneController.close();
    _birthdateController.close();
    _addressStream.close();
  }
}