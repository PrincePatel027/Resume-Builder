import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resume_builder/fonts/fonts.dart';
import 'package:resume_builder/utils/utils.dart';
import 'package:resume_builder/widgets/appBar.dart';
import 'package:resume_builder/widgets/textFormField.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ContactInfo extends StatefulWidget {
  const ContactInfo({super.key});

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool isContact = true;

  File? imageLocal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            CustomAppBar(
              context: context,
              headingText: 'Resume Workspace',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: isContact
                          ? const Border(
                              bottom: BorderSide(
                                color: Colors.amber,
                                width: 2,
                              ),
                            )
                          : null,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isContact = true;
                        });
                      },
                      child: Text(
                        'Contact',
                        style: Fonts.subHeading,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: !isContact
                          ? const Border(
                              bottom: BorderSide(
                                color: Colors.amber,
                                width: 2,
                              ),
                            )
                          : null,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isContact = false;
                        });
                      },
                      child: Text(
                        'Photo',
                        style: Fonts.subHeading,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            (isContact)
                ? Form(
                    key: formKey,
                    child: Column(
                      children: [
                        customTextFormField(
                          hintName: 'Name',
                          icon: Icons.person,
                          isPhone: false,
                          controller: nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name.';
                            }
                            return null;
                          },
                        ),
                        customTextFormField(
                          hintName: 'Email',
                          icon: Icons.email,
                          isPhone: false,
                          controller: emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email address.';
                            }
                            return null;
                          },
                        ),
                        customTextFormField(
                          hintName: 'Phone',
                          icon: Icons.phone,
                          isPhone: true,
                          controller: phoneController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number.';
                            }
                            return null;
                          },
                        ),
                        customTextFormField(
                          hintName: 'Address',
                          icon: Icons.location_on,
                          isPhone: false,
                          controller: addressController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your address.';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 65,
                          child: ClipOval(
                            child: SizedBox(
                              width: 200,
                              height: 200,
                              child: (imageLocal != null)
                                  ? Image.file(
                                      imageLocal!,
                                      fit: BoxFit.cover,
                                    )
                                  : const Icon(
                                      Icons.add,
                                      size: 35,
                                    ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                getImage(ImageSource.camera);
                              },
                              child: const Text('Take Photo'),
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: () {
                                getImage(ImageSource.gallery);
                              },
                              child: const Text('Choose from Gallery'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
          ],
        ),
      ),
      floatingActionButton: (isContact)
          ? FloatingActionButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  showTopSnackBar(
                    Overlay.of(context),
                    const CustomSnackBar.success(
                      message: "Contact Informations Saved Successfully",
                    ),
                  );
                } else {
                  showTopSnackBar(
                    Overlay.of(context),
                    const CustomSnackBar.error(
                      message:
                          "Please Fill-Out All Upper Informations And Try Again Later",
                    ),
                  );
                }
              },
              child: const Icon(Icons.save),
            )
          : FloatingActionButton(
              child: const Icon(Icons.save),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 2),
                    content: const Text('Photo Uploaded Successfully'),
                    action: SnackBarAction(
                        label: "Next",
                        onPressed: () {
                          ContactInfoData.imagePath = imageLocal;
                          Navigator.of(context).pop();
                        }),
                  ),
                );
              }),
    );
  }

  Future<void> getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        imageLocal = File(pickedFile.path);
      });
    }
  }
}
