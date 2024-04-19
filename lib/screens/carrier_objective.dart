import 'package:flutter/material.dart';
import 'package:resume_builder/fonts/fonts.dart';
import 'package:resume_builder/utils/utils.dart';
import 'package:resume_builder/widgets/appBar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CarrierObjective extends StatefulWidget {
  const CarrierObjective({super.key});

  @override
  State<CarrierObjective> createState() => _CarrierObjectiveState();
}

class _CarrierObjectiveState extends State<CarrierObjective> {
  TextEditingController carrierObjectiveController = TextEditingController();
  TextEditingController currentDesignationController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey.withOpacity(0.5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                context: context,
                headingText: "Career Objective",
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Career Objective",
                                style: Fonts.blueContactForm,
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Career Objective";
                                  }
                                  return null;
                                },
                                controller: carrierObjectiveController,
                                maxLines: 5,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Description",
                                  hintStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Current Designation (Experienced Candidate)",
                                style: Fonts.blueContactForm,
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Current Designation";
                                  }
                                  return null;
                                },
                                controller: currentDesignationController,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: "Software Engineer",
                                  hintStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            ContactInfoData.careerObjective = carrierObjectiveController.text;
            ContactInfoData.currentDesignation =
                carrierObjectiveController.text;
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.success(
                backgroundColor: Colors.green,
                message: "Your All Informations Saved Successfully",
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
        child: const Icon(Icons.save),
      ),
    );
  }
}
