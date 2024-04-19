import 'dart:io';

import 'package:flutter/material.dart';

class Utils {
  static List<Map<String, dynamic>> resumeBuilderData = [
    {
      'icon': 'assets/icons/achievement.png',
      'title': 'Contact Information',
      'navigator': 'contactInfo',
      'index': 1,
    },
    {
      'icon': 'assets/icons/briefcase.png',
      'title': 'Carrier Objective',
      'navigator': 'carrierObjective',
      'index': 2,
    },
    {
      'icon': 'assets/icons/user.png',
      'title': 'Personal Details',
      'navigator': 'personDetails',
      'index': 3,
    },
    {
      'icon': 'assets/icons/mortarboard.png',
      'title': 'Education',
      'navigator': 'education_page',
      'index': 4,
    },
    {
      'icon': 'assets/icons/experience.png',
      'title': 'Experience',
      'navigator': 'experience_page',
      'index': 5,
    },
    {
      'icon': 'assets/icons/declaration.png',
      'title': 'Technical Skill',
      'navigator': 'technical_skill_page',
      'index': 6,
    },
    {
      'icon': 'assets/icons/declaration.png',
      'title': 'Projects',
      'navigator': 'projects_page',
      'index': 7,
    },
    {
      'icon': 'assets/icons/declaration.png',
      'title': 'Archivements',
      'navigator': 'archivements_page',
      'index': 8,
    },
    {
      'icon': 'assets/icons/declaration.png',
      'title': 'Refrence',
      'navigator': 'refrences_page',
      'index': 9,
    },
    {
      'icon': 'assets/icons/declaration.png',
      'title': 'Declaration',
      'navigator': 'declaration_page',
      'index': 10,
    },
  ];
}

class ContactInfoData {
  static String? name;
  static String? email;
  static String? phoneNum;
  static String? address;
  static File? imagePath;
  static String? careerObjective;
  static String? currentDesignation;
  static String? dateOfBirth;
  static String? maritalStatus;
  static List? languageKnown;
  static String? nationality;
  static String? courseDegree;
  static String? schoolCollage;
  static String? percentage;
  static String? yearOfPass;
  static String? companyName;
  static String? work;
  static String? rolesOptional;
  static String? employeeStatus;
  static String? dateJoined;
  static String? dateExit;
  static String? projectTitle;
  static List<String> technologiesList = [];
  static String? roles;
  static String? technologys;
  static String? projectDescription;
  static String? refranceName;
  static String? designation;
  static String? organizationInstitude;
  static String? description;
  static String? dateDeclaration;
  static String? cityDeclaration;

  static List<TextEditingController> textControllerSkills = [
    TextEditingController(),
    TextEditingController(),
  ];

  static List<TextEditingController> archivementsList = [
    TextEditingController(),
    TextEditingController(),
  ];
}
