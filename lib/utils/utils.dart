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

class ResumeData {
  String? name;
  String? email;
  String? phoneNum;
  String? address;
  File? imagePath;
  String? careerObjective;
  String? currentDesignation;
  String? dateOfBirth;
  String? maritalStatus;
  List? languageKnown;
  String? nationality;
  String? courseDegree;
  String? schoolCollage;
  String? percentage;
  String? yearOfPass;
  String? companyName;
  String? work;
  String? rolesOptional;
  String? employeeStatus;
  String? dateJoined;
  String? dateExit;
  String? projectTitle;
  List<String> technologiesList;
  String? roles;
  String? technologys;
  String? projectDescription;
  String? refranceName;
  String? designation;
  String? organizationInstitude;
  String? description;
  String? dateDeclaration;
  String? cityDeclaration;

  ResumeData({
    required this.name,
    required this.email,
    required this.phoneNum,
    required this.address,
    required this.imagePath,
    required this.careerObjective,
    required this.currentDesignation,
    required this.dateOfBirth,
    required this.maritalStatus,
    required this.languageKnown,
    required this.nationality,
    required this.courseDegree,
    required this.schoolCollage,
    required this.percentage,
    required this.yearOfPass,
    required this.companyName,
    required this.work,
    required this.rolesOptional,
    required this.employeeStatus,
    required this.dateJoined,
    required this.dateExit,
    required this.projectTitle,
    required this.technologiesList,
    required this.roles,
    required this.technologys,
    required this.projectDescription,
    required this.refranceName,
    required this.designation,
    required this.organizationInstitude,
    required this.description,
    required this.dateDeclaration,
    required this.cityDeclaration,
  });
}
