import 'package:flutter/material.dart';
import 'package:resume_builder/fonts/fonts.dart';
import 'package:resume_builder/utils/utils.dart';
import 'package:resume_builder/widgets/appBar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class Archivements extends StatefulWidget {
  const Archivements({super.key});

  @override
  State<Archivements> createState() => _TechnicalSkillState();
}

class _TechnicalSkillState extends State<Archivements> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              context: context,
              headingText: "Archivements",
              child: Container(),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      "Enter Your Archivements",
                      style: Fonts.defaultText,
                    ),
                    ...ContactInfoData.archivementsList.map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(
                            top: 20, left: 20, right: 20, bottom: 10),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                controller: e,
                                decoration: const InputDecoration(
                                  hintText: "Exceeded Sales 17% avradge...",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  ContactInfoData.archivementsList.remove(e);
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    color: Colors.red.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(Icons.delete),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            ContactInfoData.archivementsList.add(
                              TextEditingController(),
                            );
                          });
                        },
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width - 60,
                          decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Text(
          "Save",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        onPressed: () {
          setState(() {
            showTopSnackBar(
              Overlay.of(context),
              const CustomSnackBar.success(
                backgroundColor: Colors.green,
                message: "Your Technical Skills have Been Saved Successfully",
              ),
            );
          });
        },
      ),
    );
  }
}
