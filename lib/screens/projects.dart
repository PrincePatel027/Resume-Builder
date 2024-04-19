import 'package:flutter/material.dart';
import 'package:resume_builder/fonts/fonts.dart';
import 'package:resume_builder/utils/utils.dart';
import 'package:resume_builder/widgets/appBar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ProjectsPage extends StatefulWidget {
  const ProjectsPage({super.key});

  @override
  State<ProjectsPage> createState() => _ProjectsPageState();
}

class _ProjectsPageState extends State<ProjectsPage> {
  ///
  var projectTitle = TextEditingController();
  var roles = TextEditingController();
  var technologies = TextEditingController();
  var projectDescription = TextEditingController();
  bool cProgramming = false;
  bool cppProgramming = false;
  bool flutterProgramming = false;
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: globalKey,
          child: Column(
            children: [
              CustomAppBar(
                context: context,
                headingText: "Project",
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Project Title',
                      style: Fonts.blueContactForm,
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: projectTitle,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Project Title First";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Project Title',
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'Technologies',
                      style: Fonts.blueContactForm,
                    ),
                    const SizedBox(height: 10.0),
                    CheckboxListTile(
                      title: const Text('C Programming'),
                      value: cProgramming,
                      onChanged: (bool? value) {
                        setState(() {
                          cProgramming = value ?? false;
                          if (cProgramming) {
                            ContactInfoData.technologiesList
                                .add("C Programming");
                          }
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('C++'),
                      value: cppProgramming,
                      onChanged: (bool? value) {
                        setState(() {
                          cppProgramming = value ?? false;
                          if (cppProgramming) {
                            ContactInfoData.technologiesList
                                .add("C++ Programming");
                          }
                        });
                      },
                    ),
                    CheckboxListTile(
                      title: const Text('Flutter'),
                      value: flutterProgramming,
                      onChanged: (bool? value) {
                        setState(() {
                          flutterProgramming = value ?? false;
                          if (flutterProgramming) {
                            ContactInfoData.technologiesList
                                .add("Flutter Programming");
                          }
                        });
                      },
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'Roles',
                      style: Fonts.blueContactForm,
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: roles,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Roles First";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Roles',
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'Technologies',
                      style: Fonts.blueContactForm,
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: technologies,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Technologies First";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Technologies',
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      'Project Description',
                      style: Fonts.blueContactForm,
                    ),
                    const SizedBox(height: 10.0),
                    TextFormField(
                      controller: projectDescription,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Please Enter Project Description First";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Project Description',
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (globalKey.currentState!.validate()) {
                              ///
                              ContactInfoData.projectTitle = projectTitle.text;
                              ContactInfoData.roles = roles.text;
                              ContactInfoData.technologys = technologies.text;
                              ContactInfoData.projectDescription =
                                  projectDescription.text;

                              showTopSnackBar(
                                Overlay.of(context),
                                const CustomSnackBar.success(
                                  backgroundColor: Colors.green,
                                  message:
                                      "Your Project Details have Been Saved Successfully",
                                ),
                              );
                            }
                          },
                          child: const Text('SAVE'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
