import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meal_sharer/Screens/Background/background_1.dart';
import 'package:meal_sharer/Util/profile_info/user_info.dart';

class CollectUserInformation extends StatefulWidget {
  const CollectUserInformation({Key? key}) : super(key: key);

  @override
  _CollectUserInformationState createState() => _CollectUserInformationState();
}

class _CollectUserInformationState extends State<CollectUserInformation> {
  final _formKey = GlobalKey<FormState>();
  String number = '';
  String name = '';
  String bio = '';

  get sPrimaryColor => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background1(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  SvgPicture.asset('assets/icons/signup.svg'),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: "Full Name",
                            suffixIcon: Icon(
                              Icons.person,
                            ),
                          ),
                          onChanged: (value) {
                            name = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Name';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          minLines: 1,
                          maxLines: 5,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: "Bio",
                            suffixIcon: Icon(Icons.book_sharp),
                          ),
                          onChanged: (value) {
                            bio = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter information';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            labelText: "Contact Number",
                            suffixIcon: Icon(
                              Icons.phone,
                            ),
                          ),
                          onChanged: (value) {
                            number = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter Contact Number';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: sPrimaryColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            await UserDataUtil.saveUserInfo(name, number, bio);
                          }
                        },
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: 'SF Pro Rounded',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
