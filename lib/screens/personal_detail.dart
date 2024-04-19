import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resume_builder/fonts/fonts.dart';
import 'package:resume_builder/utils/utils.dart';
import 'package:resume_builder/widgets/appBar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class PersonalDetailPage extends StatefulWidget {
  const PersonalDetailPage({super.key});

  @override
  State<PersonalDetailPage> createState() => _PersonalDetailPageState();
}

class _PersonalDetailPageState extends State<PersonalDetailPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController dobController = TextEditingController();
  String? maritalStatus;
  List<String> languagesKnown = [];
  TextEditingController nationalityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.grey.withOpacity(0.5),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  context: context,
                  headingText: "Personal Details",
                  child: Container(),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'DOB',
                        style: Fonts.blueContactForm,
                      ),
                      TextFormField(
                        controller: dobController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'DD/MM/YYYY',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your date of birth';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Marital Status',
                        style: Fonts.blueContactForm,
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: 'Single',
                            groupValue: maritalStatus,
                            onChanged: (value) {
                              setState(() {
                                maritalStatus = value;
                              });
                            },
                          ),
                          Text(
                            'Single',
                            style: Fonts.defaultText,
                          ),
                          const SizedBox(width: 20),
                          Radio<String>(
                            value: 'Married',
                            groupValue: maritalStatus,
                            onChanged: (value) {
                              setState(() {
                                maritalStatus = value;
                              });
                            },
                          ),
                          Text(
                            'Married',
                            style: Fonts.defaultText,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Languages Known',
                        style: Fonts.blueContactForm,
                      ),
                      CheckboxListTile(
                        title: Text(
                          'English',
                          style: Fonts.defaultText,
                        ),
                        value: languagesKnown.contains('English'),
                        onChanged: (value) {
                          setState(() {
                            if (value!) {
                              languagesKnown.add('English');
                            } else {
                              languagesKnown.remove('English');
                            }
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text(
                          'Hindi',
                          style: Fonts.defaultText,
                        ),
                        value: languagesKnown.contains('Hindi'),
                        onChanged: (value) {
                          setState(() {
                            if (value!) {
                              languagesKnown.add('Hindi');
                            } else {
                              languagesKnown.remove('Hindi');
                            }
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text(
                          'Gujarati',
                          style: Fonts.defaultText,
                        ),
                        value: languagesKnown.contains('Gujarati'),
                        onChanged: (value) {
                          setState(() {
                            if (value!) {
                              languagesKnown.add('Gujarati');
                            } else {
                              languagesKnown.remove('Gujarati');
                            }
                          });
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nationality',
                        style: Fonts.blueContactForm,
                      ),
                      TextFormField(
                        controller: nationalityController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Nationality',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your nationality';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            saveData();
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.success(
                backgroundColor: Colors.green,
                message: "Your Personal Details have Been Saved Successfully",
              ),
            );
          } else {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.error(
                message: "Please Fill Out All Upper Fields &\nTry Again later",
              ),
            );
          }
        },
        child: const Icon(
          Icons.save,
          color: Colors.blue,
        ),
      ),
    );
  }

  void saveData() {
    ContactInfoData.dateOfBirth = dobController.text;
    ContactInfoData.maritalStatus = maritalStatus.toString();
    ContactInfoData.languageKnown = languagesKnown.toList();
    ContactInfoData.nationality = nationalityController.text;
  }
}
