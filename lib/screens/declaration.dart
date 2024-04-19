import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:resume_builder/fonts/fonts.dart';
import 'package:resume_builder/screens/contact_info.dart';
import 'package:resume_builder/utils/utils.dart';
import 'package:resume_builder/widgets/appBar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Declaration extends StatefulWidget {
  const Declaration({super.key});

  @override
  State<Declaration> createState() => _DeclarationState();
}

class _DeclarationState extends State<Declaration> {
  var isClicked = true;
  var description = TextEditingController();
  var city = TextEditingController();
  var dateDeclaration = TextEditingController();
  GlobalKey<FormState> textformKet = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Form(
        key: textformKet,
        child: Column(
          children: [
            CustomAppBar(
              context: context,
              headingText: "Declaration",
              child: Container(),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, left: 20, right: 20, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Declaration",
                            style: Fonts.blueContactForm,
                          ),
                          Switch(
                              value: isClicked,
                              onChanged: (val) {
                                setState(() {
                                  isClicked = val;
                                });
                              }),
                        ],
                      ),
                    ),
                    (isClicked)
                        ? Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, bottom: 20),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.height,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/icons/achievement.png',
                                    scale: 10,
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    validator: (val) {
                                      ///
                                      if (val!.isEmpty) {
                                        return "Enter Description First";
                                      }
                                      return null;
                                    },
                                    controller: description,
                                    decoration: const InputDecoration(
                                      hintText: "Description",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const Divider(
                                    color: Colors.grey,
                                    thickness: 2,
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              6,
                                          // color: Colors.amber,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Date",
                                                  style: Fonts.defaultText,
                                                ),
                                                const SizedBox(height: 20),
                                                Expanded(
                                                  child: TextFormField(
                                                    validator: (val) {
                                                      ///
                                                      if (val!.isEmpty) {
                                                        return "Enter Date First";
                                                      }
                                                      return null;
                                                    },
                                                    controller: dateDeclaration,
                                                    decoration: InputDecoration(
                                                      hintText: "DD/MM/YYYY",
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              6,
                                          // color: Colors.red,
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "City",
                                                  style: Fonts.defaultText,
                                                ),
                                                const SizedBox(height: 20),
                                                Expanded(
                                                  child: TextFormField(
                                                    controller: city,
                                                    validator: (val) {
                                                      ///
                                                      if (val!.isEmpty) {
                                                        return "Enter City First";
                                                      }
                                                      return null;
                                                    },
                                                    decoration: InputDecoration(
                                                      hintText: "Eg. City",
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          ///
                                          if (textformKet.currentState!
                                              .validate()) {
                                            ContactInfoData.description =
                                                description.text;
                                            ContactInfoData.dateDeclaration =
                                                dateDeclaration.text;
                                            ContactInfoData.cityDeclaration =
                                                city.text;

                                            showTopSnackBar(
                                              Overlay.of(context),
                                              const CustomSnackBar.success(
                                                backgroundColor: Colors.green,
                                                message:
                                                    "Your Data have Been Saved Successfully",
                                              ),
                                            );
                                            Navigator.of(context)
                                                .pushNamedAndRemoveUntil(
                                                    "pdf", (route) => false);
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              80,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(15),
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
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
