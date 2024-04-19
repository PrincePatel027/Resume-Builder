import 'package:flutter/material.dart';
import 'package:resume_builder/fonts/fonts.dart';
import 'package:resume_builder/utils/utils.dart';
import 'package:resume_builder/widgets/appBar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Refrences extends StatefulWidget {
  const Refrences({super.key});

  @override
  State<Refrences> createState() => _RefrencesState();
}

class _RefrencesState extends State<Refrences> {
  var refranceName = TextEditingController();
  var designation = TextEditingController();
  var organizationInstitude = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: globalKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppBar(
                context: context,
                headingText: "Refrences",
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'Refrence Name',
                      style: Fonts.blueContactForm,
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: refranceName,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Refrance name First";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Refrance Name',
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'Designation',
                      style: Fonts.blueContactForm,
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: designation,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Designation First";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Designation',
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'Organization/Institude',
                      style: Fonts.blueContactForm,
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: organizationInstitude,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Organization/Institude First";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Organization/Institude',
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      if (globalKey.currentState!.validate()) {
                        ContactInfoData.refranceName = refranceName.text;
                        ContactInfoData.designation = designation.text;
                        ContactInfoData.organizationInstitude =
                            organizationInstitude.text;
                        showTopSnackBar(
                          Overlay.of(context),
                          const CustomSnackBar.success(
                            backgroundColor: Colors.green,
                            message:
                                "Your Refrences have Been Saved Successfully",
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
