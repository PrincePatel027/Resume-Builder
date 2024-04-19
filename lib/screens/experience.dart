import 'package:flutter/material.dart';
import 'package:resume_builder/fonts/fonts.dart';
import 'package:resume_builder/utils/utils.dart';
import 'package:resume_builder/widgets/appBar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({super.key});

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
  var work = TextEditingController();
  var companyName = TextEditingController();
  var rolesOptional = TextEditingController();
  var dateJoined = TextEditingController();
  var dateExit = TextEditingController();
  String employeeType = "Previous Employee";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.grey.withOpacity(0.3),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomAppBar(
                  context: context,
                  headingText: "Experience",
                  child: Container(),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Company Name",
                                style: Fonts.blueContactForm,
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter Company Name First";
                                  }
                                  return null;
                                },
                                controller: companyName,
                                decoration: const InputDecoration(
                                  hintText: "New Enterprise San Francisco",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Work",
                                style: Fonts.blueContactForm,
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter Work First";
                                  }
                                  return null;
                                },
                                controller: work,
                                decoration: const InputDecoration(
                                  hintText: "Quility Test Enginner",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Roles (Optional)",
                                style: Fonts.blueContactForm,
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                maxLines: 4,
                                controller: rolesOptional,
                                decoration: const InputDecoration(
                                  hintText:
                                      "Working With Team Members to come up with new concepts and product anylysis",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Employee Status",
                                style: Fonts.blueContactForm,
                              ),
                              const SizedBox(height: 8),
                              SizedBox(
                                height: 70,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Radio(
                                            onChanged: (val) {
                                              setState(() {
                                                employeeType = val.toString();
                                              });
                                            },
                                            value: "Previous Employee",
                                            groupValue: employeeType,
                                          ),
                                          const Expanded(
                                            child: Text("Previous Employee"),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Radio(
                                            onChanged: (val) {
                                              setState(() {
                                                employeeType = val.toString();
                                              });
                                            },
                                            value: "Current Employee",
                                            groupValue: employeeType,
                                          ),
                                          const Expanded(
                                              child: Text("Current Employee")),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 10,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Date Joined",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Expanded(
                                            child: TextFormField(
                                              validator: (val) {
                                                if (val!.isEmpty) {
                                                  return "Enter Joined Date first";
                                                }
                                                return null;
                                              },
                                              controller: dateJoined,
                                              keyboardType: TextInputType.phone,
                                              decoration: const InputDecoration(
                                                hintText: "DD/MM/YYYY",
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "Date Exit",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Expanded(
                                            child: TextFormField(
                                              controller: dateExit,
                                              validator: (val) {
                                                if (val!.isEmpty) {
                                                  return "Enter Exit Date first";
                                                }
                                                return null;
                                              },
                                              keyboardType: TextInputType.phone,
                                              decoration: const InputDecoration(
                                                hintText: "DD/MM/YYYY",
                                                border: OutlineInputBorder(),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              InkWell(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    ContactInfoData.companyName =
                                        companyName.text;
                                    ContactInfoData.work = work.text;
                                    ContactInfoData.rolesOptional =
                                        rolesOptional.text;
                                    ContactInfoData.employeeStatus =
                                        employeeType;
                                    ContactInfoData.dateJoined =
                                        dateJoined.text;
                                    ContactInfoData.dateExit = dateExit.text;
                                    showTopSnackBar(
                                      Overlay.of(context),
                                      const CustomSnackBar.success(
                                        backgroundColor: Colors.green,
                                        message:
                                            "Your All Informations Saved Successfully",
                                      ),
                                    );
                                  } else {
                                    showTopSnackBar(
                                      Overlay.of(context),
                                      const CustomSnackBar.error(
                                        message:
                                            "Please Fill Out All Upper Fields &\nTry Again later",
                                      ),
                                    );
                                  }
                                },
                                child: Container(
                                  height: 40,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Save",
                                    style: Fonts.subHeading,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
