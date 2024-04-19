import 'package:flutter/material.dart';
import 'package:resume_builder/fonts/fonts.dart';
import 'package:resume_builder/utils/utils.dart';
import 'package:resume_builder/widgets/appBar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Education extends StatefulWidget {
  const Education({super.key});

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController courseDegree = TextEditingController();
  TextEditingController schoolCollage = TextEditingController();
  TextEditingController percentage = TextEditingController();
  TextEditingController passYear = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.grey.withOpacity(0.3),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBar(
                  context: context,
                  headingText: "Education Page",
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
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Course/Degree",
                                style: Fonts.blueContactForm,
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter Your Course/Degree First";
                                  }
                                  return null;
                                },
                                controller: courseDegree,
                                decoration: const InputDecoration(
                                  hintText: "B. Tech Information Technology",
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
                                "School/Collage/Institude",
                                style: Fonts.blueContactForm,
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter Your School Collage Name First";
                                  }
                                  return null;
                                },
                                controller: schoolCollage,
                                decoration: const InputDecoration(
                                  hintText: "XYZ School Private Limited",
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
                                "Percentage",
                                style: Fonts.blueContactForm,
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter Your Percentage.";
                                  }
                                  return null;
                                },
                                controller: percentage,
                                decoration: const InputDecoration(
                                  hintText: "99.99 %",
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
                                "Year Of Pass",
                                style: Fonts.blueContactForm,
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                validator: (val) {
                                  if (val!.isEmpty) {
                                    return "Enter Year Of Pass First";
                                  }
                                  return null;
                                },
                                controller: passYear,
                                decoration: const InputDecoration(
                                  hintText: "2024",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  border: OutlineInputBorder(),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            ContactInfoData.courseDegree = courseDegree.text;
            ContactInfoData.schoolCollage = schoolCollage.text;
            ContactInfoData.percentage = percentage.text;
            ContactInfoData.yearOfPass = passYear.text;
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
}
