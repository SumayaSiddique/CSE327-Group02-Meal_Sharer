import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class DonateFood extends StatefulWidget {
  const DonateFood({Key? key}) : super(key: key);

  @override
  State<DonateFood> createState() => _DonateFoodState();
}

class _DonateFoodState extends State<DonateFood> {
  final _formKey = GlobalKey<FormState>();
  var location = "".obs;
  var items = "".obs;
  var quantity = 0.obs;
  var selectedDate = DateTime.now().obs;
  var confirm = false.obs;
  List<XFile>? _imageFileList;
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Donate Food"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please fill the information";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Location",
                    suffixIcon: Icon(FontAwesomeIcons.locationArrow),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    location.value = value;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please fill the information";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Food Items",
                    suffixIcon: Icon(FontAwesomeIcons.list),
                    border: InputBorder.none,
                  ),
                  onChanged: (value) {
                    items.value = value;
                  },
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Text(
                        "Delivery Date: " +
                            DateFormat.yMd()
                                .add_jm()
                                .format(selectedDate.value),
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        DatePicker.showDateTimePicker(
                          context,
                          showTitleActions: true,
                          minTime: DateTime.now(),
                          maxTime: DateTime.now().add(const Duration(days: 90)),
                          onChanged: (date) {
                            selectedDate.value = date;
                          },
                          currentTime: DateTime.now(),
                        );

                        // DateTime? date = await showDatePicker(
                        //   context: context,
                        //   initialDate: selectedDate.value,
                        //   firstDate: DateTime.now(),
                        //   lastDate: DateTime.now().add(
                        //     const Duration(
                        //       days: 90,
                        //     ),
                        //   ),
                        // );
                      },
                      icon: Icon(
                        FontAwesomeIcons.clock,
                        color: Colors.black.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Obx(
                      () => Text(
                        "Quantity: ${quantity.value}",
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        quantity.value++;
                      },
                      icon: const Icon(
                        FontAwesomeIcons.plus,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (quantity.value != 0) {
                          quantity.value--;
                        }
                      },
                      icon: const Icon(
                        FontAwesomeIcons.minus,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      List<XFile>? images = await _picker.pickMultiImage();
                      setState(() {
                        _imageFileList = images;
                      });
                    },
                    child: const Text(
                      "Select Images",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                if (_imageFileList != null)
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount:
                          _imageFileList == null ? 0 : _imageFileList!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Image.file(
                            File(
                              _imageFileList![index].path,
                            ),
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: confirm.value,
                        onChanged: (val) {
                          confirm.value = val!;
                        },
                      ),
                    ),
                    const Text(
                      "I assure that the food quality is up to the mark",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() && confirm.value) {
                        print("Validated");
                      }
                    },
                    child: const Text("Submit"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
