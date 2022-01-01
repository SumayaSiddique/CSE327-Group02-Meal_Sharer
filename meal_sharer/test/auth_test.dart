import 'package:flutter_test/flutter_test.dart';
import 'package:meal_sharer/Screens/Login/login_screen.dart';

void main() {
  test('Empty Email Text form field Validator', () {
    var result = EmailFieldValidator.validate('');
    expect(result, 'Email can not be empty!');
  });
  test('Filled Up Email Validator', () {
    var result = EmailFieldValidator.validate('sss.savant99@gmail.com');
    expect(result, null);
  });
  test('Empty Password Text form field Validator', () {
    var result = PasswordFieldValidator.validate('');
    expect(result, 'Password can not be empty!');
  });
  test('Filled Up Password Validator', () {
    var result = PasswordFieldValidator.validate('1234');
    expect(result, null);
  });
}
