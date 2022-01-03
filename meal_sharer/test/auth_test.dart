import 'package:flutter_test/flutter_test.dart';
import 'package:meal_sharer/Screens/Login/login_screen.dart';
import 'package:meal_sharer/Screens/Sign-up/sign_up_screen.dart';

void main() {
  // this is validating the email textformfield. if it's not empty then it will return null
  test('Empty Email Text form field Validator', () {
    var result = EmailFieldValidator.validate('');
    expect(result, 'Email can not be empty!');
  });
  test('Filled Up Email Validator', () {
    var result = EmailFieldValidator.validate('sss.savant99@gmail.com');
    expect(result, null);
  });

  // this is validating the password textformfield. if it's not empty then it will return null
  test('Empty Password Text form field Validator', () {
    var result = PasswordFieldValidator.validate('');
    expect(result, 'Password can not be empty!');
  });
  test('Filled Up Password Validator', () {
    var result = PasswordFieldValidator.validate('1234');
    expect(result, null);
  });

  // this is validating the full name textformfield. if it's not empty then it will return null

  test('Empty Name Text form field Validator', () {
    var result = NameFieldValidator.validate('');
    expect(result, 'Name can not be empty!');
  });
  test('Filled Up Name Validator', () {
    var result = NameFieldValidator.validate('Test');
    expect(result, null);
  });

  // this is validating the contact number textformfield. if it's not empty then it will return null

  test('Empty Contact Number Text form field Validator', () {
    var result = ContactNumberFieldValidator.validate('');
    expect(result, 'Number can not be empty!');
  });
  test('Filled Up Contact Number Validator', () {
    var result = PasswordFieldValidator.validate('012345678');
    expect(result, null);
  });
}
